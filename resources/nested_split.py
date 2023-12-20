# l = [
#     [12675, "'MAS'", "'MAS'", "NULL", "NULL", "'06:00'"],
#     [12675, "NULL", "'AJJ'", "NULL", "'09:30'", "'10:00'"],
#     [12675, "NULL", "'KPD'", "NULL", "'10:30'", "'11:00'"],
#     [12675, "NULL", "'JTJ'", "NULL", "'11:30'", "'12:00'"],
#     [12675, "NULL", "'SA'", "NULL", "'12:30'", "'13:00'"],
#     [12675, "NULL", "'ED'", "NULL", "'13:30'", "'14:00'"],
#     [12675, "NULL", "'CBE'", "'CBE'", "'14:30'", "NULL"],
#     [12676, "'CBE'", "'CBE'", "NULL", "NULL", "'06:00'"],
#     [12676, "NULL", "'ED'", "NULL", "'09:30'", "'10:00'"],
#     [12676, "NULL", "'SA'", "NULL", "'10:30'", "'11:00'"],
#     [12676, "NULL", "'JTJ'", "NULL", "'11:30'", "'12:00'"],
#     [12676, "NULL", "'KPD'", "NULL", "'12:30'", "'13:00'"],
#     [12676, "NULL", "'AJJ'", "NULL", "'13:30'", "'14:00'"],
#     [12676, "NULL", "'MAS'", "'MAS'", "'14:30'", "NULL"],
#     [12659, "'KSR'", "'KSR'", "NULL", "NULL", "'08:30'"],
#     [12659, "NULL", "'BWT'", "NULL", "'12:30'", "'12:35'"],
#     [12659, "NULL", "'JTJ'", "NULL", "'13:00'", "'13:05'"],
#     [12659, "NULL", "'KPD'", "NULL", "'13:30'", "'13:35'"],
#     [12659, "NULL", "'AJJ'", "NULL", "'14:00'", "'14:05'"],
#     [12659, "NULL", "'MAS'", "'MAS'", "'14:30'", "NULL"],
#     [12658, "'MAS'", "'MAS'", "NULL", "NULL", "'08:30'"],
#     [12658, "NULL", "'AJJ'", "NULL", "'12:30'", "'12:35'"],
#     [12658, "NULL", "'KPD'", "NULL", "'13:00'", "'13:05'"],
#     [12658, "NULL", "'JTJ'", "NULL", "'13:30'", "'13:35'"],
#     [12658, "NULL", "'BWT'", "NULL", "'14:00'", "'14:05'"],
#     [12658, "NULL", "'KSR'", "'KSR'", "'14:30'", "NULL"],
# ]
# # print(len(l[0]))
# str1 = "INSERT INTO WeeklySchedules VALUES (WeeklyScheduleSequence.NEXTVAL,"
# for i in range(len(l)):
#     for j in range(len(l[0])):
#         a = str(l[i][j])
#         str1 = str1 + a + ","
#         # print(l[i])
#     str1 = str1[:-1:] + ");"
#     print(str1)
#     str1 = "INSERT INTO WeeklySchedules VALUES (WeeklyScheduleSequence.NEXTVAL,"
# from django.shortcuts import render
# from django.db import connection
# from django.http import HttpResponse

# def edit_schedules(request):
#     context = get_stations_context()
#     if request.method == "POST":
#         train_id = request.POST.get("trainId", "").strip()
#         start_station = request.POST.get("startingStation", "").strip()
#         end_station = request.POST.get("endingStation", "").strip()
#         arrival_time_start = request.POST.get("arrivalTime", "").strip()
#         departure_time_start = request.POST.get("departureTime", "").strip()
#         running_days = request.POST.get("runningDays", "").strip()

#         intermediate_stations = [station.strip() for station in request.POST.getlist("intermediateStations")]
#         arrival_times = [time.strip() for time in request.POST.getlist("arrivalTimes")]
#         departure_times = [time.strip() for time in request.POST.getlist("departureTimes")]


#         cursor = connection.cursor()

#         # Check if the train exists
#         cursor.execute("SELECT COUNT(*) FROM Trains WHERE TRAINID = %s", [train_id])
#         if cursor.fetchone()[0] == 0:
#             return render(request, "edit_schedule.html", {"alertmessage": "Train not found. Please provide a valid Train ID."}.update(context))

#         try:
#             cursor.execute("INSERT INTO RunningDays VALUES (%s, %s)", [train_id, running_days])
#         except Exception as e:
#             return render(request, "edit_schedule.html", {"alertmessage": f"Error inserting into RunningDays: {str(e)}"}.update(context))

#         for i, intermediate_station in enumerate(intermediate_stations):
#             # Additional validation for intermediate stations

#             try:
#                 cursor.execute("INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, %s, %s, %s, %s, %s, %s)",
#                                [train_id, None, intermediate_station, None, arrival_times[i], departure_times[i]])
#             except Exception as e:
#                 return render(request, "edit_schedule.html", {"alertmessage": f"Error inserting into WeeklySchedules: {str(e)}"}.update(context))

#         try:
#             cursor.execute("INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, %s, %s, %s, %s, %s, %s)",
#                            [train_id, start_station, start_station, None, None, arrival_time_start, None])
#         except Exception as e:
#             return render(request, "edit_schedule.html", {"alertmessage": f"Error inserting into WeeklySchedules: {str(e)}"}.update(context))

#         try:
#             cursor.execute("INSERT INTO WeeklySchedules (SEQUENCENUMBER, TRAINID, STARTSTATIONID, HALTSTATIONID, ENDSTATIONID, ARRIVALTIME, DEPARTURETIME) VALUES (WeeklyScheduleSequence.NEXTVAL, %s, %s, %s, %s, %s, %s)",
#                            [train_id, None, end_station, end_station, None, None, departure_time_start])
#         except Exception as e:
#             return render(request, "edit_schedule.html", {"alertmessage": f"Error inserting into WeeklySchedules: {str(e)}"}.update(context))

#         connection.commit()

#         return render(request, "edit_schedule.html", {"alertmessage": f"Train schedules for Train ID: {train_id} inserted successfully."}.update(context))
#     else:
#         context = get_stations_context()
#         return render(request, "edit_schedule.html", context=context)


def days_of_week_to_binary(days_input):
    days_input = days_input.lower()
    binary_string = ""

    days_mapping = {
        "mon": 0,
        "tue": 1,
        "wed": 2,
        "thu": 3,
        "fri": 4,
        "sat": 5,
        "sun": 6,
    }

    for day_char, index in days_mapping.items():
        binary_string += "1" if day_char in days_input else "0"

    return binary_string


# Example usage:
days_input = "Mon, Wed, Fri, Sun, Sat"
binary_representation = days_of_week_to_binary(days_input)
print(binary_representation)
