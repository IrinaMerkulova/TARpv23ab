--Salvestmine TARpv23ab kasuta sisse CTRL + S
CREATE DATABASE hotellMilishenko; 
use hotellMilishenko;

-- tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description ,max_capacity) VALUES('super lux', 2),('lux', 3);
--DROP TABLE room_type;
--DELETE FROM room_type;
--CTRL + S
--git add . / git commit -a -m "room_type loodud"

--tabel room 
CREATE TABLE room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int
foreign key references room_type(id));

insert into room(number, name, status, smoke,room_type_id) VALUES ('101','classroom','vaba',0,1);

CREATE TABLE guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);


INSERT INTO guest(first_name, last_name, member_since) VALUES ('Aleksander','Milisheno','2020-02-20');

CREATE TABLE reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int foreign key references guest(id));

INSERT INTO reservation(date_in,date_out, made_by, guest_id) VALUES ('2024-04-15','2024-04-17','xz',1);