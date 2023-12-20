SET ECHO ON;
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

-- Inserts for Trains Table
INSERT INTO Trains (TrainID, TrainName) VALUES (12675, 'Kovai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12673, 'Cheran Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (20643, 'Coimbatore VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12658, 'Bengaluru Chennai Mail');
INSERT INTO Trains (TrainID, TrainName) VALUES (12027, 'KSR Bengaluru Shatabdi');
INSERT INTO Trains (TrainID, TrainName) VALUES (20607, 'Bengaluru VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (20665, 'Tirunelveli VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12631, 'Nellai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12633, 'Kanyakumari Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22649, 'Yercaud Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22671, 'Tejas Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12693, 'Pearl City Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22625, 'Bengaluru Double Decker Express');

-- Inserts for WeeklySchedules Table
-- Schedule for Kovai Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(1, 12675, 'MAS', 'CBE', '06:00', '09:30', '1111111');
-- Schedule for Cheran Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(2, 12673, 'MAS', 'CBE', '10:00', '13:30', '1111111');
-- Schedule for Coimbatore VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(3, 20643, 'MAS', 'CBE', '14:00', '17:30', '1111111');
-- Schedule for Bengaluru Chennai Mail
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(4, 12658, 'MAS', 'KSR', '18:00', '22:00', '1111111');
-- Schedule for KSR Bengaluru Shatabdi
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(5, 12027, 'MAS', 'KSR', '08:00', '12:00', '1111111');
-- Schedule for Bengaluru VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(6, 20607, 'MAS', 'KSR', '14:00', '18:00', '1111111');
-- Schedule for Tirunelveli VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(7, 20665, 'MS', 'TEN', '06:30', '11:30', '1111111');
-- Schedule for Nellai Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(8, 12631, 'MS', 'TEN', '12:00', '17:00', '1111111');
-- Schedule for Kanyakumari Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(9, 12633, 'MS', 'TEN', '17:30', '22:30', '1111111');
-- Schedule for Yercaud Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(10, 22649, 'MAS', 'ED', '09:00', '12:00', '1111111');
-- Schedule for Tejas Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(11, 22671, 'MS', 'MDU', '14:00', '16:30', '1111111');
-- Schedule for Pearl City Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(12, 12693, 'MS', 'TEN', '18:00', '22:00', '1111111');
-- Schedule for Bengaluru Double Decker Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES(13, 22625, 'MAS', 'KSR', '08:30', '12:30', '1111111');

-- Inserts for TicketAvailability Table (Assuming 100 available seats for each schedule)
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (1, 12675, 1, 100, 500);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (2, 12673, 2, 100, 550);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (3, 20643, 3, 100, 600);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (4, 12658, 4, 100, 700);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (5, 12027, 5, 100, 800);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (6, 20607, 6, 100, 750);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (7, 20665, 7, 100, 900);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (8, 12631, 8, 100, 950);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (9, 12633, 9, 100, 1000);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (10, 22649, 10, 100, 550);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (11, 22671, 11, 100, 600);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (12, 12693, 12, 100, 650);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (13, 22625, 13, 100, 750);

-- Inserts for StationSequence Table
-- Sequence for Kovai Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (1, 1, 'MAS', NULL, '06:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (2, 1, 'AJJ', '09:30', '10:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (3, 1, 'KPD', '10:30', '11:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (4, 1, 'JTJ', '11:30', '12:00', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (5, 1, 'SA', '12:30', '13:00', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (6, 1, 'ED', '13:30', '14:00', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (7, 1, 'CBE', '14:30', NULL, 7);
-- Sequence for Cheran Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (8, 2, 'MAS', NULL, '10:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (9, 2, 'AJJ', '13:30', '14:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (10, 2, 'KPD', '14:30', '15:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (11, 2, 'JTJ', '15:30', '16:00', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (12, 2, 'SA', '16:30', '17:00', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (13, 2, 'ED', '17:30', '18:00', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (14, 2, 'CBE', '18:30', NULL, 7);
-- Sequence for Coimbatore VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (15, 3, 'MAS', NULL, '14:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (16, 3, 'SA', '17:30', '18:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (17, 3, 'ED', '18:30', '19:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (18, 3, 'CBE', '19:30', NULL, 4);
-- Sequence for Bengaluru Chennai Mail
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (19, 4, 'MAS', NULL, '18:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (20, 4, 'AJJ', '22:00', '22:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (21, 4, 'KPD', '23:00', '23:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (22, 4, 'JTJ', '00:00', '00:30', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (23, 4, 'BWT', '01:00', '01:30', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (24, 4, 'KSR', '02:00', NULL, 6);
-- Sequence for KSR Bengaluru Shatabdi
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (25, 5, 'MAS', NULL, '08:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (26, 5, 'KPD', '12:00', '12:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (27, 5, 'JTJ', '13:00', '13:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (28, 5, 'BWT', '14:00', '14:30', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (29, 5, 'KSR', '15:00', NULL, 5);
-- Sequence for Bengaluru VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (30, 6, 'MAS', NULL, '14:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (31, 6, 'KPD', '18:00', '18:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (32, 6, 'KSR', '19:00', '19:30', 3);
-- Sequence for Tirunelveli VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (33, 7, 'MS', NULL, '07:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (34, 7, 'TBM', '07:30', '08:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (35, 7, 'VM', '08:30', '09:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (36, 7, 'TPJ', '09:30', '10:00', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (37, 7, 'MDU', '10:30', '11:00', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (38, 7, 'TEN', '11:30', NULL, 6);
-- Sequence for Nellai Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (39, 8, 'MS', NULL, '12:30', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (40, 8, 'TBM', '13:00', '13:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (41, 8, 'VM', '14:00', '14:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (42, 8, 'TPJ', '15:00', '15:30', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (43, 8, 'MDU', '16:00', '16:30', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (44, 8, 'TEN', '17:00', NULL, 6);
-- Sequence for Kanyakumari Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (45, 9, 'MS', NULL, '17:30', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (46, 9, 'TBM', '18:30', '19:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (47, 9, 'VM', '19:30', '20:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (48, 9, 'TPJ', '20:30', '21:00', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (49, 9, 'MDU', '21:30', '22:00', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (50, 9, 'TEN', '22:30', NULL, 6);
-- Sequence for Yercaud Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (51, 10, 'MAS', NULL, '09:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (52, 10, 'KPD', '12:00', '12:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (53, 10, 'JTJ', '13:00', '13:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (54, 10, 'SA', '14:00', '14:30', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (55, 10, 'ED', '15:00', NULL, 5);
-- Sequence for Tejas Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (56, 11, 'MS', NULL, '14:30', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (57, 11, 'TBM', '15:00', '15:30', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (58, 11, 'TPJ', '16:00', '16:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (59, 11, 'MDU', '17:00', NULL, 4);
-- Sequence for Pearl City Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (60, 12, 'MS', NULL, '18:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (61, 12, 'TBM', '18:45', '19:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (62, 12, 'TPJ', '19:15', '19:30', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (63, 12, 'TEN', '19:45', NULL, 4);
-- Sequence for Bengaluru Double Decker Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (64, 13, 'MAS', NULL, '09:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (65, 13, 'AJJ', '12:30', '13:00', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (66, 13, 'KPD', '13:30', '14:00', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (67, 13, 'JTJ', '14:30', '15:00', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (68, 13, 'BWT', '15:30', '16:00', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (69, 13, 'KSR', '16:30', NULL, 6);

-- Inserts for Trains Table
INSERT INTO Trains (TrainID, TrainName) VALUES (12676, 'Kovai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12674, 'Cheran Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (20644, 'Coimbatore VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12659, 'Bengaluru Chennai Mail');
INSERT INTO Trains (TrainID, TrainName) VALUES (12028, 'KSR Bengaluru Shatabdi');
INSERT INTO Trains (TrainID, TrainName) VALUES (20608, 'Bengaluru VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (20666, 'Tirunelveli VB');
INSERT INTO Trains (TrainID, TrainName) VALUES (12632, 'Nellai Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12634, 'Kanyakumari Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22650, 'Yercaud Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22672, 'Tejas Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (12694, 'Pearl City Express');
INSERT INTO Trains (TrainID, TrainName) VALUES (22626, 'Bengaluru Double Decker Express');

-- Inserts for WeeklySchedules Table
-- WeeklySchedule for Kovai Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (14, 12676, 'CBE', 'MAS', '06:00', '11:00', '1111111');
-- WeeklySchedule for Cheran Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (15, 12674, 'CBE', 'MAS', '10:00', '15:00', '1111111');
-- WeeklySchedule for Coimbatore VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (16, 20644, 'CBE', 'MAS', '14:00', '17:30', '1111111');
-- WeeklySchedule for Bengaluru Chennai Mail
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (17, 12659, 'KSR', 'MAS', '18:00', '22:00', '1111111');
-- WeeklySchedule for KSR Bengaluru Shatabdi
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (18, 12028, 'KSR', 'MAS', '08:00', '12:00', '1111111');
-- WeeklySchedule for Bengaluru VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (19, 20608, 'KSR', 'MAS', '14:00', '18:00', '1111111');
-- WeeklySchedule for Tirunelveli VB
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (20, 20666, 'TEN', 'MS', '06:30', '11:30', '1111111');
-- WeeklySchedule for Nellai Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (21, 12632, 'TEN', 'MS', '12:00', '17:00', '1111111');
-- WeeklySchedule for Kanyakumari Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (22, 12634, 'TEN', 'MS', '17:30', '22:30', '1111111');
-- WeeklySchedule for Yercaud Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (23, 22650, 'ED', 'MAS', '09:00', '12:00', '1111111');
-- WeeklySchedule for Tejas Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (24, 22672, 'MDU', 'MS', '14:00', '16:30', '1111111');
-- WeeklySchedule for Pearl City Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (25, 12694, 'TEN', 'MS', '18:00', '22:00', '1111111');
-- WeeklySchedule for Bengaluru Double Decker Express
INSERT INTO WeeklySchedules (ScheduleID, TrainID, StartStationID, EndStationID, DepartureTime, ArrivalTime, RunningDays) VALUES (26, 22626, 'KSR', 'MAS', '08:30', '12:30', '1111111');

-- Inserts for TicketAvailability Table (Assuming 100 available seats for each schedule)
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (14, 12676, 1, 100, 500);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (15, 12674, 2, 100, 550);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (16, 20644, 3, 100, 600);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (17, 12659, 4, 100, 700);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (18, 12028, 5, 100, 800);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (19, 20608, 6, 100, 750);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (20, 20666, 7, 100, 900);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (21, 12632, 8, 100, 950);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (22, 12634, 9, 100, 1000);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (23, 22650, 10, 100, 550);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (24, 22672, 11, 100, 600);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (25, 12694, 12, 100, 650);
INSERT INTO TicketAvailability (TicketID, TrainID, ScheduleID, AvailableSeats, Cost) VALUES (26, 22626, 13, 100, 750);


-- Inserts for StationSequence Table
-- Sequence for Kovai Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (70, 14, 'CBE', NULL, '06:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (71, 14, 'ED', '11:00', '11:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (72, 14, 'SA', '11:35', '11:40', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (73, 14, 'JTJ', '12:10', '12:15', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (74, 14, 'KPD', '12:40', '12:45', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (75, 14, 'AJJ', '13:10', '13:15', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (76, 14, 'MAS', '13:45', NULL, 7);
-- Sequence for Cheran Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (77, 15, 'CBE', NULL, '10:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (78, 15, 'ED', '15:00', '15:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (79, 15, 'SA', '15:35', '15:40', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (80, 15, 'JTJ', '16:10', '16:15', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (81, 15, 'KPD', '16:40', '16:45', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (82, 15, 'AJJ', '17:10', '17:15', 6);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (83, 15, 'MAS', '17:45', NULL, 7);
-- Sequence for Coimbatore VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (84, 16, 'CBE', NULL, '14:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (85, 16, 'ED', '17:30', '17:35', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (86, 16, 'SA', '18:05', '18:10', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (87, 16, 'MAS', '18:30', NULL, 4);
-- Sequence for Bengaluru Chennai Mail
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (88, 17, 'KSR', NULL, '18:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (89, 17, 'BWT', '22:00', '22:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (90, 17, 'JTJ', '22:35', '22:40', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (91, 17, 'KPD', '23:05', '23:10', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (92, 17, 'AJJ', '23:35', '23:40', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (93, 17, 'MAS', '00:05', NULL, 6);
-- Sequence for KSR Bengaluru Shatabdi
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (94, 18, 'KSR', NULL, '08:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (95, 18, 'BWT', '12:00', '12:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (96, 18, 'JTJ', '12:35', '12:40', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (97, 18, 'KPD', '13:05', '13:10', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (98, 18, 'MAS', '13:30', NULL, 5);
-- Sequence for Bengaluru VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (99, 19, 'KSR', NULL, '14:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (100, 19, 'KPD', '18:00', '18:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (101, 19, 'MAS', '18:30', NULL, 3);
-- Sequence for Tirunelveli VB
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (102, 20, 'TEN', NULL, '06:35', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (103, 20, 'MDU', '11:30', '11:35', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (104, 20, 'TPJ', '12:00', '12:05', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (105, 20, 'VM', '12:30', '12:35', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (106, 20, 'TBM', '13:00', '13:05', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (107, 20, 'MS', '13:30', NULL, 6);
-- Sequence for Nellai Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (108, 21, 'TEN', NULL, '12:00',  1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (109, 21, 'MDU', '17:00', '17:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (110, 21, 'TPJ', '17:30', '17:35', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (111, 21, 'VM', '18:00', '18:05', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (112, 21, 'TBM', '18:30', '18:35', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (113, 21, 'MS', '19:00', NULL, 6);
-- Sequence for Kanyakumari Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (114, 22, 'TEN', NULL, '17:35', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (115, 22, 'MDU', '22:30', '22:35', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (116, 22, 'TPJ', '23:00', '23:05', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (117, 22, 'VM', '23:30', '23:35', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (118, 22, 'TBM', '00:00', '00:05', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (119, 22, 'MS', '00:30', NULL, 6);
-- Sequence for Yercaud Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (120, 23, 'ED', NULL, '09:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (121, 23, 'SA', '12:00', '12:05', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (122, 23, 'JTJ', '12:30', '12:35', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (123, 23, 'KPD', '13:00', '13:05', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (124, 23, 'MAS', '13:30', NULL, 5);
-- Sequence for Tejas Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (125, 24, 'MDU', NULL, '14:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (126, 24, 'TPJ', '16:30', '16:35', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (127, 24, 'TBM', '17:00', '17:05', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (128, 24, 'MS', '17:30', NULL, 4);
-- Sequence for Pearl City Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (129, 25, 'TEN', NULL, '18:00', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (130, 25, 'TPJ', '18:15', '18:20', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (131, 25, 'TBM', '18:30', '18:35', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (132, 25, 'MS', '18:45', NULL, 4);
-- Sequence for Bengaluru Double Decker Express
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (133, 26, 'KSR', NULL, '08:30', 1);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (134, 26, 'BWT', '12:30', '12:35', 2);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (135, 26, 'JTJ', '13:00', '13:05', 3);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (136, 26, 'KPD', '13:30', '13:35', 4);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (137, 26, 'AJJ', '14:00', '14:05', 5);
INSERT INTO StationSequence (SequenceID, ScheduleID, StationID, ArrivalTime, DepartureTime, StopOrder) VALUES (138, 26, 'MAS', '14:30', NULL, 6);

COMMIT;
