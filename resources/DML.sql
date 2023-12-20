SET ECHO ON;
-- Insert data into Stations table
INSERT INTO Stations (StationID, StationName) VALUES ('MAS', 'Chennai Central');
INSERT INTO Stations (StationID, StationName) VALUES ('MS', 'Chennai Egmore');
INSERT INTO Stations (StationID, StationName) VALUES ('TBM', 'Tambaram');
INSERT INTO Stations (StationID, StationName) VALUES ('AJJ', 'Arakkonam');
INSERT INTO Stations (StationID, StationName) VALUES ('KPD', 'Katpadi');
INSERT INTO Stations (StationID, StationName) VALUES ('JTJ', 'Jolarpet');
INSERT INTO Stations (StationID, StationName) VALUES ('SA', 'Salem');
INSERT INTO Stations (StationID, StationName) VALUES ('ED', 'Erode');
INSERT INTO Stations (StationID, StationName) VALUES ('CBE', 'Coimbatore');
INSERT INTO Stations (StationID, StationName) VALUES ('VM', 'Villupuram');
INSERT INTO Stations (StationID, StationName) VALUES ('TPJ', 'Trichy');
INSERT INTO Stations (StationID, StationName) VALUES ('MDU', 'Madurai');
INSERT INTO Stations (StationID, StationName) VALUES ('TEN', 'Tirunelveli');
INSERT INTO Stations (StationID, StationName) VALUES ('BWT', 'Bangarapet');
INSERT INTO Stations (StationID, StationName) VALUES ('KSR', 'KSR Bengaluru');

-- Insert data into Trains table
INSERT INTO Trains (TrainID, TrainName) VALUES (12675, 'Kovai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12673, 'Cheran Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (20643, 'Coimbatore VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12658, 'Bengaluru Chennai Mail');
INSERT INTO Trains (TrainID, TrainName) VALUES (12027, 'KSR Bengaluru Shatapti');
INSERT INTO Trains (TrainID, TrainName) VALUES (20607, 'Bengaluru VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (20665, 'Tirunelveli VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12631, 'Nellai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12633, 'Kanyakumari Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22649, 'Yercaud Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22671, 'Tejas Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12693, 'Pearl City Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22625, 'Bengaluru Double Decker Express');

-- Insert data into WeeklySchedules table
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (1, 12675, 'MAS', 'CBE', TO_TIMESTAMP('2023-01-01 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (2, 12673, 'MAS', 'CBE', TO_TIMESTAMP('2023-01-02 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (3, 20643, 'MAS', 'CBE', TO_TIMESTAMP('2023-01-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (4, 12658, 'MAS', 'KSR', TO_TIMESTAMP('2023-01-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (5, 12027, 'MAS', 'KSR', TO_TIMESTAMP('2023-01-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (6, 20607, 'MAS', 'KSR', TO_TIMESTAMP('2023-01-06 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-06 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (7, 20665, 'MS', 'TEN', TO_TIMESTAMP('2023-01-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-07 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (8, 12631, 'MS', 'TEN', TO_TIMESTAMP('2023-01-08 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-08 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (9, 12633, 'MS', 'TEN', TO_TIMESTAMP('2023-01-09 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-09 20:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (10, 22649, 'MAS', 'ED', TO_TIMESTAMP('2023-01-10 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-10 21:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (11, 22671, 'MS', 'MDU', TO_TIMESTAMP('2023-01-11 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-11 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (12, 12693, 'MS', 'TEN', TO_TIMESTAMP('2023-01-12 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-12 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime) VALUES (13, 22625, 'MAS', 'KSR', TO_TIMESTAMP('2023-01-13 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-01-13 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insert data into TicketAvailability table
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (1, 12675, 1, 200, 500.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (2, 12673, 2, 150, 450.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (3, 20643, 3, 100, 350.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (4, 12658, 4, 180, 550.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (5, 12027, 5, 160, 500.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (6, 20607, 6, 120, 400.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (7, 20665, 7, 220, 600.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (8, 12631, 8, 200, 550.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (9, 12633, 9, 180, 500.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (10, 22649, 10, 120, 400.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (11, 22671, 11, 250, 700.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (12, 12693, 12, 180, 500.00);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (13, 22625, 13, 200, 550.00);

-- Insert data into StationSequence table
    -- Station sequences for TrainID 12675 (Kovai Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (1, 1, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (2, 1, 'AJJ', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (3, 1, 'KPD', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (4, 1, 'JTJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (5, 1, 'SA', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (6, 1, 'ED', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (7, 1, 'CBE', 7);

    -- Station sequences for TrainID 12673 (Cheran Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (8, 2, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (9, 2, 'AJJ', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (10, 2, 'KPD', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (11, 2, 'JTJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (12, 2, 'SA', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (13, 2, 'ED', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (14, 2, 'CBE', 7);

    -- Station sequences for TrainID 20643 (Coimbatore VB)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (15, 3, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (16, 3, 'SA', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (17, 3, 'ED', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (18, 3, 'CBE', 4);

    -- Station sequences for TrainID 12658 (Bengaluru Chennai Mail)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (19, 4, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (20, 4, 'AJJ', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (21, 4, 'KPD', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (22, 4, 'JTJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (23, 4, 'BWT', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (24, 4, 'KSR', 6);

    -- Station sequences for TrainID 12027 (KSR Bengaluru Shatapti)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (25, 5, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (26, 5, 'KPD', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (27, 5, 'JTJ', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (28, 5, 'BWT', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (29, 5, 'KSR', 5);

    -- Station sequences for TrainID 20607 (Bengaluru VB)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (30, 6, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (31, 6, 'AJJ', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (32, 6, 'KPD', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (33, 6, 'JTJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (34, 6, 'BWT', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (35, 6, 'KSR', 6);

    -- Station sequences for TrainID 20665 (Tirunelveli VB)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (36, 7, 'MS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (37, 7, 'TBM', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (38, 7, 'VM', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (39, 7, 'TPJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (40, 7, 'MDU', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (41, 7, 'TEN', 6);

    -- Station sequences for TrainID 12631 (Nellai Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (42, 8, 'MS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (43, 8, 'TBM', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (44, 8, 'VM', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (45, 8, 'TPJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (46, 8, 'MDU', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (47, 8, 'TEN', 6);

    -- Station sequences for TrainID 12633 (Kanyakumari Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (48, 9, 'MS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (49, 9, 'TBM', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (50, 9, 'VM', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (51, 9, 'TPJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (52, 9, 'MDU', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (53, 9, 'TEN', 6);

    -- Station sequences for TrainID 22649 (Yercaud Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (54, 10, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (55, 10, 'KPD', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (56, 10, 'JTJ', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (57, 10, 'SA', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (58, 10, 'ED', 5);

    -- Station sequences for TrainID 22671 (Tejas Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (59, 11, 'MS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (60, 11, 'TBM', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (61, 11, 'TPJ', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (62, 11, 'MDU', 4);

    -- Station sequences for TrainID 12693 (Pearl City Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (63, 12, 'MS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (64, 12, 'TBM', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (65, 12, 'TPJ', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (66, 12, 'TEN', 4);

    -- Station sequences for TrainID 22625 (Bengaluru Double Decker Express)
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (67, 13, 'MAS', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (68, 13, 'AJJ', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (69, 13, 'KPD', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (70, 13, 'JTJ', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (71, 13, 'BWT', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, StopOrder) VALUES (72, 13, 'KSR', 6);


COMMIT;