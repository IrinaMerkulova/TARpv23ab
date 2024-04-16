--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellHalchenko
use hotellHalchenko;

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type (description , max_capacity) 
VALUES ('standard', 35), 
( 'luksus', 15), 
('presidendi sviit', 10), 
( 'tavaline', 100); 
INSERT INTO room_type (description, max_capacity) 
Values (' super lux', 1); 

--DROP TABLE room_type;
-- DELETE FROM room_type;


-- tabel room
CREATE TABLE room(
id int Primary key identity (1,1),
number varchar (10),
name varchar (40),
status varchar (10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) REFERENCES room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room (number, name, status, smoke, room_type_id) 
VALUES ('B220', 'Oksana', 'open', 1, 2), 
('B340', 'Valeria', 'open', 1, 3), 
('E312', 'Maks', 'open', 1, 4), 
('A13', 'Vlad', 'open', 1, 5);
INSERT INTO room(number, name, status, smoke, room_type_id) 
Values ('E10', 'sv', 'open', 1, 1);

--tabel guest
CREATE TABLE guest(
id int Primary key identity (1,1),
first_name varchar (80),
last_name varchar (80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name, last_name, member_since) 
Values ('Darja', 'Jermitsova', '2024-04-21'),
('Sofiia', 'Halchenko', '2024-04-24'),
('Valeria', 'Allik', '2024-04-21'),
('Anton', 'Ivanov', '2024-04-17');
INSERT INTO guest(first_name, last_name, member_since) 
Values ('Daria', 'Halchenko', '2024-10-4');

--reservation
CREATE TABLE reservation(
id int Primary key identity (1,1),
date_in date,
date_out date,
made_by varchar (20),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id));
SELECT * FROM reservation;
SELECT * FROM guest;
INSERT INTO reservation (date_in, date_out, made_by, guest_id)
VALUES ('2024-10-11', '2024-04-17', 'Anton', 2), 
('2024-05-16', '2024-05-16', 'Irina', 3), 
('2024-04-17', '2024-04-26', 'Vlad', 4), 
('2024-04-24', '2024-04-30', 'Maksim', 5);
INSERT INTO reservation(date_in, date_out, made_by, guest_id) 
Values ('2024-10-11', '2025-10-12', 'Eleon', 1);

--reserved_room
CREATE TABLE reserved_room(
id int Primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
FOREIGN KEY (room_type_id) REFERENCES room_type(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
SELECT * FROM reserved_room;
SELECT * FROM room_type;
SELECT * FROM reservation;
INSERT INTO reserved_room (number_of_rooms, room_type_id, reservation_id, status) 
VALUES ( '102', 1, 1, 'open'), 
( '103', 2, 4, 'open'), 
('211', 4, 3, 'open'), 
( '106', 3, 5, 'open');
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('101', 1, 1, 'puhastamine');



-- tabel occupied_room
CREATE TABLE occupied_room(
id int Primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM occupied_room;
SELECT * FROM room;
SELECT * FROM reservation;
INSERT INTO occupied_room (check_in, check_out, room_id, reservation_id) 
VALUES ('2024-04-26 11:23:39', '2024-05-16 11:23:36', 2, 3), 
('2024-04-26 14:23:36', '2024-04-27 14:23:36', 2, 5), 
('2024-04-18 11:23:36', '2024-04-30 11:23:36', 5, 4), 
( '2024-04-26 17:23:36', '2024-04-29 17:23:36', 1, 1);
INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES ('2024-9-23 12:30:56', '2024-10-24 13:45:13', 1, 1);

--hosted_at
CREATE TABLE hosted_at(
id int Primary key identity (1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
SELECT * FROM hosted_at; 
SELECT * FROM guest;
SELECT * FROM occupied_room;
INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES (2, 5), 
(4, 2), 
(5, 3), 
(3, 4);
INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES (1, 1);

-- Andmete lisamine tabelisse guest (guest ja Kirjeldus sisestab kasutaja kui käivatab protseduuri)
CREATE PROCEDURE guestLisamine 
@first_name varchar (80),
@last_name varchar (80),
@member_since date
AS
Begin 
INSERT INTO guest(first_name, last_name, member_since) 
Values (@first_name, @last_name, @member_since);
SELECT * FROM guest;
END;

-- kontroll 
EXEC guestLisamine  'Vlad', 'Kudriaðev', '2024-11-14';


--Uuendamis protseduur. Kasutaja sisestab uuendatud made_by sisestatud id järgi.( Table reservation)
CREATE PROCEDURE reservationUuendamines
@id int,
@uusmade_by varchar (100)
AS
BEGIN 
UPDATE reservation 
SET made_by=@uusmade_by
WHERE id=@id;
SELECT * FROM reservation;
END;

-- kontroll

EXEC  reservationUuendamines 3, 'Eleonora';