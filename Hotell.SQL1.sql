--Salvestsme TARpv23ab kaust sisse CTRL+S
Create database hotellDavidL1;
use hotellDavidL1

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE room_type;
DELETE FROM room_type;
--CTRL+S
--git add.
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);

--3.gues
CREATE TABLE gues(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
number_since date);
SELECT * FROM gues;
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('David', 'Lennuk', '2007.04.01');

--4.reservation
CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references gues(id));
SELECT * FROM reservation;
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2020-04-26', '2023-05-01', 'DavidLennuk', '1');

--5.reserved_room
CREATE TABLE reservation_room(
id int Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM reservation_room;
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('10', '1', '1', 'open');

--6.occupied_room
CREATE TABLE occupied_room(
id int Primary key identity(1,1),
check_id datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM occupied_room;
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('10:30:10', '13:20:15', 1, 1);
--7.hostel_at
