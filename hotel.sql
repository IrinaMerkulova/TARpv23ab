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