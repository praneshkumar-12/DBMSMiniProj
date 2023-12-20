import matplotlib.pyplot as plt


def display_train_schedule(train_schedule):
    stations = [item["station"] for item in train_schedule]
    arrival_times = [item["arrival_time"] for item in train_schedule]
    departure_times = [item["departure_time"] for item in train_schedule]

    # Plotting arrival times
    plt.barh(stations, arrival_times, color="skyblue", label="Arrival Time")

    # Plotting departure times
    plt.barh(stations, departure_times, color="orange", label="Departure Time")

    plt.xlabel("Time")
    plt.title("Train Schedule")
    plt.legend()
    plt.show()


if __name__ == "__main__":
    # Sample train schedule data
    train_schedule_data = [
        {
            "station": "Station A",
            "arrival_time": "10:00 AM",
            "departure_time": "10:15 AM",
        },
        {
            "station": "Station B",
            "arrival_time": "11:00 AM",
            "departure_time": "11:30 AM",
        },
        # Add more data as needed
    ]

    display_train_schedule(train_schedule_data)
import graphviz


def display_train_sequence(train_schedule):
    dot = graphviz.Digraph(comment="Train Schedule", format="png")

    for i, station in enumerate(train_schedule[:-1]):
        dot.node(str(i), station["station"])
        dot.node(str(i + 1), train_schedule[i + 1]["station"])
        dot.edge(
            str(i),
            str(i + 1),
            label=f"Arrival: {station['arrival_time']}\nDeparture: {station['departure_time']}",
        )

    dot.render("train_schedule", format="png", cleanup=True)
    dot.view()


if __name__ == "__main__":
    # Sample train schedule data
    train_schedule_data = [
        {
            "station": "Station A",
            "arrival_time": "10:00 AM",
            "departure_time": "10:15 AM",
        },
        {
            "station": "Station B",
            "arrival_time": "11:00 AM",
            "departure_time": "11:30 AM",
        },
        {
            "station": "Station C",
            "arrival_time": "12:00 PM",
            "departure_time": "12:15 PM",
        },
        # Add more data as needed
    ]

    display_train_sequence(train_schedule_data)
