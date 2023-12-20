SET ECHO ON;
-- Drop StationSequence Table
DROP TABLE StationSequence CASCADE CONSTRAINTS;

-- Drop TicketAvailability Table
DROP TABLE TicketAvailability CASCADE CONSTRAINTS;

-- Drop WeeklySchedules Table
DROP TABLE WeeklySchedules CASCADE CONSTRAINTS;

-- Drop Users Table
DROP TABLE Users CASCADE CONSTRAINTS;

-- Drop Trains Table
DROP TABLE Trains CASCADE CONSTRAINTS;

-- Drop Stations Table
DROP TABLE Stations CASCADE CONSTRAINTS;

-- Create Stations Table with VARCHAR2 for StationID
CREATE TABLE Stations (
    StationID VARCHAR2(10) PRIMARY KEY,
    StationName VARCHAR2(255) NOT NULL
);

-- Create Trains Table
CREATE TABLE Trains (
    TrainID NUMBER PRIMARY KEY,
    TrainName VARCHAR2(255) NOT NULL
);

-- Create WeeklySchedules Table
CREATE TABLE WeeklySchedules (
    ScheduleID NUMBER PRIMARY KEY,
    TrainID NUMBER REFERENCES Trains(TrainID),
    StartStationID VARCHAR2(10) REFERENCES Stations(StationID),
    EndStationID VARCHAR2(10) REFERENCES Stations(StationID),
    DepartureTime VARCHAR(5),
    ArrivalTime VARCHAR(5),
    RunningDays VARCHAR(7)
);

-- Create TicketAvailability Table
CREATE TABLE TicketAvailability (
    TicketID NUMBER PRIMARY KEY,
    TrainID NUMBER REFERENCES Trains(TrainID),
    ScheduleID NUMBER REFERENCES WeeklySchedules(ScheduleID),
    AvailableSeats NUMBER,
    Cost NUMBER
);

-- Create Users Table
CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    Username VARCHAR2(50) UNIQUE NOT NULL,
    Password VARCHAR2(255) NOT NULL
);

-- Create StationSequence Table
CREATE TABLE StationSequence (
    SequenceID NUMBER PRIMARY KEY,
    ScheduleID NUMBER REFERENCES WeeklySchedules(ScheduleID),
    StationID VARCHAR2(10) REFERENCES Stations(StationID),
    ArrivalTime VARCHAR(5),
    DepartureTime VARCHAR(5),
    StopOrder NUMBER
);
