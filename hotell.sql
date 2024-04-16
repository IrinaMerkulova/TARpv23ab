--Salvesame TARpv23ab kausta sisse CTRL+S
create database hotellKudriashev;
use hotellKudriashev;

--tabel room_type
CREATE TABLE room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description,max_capacity)
VALUES ('super ultra mega lux',1);

--tabel room
CREATE TABLE room(
id int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(10),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number,name,status,smoke,room_type_id)
VALUES ('E10','sv','open',1,1);

--tabel room
CREATE TABLE guest(
id int PRIMARY KEY identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name,last_name,member_since)
VALUES ('Vladislav','Kudriaðev','2007-02-25');

--tabel reservation
CREATE TABLE reservation(
id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));
SELECT * FROM reservation;
SELECT * FROM guest;
INSERT INTO reservation(date_in,date_out,made_by,guest_id)
VALUES ('2007-02-25','2024-04-16','ADEO Hotels','1');

--tabel reserved_room
CREATE TABLE reserved_room(
id int PRIMARY KEY identity(1,1),
number_of_rooms int,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id),
reservation_id int,
FOREIGN KEY (reservation_id) references reservation(id),
status varchar(20));
SELECT * FROM room_type;
SELECT * FROM reservation;
SELECT * FROM reserved_room;
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status)
VALUES ('250',1,1,'puhastus');