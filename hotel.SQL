--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellViblyy
use hotellViblyy;

--table room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(40),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));

SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10','sv', 'free', 1, 1);

CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

SELECT * FROM guest;
INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Tyler', 'Durden', '1999-10-15');