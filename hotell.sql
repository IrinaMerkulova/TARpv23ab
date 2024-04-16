-- Salvestame TARpv23ab kausta sisse CTRL + S
create database hotellSild;
use hotellSild;

-- tabel room_type
create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int);
select * from room_type;
insert into room_type(description, max_capacity)
values('SUPER LUX',1)

--drop table room_type;
--delete from room_type;
--where id = ...

--tabel room

create table room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id));

select * from room
select * from room_type

insert into room(number,name,status,smoke,room_type_id)
values ('E10', 'sv', 'open', 1, 1);

--tabel guest

create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name nvarchar(80),
member_since date);

insert into guest(first_name,last_name,member_since)
values ('Martin', 'Sild' , '2007-08-09');

select * from guest

--tabel reservation

create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));

select * from reservation

insert into reservation(date_in,date_out,made_by,guest_id)
values ('2023-08-06', '2023-09-01', 'Martin Sild',1)

