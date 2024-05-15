create database HotellBasirov
use HotellBasirov

--room_type tabeli loomine 
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);

INSERT INTO room_type(description, max_capacity)
VALUES ('Common', 1);

--room tabeli loomine 
CREATE TABLE room(
id int Primary key identity (1,1),
number varchar (10),
name varchar (40),
status varchar (10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));

INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('A09', 'LUX', 'open', 1, 1);
