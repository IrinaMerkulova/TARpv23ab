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
values('E11', 'sv', 'open', 1, 1);

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
create table reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));

select * from reservation;


insert into reservation(date_in, date_out, made_by, guest_id)
values('2024-03-03', '2024-03-04', 'Abudabi', 1);

-- 5. reserved_room
create table reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key(room_type_id) references room_type(id),
foreign key(reservation_id) references reservation(id));

select * from reserved_room;

insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values(11, 11, 1, 'good');
-- 6. occupied_room

-- 7. hosted_at