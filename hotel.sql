--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellHalchenko
use hotellHalchenko;

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
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
VALUES (1, 1);


