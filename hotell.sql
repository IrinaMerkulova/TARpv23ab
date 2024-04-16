--Salvestame TARpv23ab kasuta sisse CTRL+S
create database hotellMyrseth;
use hotellMyrseth;

--tabel room_type
create table room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE  room_type;
DELETE FROM room_type;

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(40),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabeli guest
CREATE TABLE guest(
id int Primary key identity (1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT *FROM guest;
insert into guest(first_name, last_name, member_since)
VALUES ('David', 'Myrseth', '2024-04-16');

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push