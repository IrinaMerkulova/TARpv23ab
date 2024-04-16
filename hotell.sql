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