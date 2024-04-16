--salvestame  TARpv23ab kausta sisse
create database hotellSergachev;
use hotellSergachev;

create table room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);

select * from room_type;

insert into room_type( description, max_capacity)
values('super lux', 1);

-- tabel room
create table room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));

select *from room;

insert into room(number, name, status, smoke, room_type_id)
values('E10', 'sv', 'open', 1, 1);

--CTRL +S
-- git add . 
-- git commit -a -m "tabeli room on listatud"
-- git push

-- 3. guest
create table guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

select * from guest;

insert into guest(first_name, last_name, member_since)
values ('Kirill', 'Sats', '03-03-2024');

-- 4. reservation

-- 5. reserved_room

-- 6. occupied_room

-- 7. hosted_at