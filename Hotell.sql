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

--guest tabeli loomine
CREATE TABLE guest(
id int Primary key identity (1,1),
first_name varchar (80),
last_name varchar (80),
member_since date);

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Timur', 'Basirov', '2024-02-19');

--reservation tabeli loomine
CREATE TABLE reservation(
id int Primary key identity (1,1),
date_in date,
date_out date,
made_by varchar (20),
guest_id int,
foreign key (guest_id) references guest(id));

INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2024-02-19', '2024-02-20', 'HotellBasirov', 1);

--reserved_room tabeli loomine
CREATE TABLE reserved_room(
id int Primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));

INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('100', 1, 1 , 'broneeritud');
