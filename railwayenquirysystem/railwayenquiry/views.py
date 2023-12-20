from django.shortcuts import render, redirect
from django.http import HttpResponse
import cx_Oracle
from datetime import datetime


connection_string = "system/system@localhost:1521/xe"
# username/password@host:port/service_name

# lsnrctl services - service <service_name> has <n> instances; <service_name> is host string - first one is the service_name
connection = cx_Oracle.connect(connection_string)


# Create your views here.
def login(request):
    if request.method == "POST":
        email = request.POST.get("email")
        password = request.POST.get("password")

        cursor = connection.cursor()

        command = f"SELECT PASSWORD FROM USERS WHERE USERNAME='{email}'"
        cursor.execute(command)

        result_set = cursor.fetchall()

        if not result_set:
            context = {"error": "Invalid credentials!"}
            return render(request, "index.html", context)
        elif result_set[0][0] != password:
            context = {"error": "Invalid credentials!"}
            return render(request, "index.html", context)
        elif result_set[0][0] == password:
            return redirect("/res/app/admin/")

    return render(request, "index.html")


def get_stations_context():
    cursor = connection.cursor()

    cursor.execute("SELECT * FROM stations")

    stations = cursor.fetchall()

    stations_context = {}

    for station in stations:
        temp = {}
        temp["stationid"] = station[0]
        temp["stationname"] = station[1]
        stations_context[len(stations_context)] = temp

    context = {"stations": stations_context}

    return context


def get_cancellation_status(train_id, date):
    cursor = connection.cursor()

    command = f"SELECT * FROM CANCELLEDTRAINS WHERE TRAINID='{train_id}' AND CANCELLATIONDATE=TO_DATE('{date}', 'YYYY-MM-DD')"

    cursor.execute(command)

    result_set = cursor.fetchall()

    if result_set:
        return True
    else:
        return False


def search_for_trains(request):
    today_date = datetime.now().strftime("%Y-%m-%d")
    if request.method == "GET":
        context = get_stations_context()
        context.update({"cal_date": today_date})
        return render(request, "search_for_trains.html", context=context)
    else:
        origin = request.POST.get("origin").replace("origin-", "")
        destination = request.POST.get("destination").replace("dest-", "")

        date = request.POST.get("journey-date")

        date_string = date  # Replace this with your date in "yyyy-mm-dd" format
        date_object = datetime.strptime(date_string, "%Y-%m-%d")

        day_of_week = date_object.strftime("%A")

        if day_of_week == "Monday":
            runningdays = "_1_____"
        elif day_of_week == "Tuesday":
            runningdays = "__1____"
        elif day_of_week == "Wednesday":
            runningdays = "___1___"
        elif day_of_week == "Thursday":
            runningdays = "____1__"
        elif day_of_week == "Friday":
            runningdays = "_____1_"
        elif day_of_week == "Saturday":
            runningdays = "______1"
        elif day_of_week == "Sunday":
            runningdays = "1______"

        if origin == destination:
            context = get_stations_context()
            context.update({"error": "Source and Destination cannot be the same!"})
            context.update({"cal_date": today_date})
            return render(request, "search_for_trains.html", context=context)

        cursor = connection.cursor()

        command = """SELECT
        WS.TRAINID,
        T.TRAINNAME,
        A.AVAILABLESEATS,
        A.COST,
        WS.ARRIVALTIME AS ARRIVAL_AT_START,
        WS.DEPARTURETIME AS DEPARTURE_FROM_START,
        WS_END.ARRIVALTIME AS ARRIVAL_AT_END,
        WS_END.DEPARTURETIME AS DEPARTURE_FROM_END
        FROM
            WEEKLYSCHEDULES WS
        JOIN
            AVAILABILITY A ON WS.TRAINID = A.TRAINID
        JOIN
            TRAINS T ON WS.TRAINID = T.TRAINID
        JOIN
            WEEKLYSCHEDULES WS_END ON WS.TRAINID = WS_END.TRAINID
        JOIN
            RUNNINGDAYS RD ON RD.TRAINID = WS.TRAINID
        WHERE
            WS.HALTSTATIONID = '{0}'
            AND WS_END.HALTSTATIONID = '{1}'
            AND WS.SEQUENCENUMBER < WS_END.SEQUENCENUMBER
            AND RD.RUNNINGDAYS LIKE '{2}'
        """.format(
            origin, destination, runningdays
        )


        cursor.execute(command)

        result_set = cursor.fetchall()

        if not result_set:
            new_context = get_stations_context()
            new_context.update({"error": "No trains are available!"})
            new_context.update({"cal_date": today_date})
            return render(request, "search_for_trains.html", context=new_context)

        context = {}

        temp = {}

        for idx, item in enumerate(result_set):
            train_dict = {
                "TrainID": item[0],
                "TrainName": item[1],
                "DepartingStation": origin,
                "DepartureTime": item[5],
                "ArrivalStation": destination,
                "ArrivalTime": item[6],
                "AvailableSeats": item[2],
                "Cost": item[3],
            }

            if get_cancellation_status(item[0], date):
                train_dict["RunningStatus"] = "Cancelled/Diverted"
            else:
                train_dict["RunningStatus"] = "Running"
            format_str = "%H:%M"

            time1 = datetime.strptime(item[5], format_str)
            time2 = datetime.strptime(item[6], format_str)

            time_diff = time2 - time1

            hours, remainder = divmod(time_diff.seconds, 3600)
            minutes = remainder // 60

            train_dict["JourneyTime"] = f"{hours} hours {minutes} minutes"

            temp[idx + 1] = train_dict

        context["trains"] = temp

        new_context = get_stations_context()
        context.update(new_context)
        context.update(
            {"sel_origin": origin, "sel_dest": destination, "cal_date": date}
        )

        return render(request, "search_for_trains.html", context=context)


def display_route(request, route_details):
    train_number, origin, destination = route_details.split("_")
    context = {
        "source_station_code": origin,
        "destination_station_code": destination,
        "train_number": train_number,
    }

    cursor = connection.cursor()

    cursor.execute(f"SELECT TRAINNAME FROM TRAINS WHERE TRAINID={train_number}")

    train_name = cursor.fetchall()[0][0]

    cursor.execute(f"SELECT STATIONNAME FROM STATIONS WHERE STATIONID='{origin}'")

    source_station = cursor.fetchall()[0][0]

    cursor.execute(f"SELECT STATIONNAME FROM STATIONS WHERE STATIONID='{destination}'")

    destination_station = cursor.fetchall()[0][0]

    cursor.execute(
        f"SELECT WS.STARTSTATIONID, WS.HALTSTATIONID, WS.ENDSTATIONID, WS.ARRIVALTIME, WS.DEPARTURETIME, S.STATIONNAME FROM WEEKLYSCHEDULES WS JOIN STATIONS S ON S.STATIONID=WS.HALTSTATIONID WHERE WS.TRAINID='{train_number}' ORDER BY WS.SEQUENCENUMBER"
    )

    result = cursor.fetchall()

    train_route = {}

    flag = False

    counter = 1

    isidx = -1

    for idx, row in enumerate(result):
        temp = {}
        startstationid = row[0]
        haltstationid = row[1]
        endstationid = row[2]
        arrivaltime = row[3]
        departuretime = row[4]

        if haltstationid == origin:
            flag = True
            isidx = 0

        if flag:
            temp["startstationid"] = row[0]
            temp["haltstationid"] = row[1]
            temp["endstationid"] = row[2]
            temp["arrivaltime"] = row[3]
            temp["departuretime"] = row[4]
            temp["station_name"] = row[5]

            if row[3] is None:
                temp["arrivaltime"] = "-"
                temp["halttime"] = "0 mins"
                temp["JourneyTime"] = "0 hours 0 minutes"

            if row[4] is None:
                temp["departuretime"] = "-"
                temp["halttime"] = "0 mins"

            if row[3] is not None and row[4] is not None:
                format_str = "%H:%M"

                time1 = datetime.strptime(row[3], format_str)
                time2 = datetime.strptime(row[4], format_str)

                time_diff = time2 - time1

                time_diff_minutes = time_diff.total_seconds() / 60

                temp["halttime"] = str(int(time_diff_minutes)) + " mins"

            if row[3] is not None:
                format_str = "%H:%M"

                time1 = datetime.strptime(result[idx - 1][4], format_str)
                time2 = datetime.strptime(row[3], format_str)

                time_diff = time2 - time1

                hours, remainder = divmod(time_diff.seconds, 3600)
                minutes = remainder // 60

                temp["JourneyTime"] = f"{hours} hours {minutes} minutes"

            train_route[counter] = temp

            if isidx == 0:
                temp["JourneyTime"] = "0 hours 0 minutes"
                isidx = -1

            counter += 1

            if haltstationid == destination:
                flag = False
                break

    context.update(
        {
            "route": train_route,
            "train_name": train_name,
            "source_station": source_station,
            "destination_station": destination_station,
        }
    )

    return render(request, "display_route.html", context)


def show_all_trains(request):
    cursor = connection.cursor()

    command = """SELECT
    t.TRAINNAME,
    t.TRAINID AS TRAINNUMBER,
    s_start.STATIONNAME AS STARTSTATION,
    s_end.STATIONNAME AS ENDSTATION,
    ws_start.DEPARTURETIME,
    ws_end.ARRIVALTIME,
    rd.RUNNINGDAYS
    FROM
        TRAINS t
    JOIN
        WEEKLYSCHEDULES ws_start ON t.TRAINID = ws_start.TRAINID AND ws_start.STARTSTATIONID = ws_start.HALTSTATIONID
    JOIN
        WEEKLYSCHEDULES ws_end ON t.TRAINID = ws_end.TRAINID AND ws_end.ENDSTATIONID = ws_end.HALTSTATIONID
    JOIN
        STATIONS s_start ON ws_start.STARTSTATIONID = s_start.STATIONID
    JOIN
        STATIONS s_end ON ws_end.ENDSTATIONID = s_end.STATIONID
    JOIN
        RUNNINGDAYS rd ON t.TRAINID = rd.TRAINID
    """

    cursor.execute(command)

    result_set = cursor.fetchall()

    context = {}

    temp = {}

    for idx, item in enumerate(result_set):
        run = item[6]
        days = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]

        runningdays = []

        for i in range(len(run)):
            if run[i] == "1":
                runningdays.append(days[i])

        cursor.execute(f"SELECT STATIONID FROM STATIONS WHERE STATIONNAME='{item[2]}'")

        source_station = cursor.fetchall()[0][0]

        cursor.execute(f"SELECT STATIONID FROM STATIONS WHERE STATIONNAME='{item[3]}'")

        destination_station = cursor.fetchall()[0][0]

        train_dict = {
            "TrainID": item[1],
            "TrainName": item[0],
            "DepartingStation": item[2],
            "DepartureTime": item[4],
            "ArrivalStation": item[3],
            "ArrivalTime": item[5],
            "DepartingStationCode": source_station,
            "ArrivalStationCode": destination_station,
            "RunningDays": ",".join(runningdays),
        }

        format_str = "%H:%M"

        time1 = datetime.strptime(item[4], format_str)
        time2 = datetime.strptime(item[5], format_str)

        time_diff = time2 - time1

        hours, remainder = divmod(time_diff.seconds, 3600)
        minutes = remainder // 60

        train_dict["JourneyTime"] = f"{hours} hours {minutes} minutes"

        temp[idx + 1] = train_dict

    context["trains"] = temp

    return render(request, "all_tarains.html", context)


def fetch_train_name(train_id):
    cursor = connection.cursor()

    train_name = cursor.callfunc("FETCH_TRAIN_NAME", cx_Oracle.STRING, [train_id])

    return train_name


def fetch_station_name(station_id):
    cursor = connection.cursor()

    station_name = cursor.callfunc("FETCH_STATION_NAME", cx_Oracle.STRING, [station_id])
    
    return station_name


def cancelled_trains(request):
    cursor = connection.cursor()

    command = """
    SELECT TRAINID, CANCELLATIONDATE, FROMSTATION, TOSTATION
    FROM CANCELLEDTRAINS"""

    cursor.execute(command)

    result_set = cursor.fetchall()

    temp = {}
    context = {}

    for idx, item in enumerate(result_set):
        train_dict = {
            "TrainID": item[0],
            "TrainName": fetch_train_name(item[0]),
            "Date": "-".join(str(item[1]).replace(" 00:00:00", "").split("-")[::-1]),
            "FromStation": f"{fetch_station_name(item[2])} - {item[2]}",
            "ToStation": f"{fetch_station_name(item[3])} - {item[3]}",
        }

        temp[idx + 1] = train_dict

    context["trains"] = temp

    return render(request, "cancelled_trains.html", context)


def homepage(request):
    return render(request, "homepage.html")


def edit_stations(request):
    if request.method == "POST":
        action = None

        if "add-station" in request.POST:
            action = "add-station"
        elif "delete-station" in request.POST:
            action = "delete-station"

        if action == "add-station":
            stationid = request.POST.get("stationId", "")
            stationname = request.POST.get("stationName", "")

            if (not stationid) or (not stationname):
                return render(
                    request,
                    "edit_stations.html",
                    {"alertmessage": "Provide both Station ID and Station Name."},
                )

            command = f"INSERT INTO stations VALUES('{stationid}', '{stationname}')"

            cursor = connection.cursor()
            try:
                cursor.execute(command)
            except cx_Oracle.IntegrityError:
                return render(
                    request,
                    "edit_stations.html",
                    {"alertmessage": "Station already exists!"},
                )

            connection.commit()

            return render(
                request,
                "edit_stations.html",
                {"alertmessage": f"Added station: {stationid} - {stationname}"},
            )

        elif action == "delete-station":
            stationid = request.POST.get("stationId", "")

            if not stationid:
                return render(
                    request,
                    "edit_stations.html",
                    {"alertmessage": "Provide Station ID."},
                )

            command = f"SELECT stationname FROM STATIONS WHERE stationid='{stationid}'"

            cursor = connection.cursor()

            cursor.execute(command)

            result = cursor.fetchone()

            if not result:
                return render(
                    request,
                    "edit_stations.html",
                    {"alertmessage": "No such station found!"},
                )

            command = f"DELETE FROM stations WHERE stationid='{stationid}'"

            try:
                cursor.execute(command)
            except cx_Oracle.IntegrityError:
                return render(
                    request,
                    "edit_stations.html",
                    {
                        "alertmessage": "Trains are existing with this station. Please remove them and try again!"
                    },
                )

            connection.commit()

            return render(
                request,
                "edit_stations.html",
                {"alertmessage": f"Deleted station: {stationid} - {result[0]}"},
            )

    return render(request, "edit_stations.html")


def edit_trains(request):
    if request.method == "POST":
        action = None

        if "add-train" in request.POST:
            action = "add-train"
        elif "delete-train" in request.POST:
            action = "delete-train"

        if action == "add-train":
            trainid = request.POST.get("trainNumber", "")
            trainname = request.POST.get("trainName", "")

            if (not trainid) or (not trainname):
                return render(
                    request,
                    "edit_trains.html",
                    {"alertmessage": "Provide both Train Number and Train Name."},
                )

            command = f"INSERT INTO trains VALUES('{trainid}', '{trainname}', 'REG')"

            cursor = connection.cursor()

            try:
                cursor.execute(command)
            except cx_Oracle.IntegrityError:
                return render(
                    request,
                    "edit_trains.html",
                    {"alertmessage": "Train already exists!"},
                )

            connection.commit()

            return render(
                request,
                "edit_trains.html",
                {"alertmessage": f"Added train: {trainid} - {trainname}"},
            )

        elif action == "delete-train":
            trainid = request.POST.get("trainNumber", "")

            if not trainid:
                return render(
                    request,
                    "edit_trains.html",
                    {"alertmessage": "Provide Train Number."},
                )

            command = f"SELECT trainname FROM trains WHERE trainid={trainid}"

            cursor = connection.cursor()

            cursor.execute(command)

            result = cursor.fetchone()

            if not result:
                return render(
                    request,
                    "edit_trains.html",
                    {"alertmessage": "No such train found!"},
                )

            command = f"DELETE FROM trains WHERE trainid={trainid}"

            try:
                cursor.execute(command)
            except cx_Oracle.IntegrityError:
                return render(
                    request,
                    "edit_trains.html",
                    {
                        "alertmessage": "This train is already existing with schedules. Please remove them and try again!"
                    },
                )

            connection.commit()

            return render(
                request,
                "edit_trains.html",
                {"alertmessage": f"Deleted train: {trainid} - {result[0]}"},
            )

    return render(request, "edit_trains.html")


def days_of_week_to_binary(days_input):
    days_input = days_input.lower()
    binary_string = ""

    days_mapping = {
        "sun": 0,
        "mon": 1,
        "tue": 2,
        "wed": 3,
        "thu": 4,
        "fri": 5,
        "sat": 6,
    }

    for day_char, index in days_mapping.items():
        binary_string += "1" if day_char in days_input else "0"

    return binary_string


def edit_schedules(request):
    context = get_stations_context()

    if request.method == "POST":
        train_id = request.POST.get("trainId", "").strip()
        start_station = request.POST.get("startingStation", "").strip()
        end_station = request.POST.get("endingStation", "").strip()
        arrival_time_start = request.POST.get("arrivalTime", "").strip()
        departure_time_start = request.POST.get("departureTime", "").strip()
        running_days = request.POST.get("runningDays", "").strip()

        running_days = days_of_week_to_binary(running_days.strip())

        intermediate_stations = [
            station.strip() for station in request.POST.getlist("intermediateStations")
        ]
        arrival_times = [time.strip() for time in request.POST.getlist("arrivalTimes")]
        departure_times = [
            time.strip() for time in request.POST.getlist("departureTimes")
        ]

        cursor = connection.cursor()

        command = f"SELECT COUNT(*) FROM Trains WHERE TRAINID = {train_id}"

        cursor.execute(command)

        if cursor.fetchone()[0] == 0:
            return render(
                request,
                "edit_schedule.html",
                {
                    "alertmessage": "Train not found. Please provide a valid Train ID.",
                    **context,
                },
            )

        try:
            cursor.execute(
                f"INSERT INTO RunningDays VALUES ({train_id}, '{running_days}')"
            )
        except Exception as e:
            return render(
                request,
                "edit_schedule.html",
                {
                    "alertmessage": f"Error inserting into RunningDays: {str(e)}",
                    **context,
                },
            )

        try:
            cursor.execute(
                f"INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, {train_id}, '{start_station}', '{start_station}', NULL, NULL, '{departure_time_start}')"
            )
        except Exception as e:
            return render(
                request,
                "edit_schedule.html",
                {
                    "alertmessage": f"Error inserting into WeeklySchedules: {str(e)}",
                    **context,
                },
            )

        for i, intermediate_station in enumerate(intermediate_stations):
            try:
                cursor.execute(
                    f"INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, {train_id}, NULL, '{intermediate_station}', NULL, '{arrival_times[i]}', '{departure_times[i]}')"
                )
            except Exception as e:
                return render(
                    request,
                    "edit_schedule.html",
                    {
                        "alertmessage": f"Error inserting into WeeklySchedules: {str(e)}",
                        **context,
                    },
                )

        try:
            cursor.execute(
                f"INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, {train_id}, NULL, '{end_station}', '{end_station}', '{arrival_time_start}', NULL)"
            )
        except Exception as e:
            return render(
                request,
                "edit_schedule.html",
                {
                    "alertmessage": f"Error inserting into WeeklySchedules: {str(e)}",
                    **context,
                },
            )

        connection.commit()

        return render(
            request,
            "edit_schedule.html",
            {
                "alertmessage": f"Train schedules for Train ID: {train_id} inserted successfully.",
                **context,
            },
        )

    else:
        context = get_stations_context()
        return render(request, "edit_schedule.html", context=context)


def edit_tickets(request):
    if request.method == "POST":
        action = None

        if "add-ticket" in request.POST:
            action = "add-ticket"
        elif "update-ticket" in request.POST:
            action = "update-ticket"
        elif "delete-ticket" in request.POST:
            action = "delete-ticket"

        if action == "add-ticket" or action == "update-ticket":
            trainid = request.POST.get("trainId", "")
            no_of_tickets = request.POST.get("noOfTickets", "")
            ticket_cost = request.POST.get("ticketCost", "")

            if not trainid:
                return render(
                    request, "edit_tickets.html", {"alertmessage": "Provide Train ID."}
                )

            try:
                trainid = int(trainid)
                no_of_tickets = int(no_of_tickets) if no_of_tickets else None
                ticket_cost = int(ticket_cost) if ticket_cost else None
            except ValueError:
                return render(
                    request,
                    "edit_tickets.html",
                    {"alertmessage": "Invalid input for tickets or cost."},
                )

            cursor = connection.cursor()

            if action == "add-ticket":
                if no_of_tickets is None or ticket_cost is None:
                    return render(
                        request,
                        "edit_tickets.html",
                        {
                            "alertmessage": "Provide both Number of Tickets and Ticket Cost."
                        },
                    )

                command = f"INSERT INTO AVAILABILITY VALUES({trainid}, {no_of_tickets}, {ticket_cost})"

                try:
                    cursor.execute(command)
                except cx_Oracle.IntegrityError:
                    return render(
                        request,
                        "edit_tickets.html",
                        {
                            "alertmessage": "Tickets for this train already exist. Use update option."
                        },
                    )

                connection.commit()

                return render(
                    request,
                    "edit_tickets.html",
                    {"alertmessage": f"Added tickets for train ID: {trainid}"},
                )

            elif action == "update-ticket":
                if no_of_tickets is None and ticket_cost is None:
                    return render(
                        request,
                        "edit_tickets.html",
                        {
                            "alertmessage": "Provide either Number of Tickets or Ticket Cost to update."
                        },
                    )

                update_clause = ""
                if no_of_tickets is not None:
                    update_clause += f"AVAILABLESEATS = {no_of_tickets},"
                if ticket_cost is not None:
                    update_clause += f"COST = {ticket_cost},"


                command = f"UPDATE AVAILABILITY SET {update_clause.rstrip(',')} WHERE TRAINID = {trainid}"

                try:
                    cursor.execute(command)
                except cx_Oracle.IntegrityError:
                    return render(
                        request,
                        "edit_tickets.html",
                        {
                            "alertmessage": "No tickets found for this train. Use add option."
                        },
                    )

                connection.commit()

                return render(
                    request,
                    "edit_tickets.html",
                    {"alertmessage": f"Updated tickets for train ID: {trainid}"},
                )

        elif action == "delete-ticket":
            trainid = request.POST.get("trainId", "")

            if not trainid:
                return render(
                    request, "edit_tickets.html", {"alertmessage": "Provide Train ID."}
                )

            try:
                trainid = int(trainid)
            except ValueError:
                return render(
                    request,
                    "edit_tickets.html",
                    {"alertmessage": "Invalid input for Train ID."},
                )

            command = f"DELETE FROM AVAILABILITY WHERE TRAINID = {trainid}"

            cursor = connection.cursor()

            try:
                cursor.execute(command)
            except cx_Oracle.IntegrityError:
                return render(
                    request,
                    "edit_tickets.html",
                    {"alertmessage": "No tickets found for this train."},
                )

            connection.commit()

            return render(
                request,
                "edit_tickets.html",
                {"alertmessage": f"Deleted tickets for train ID: {trainid}"},
            )

    return render(request, "edit_tickets.html")


def cancel_trains(request):
    if request.method == "POST":
        try:
            train_number = request.POST.get("trainNumber")
            start_station_id = request.POST.get("startStation").split("-")[1]
            end_station_id = request.POST.get("endStation").split("-")[1]
            cancel_date = request.POST.get("cancelDate")

            # Validation: Check if start and end stations are the same
            if start_station_id == end_station_id:
                return render(
                    request,
                    "cancel_trains.html",
                    {"alertmessage": "Start and end stations cannot be the same."},
                )

            # Insert into the CANCELLEDTRAINS table
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO CANCELLEDTRAINS
                    (SEQUENCENUMBER, TRAINID, CANCELLATIONDATE, FROMSTATION, TOSTATION)
                    VALUES (CancelledSequence.NEXTVAL, :train_id, TO_DATE(:cancel_date, 'YYYY-MM-DD'), :start_station, :end_station)
                """,
                    {
                        "train_id": int(train_number),
                        "cancel_date": cancel_date,
                        "start_station": start_station_id,
                        "end_station": end_station_id,
                    },
                )

                # Commit the transaction
                connection.commit()

            alert_message = "Cancelled/Diverted train information successfully added."
            return render(
                request, "cancel_trains.html", {"alertmessage": alert_message}
            )

        except Exception as e:
            # Handle exceptions
            error_message = str(e)
            return render(
                request,
                "cancel_trains.html",
                {"alertmessage": error_message.replace("\n", " ")},
            )
    else:
        context = get_stations_context()
        return render(request, "cancel_trains.html", context)