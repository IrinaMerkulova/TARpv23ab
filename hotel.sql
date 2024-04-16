--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellOstapjuk;
use hotellOstapjuk;

--tabeli room_type
create table room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
select * from room_type
insert into room_type(description,max_capacity)
values('super lux',1);

--tabeli room loomine
create table room(
id int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) REFERENCES room_type(id));
Select * from room;
Select * from room_type
insert into room(number,name,status,smoke,room_type_id)
Values ('E10','sv','open',1,1);

--tabel guest
create table guest(
id int PRIMARY KEY identity(1,1),
first_name varchar(80),
last_name varchar(80) not null,
member_since date);
Select * from guest;
insert into guest(first_name,last_name,member_since)
values ('Kolja','Veelo','2023.06.18');

--tabel reservation
create table reservation(
id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id));
select * from reservation
select * from guest
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2024.04.16','2024.04.23','Kolja Veelo',1)