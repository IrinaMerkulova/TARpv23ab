--Salvestame TARpv23ab
create database hotellGorbunova
use hotellGorbunova
-- tabel roomt_type
create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int)
select * from room_type;
insert into room_type(description, max_capacity)
values('super lux', 1);
-- cntr s
-- git add .
-- git commit -a -m "tabel room_type on lisatud"
-- gti push

--tabel room
create table room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
select * from room;
select * from room_type;
insert into room (number, name, status, smoke, room_type_id)
values ('E10', 'sv', 'open',1, 1);
-- teeme tabel guest
create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date)
select * from guest
-- luuan reservation