--Salvestame TArpv23ab kausta sisse CTRL+S
create database hotellGerega;
use hotellGerega;

--tabel room_type
create table room_type(
id int primary key identity (1,1),
description varchar(80),
max_capacity int);
select * from room_type;
insert into room_type(description, max_capacity)
values ('Super lux', 1);


--tabel room
create table room(
id int primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
select * from room_type
select * from room
insert into room(number, name, status, smoke, room_type_id)
values('E10', 'sv', 'open', 1, 1)


--tabel guest
create table guest(
id int primary key identity (1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
select * from guest
insert into guest(first_name, last_name, member_since)
values('Lev', 'Jegorov', '2000.07.14')