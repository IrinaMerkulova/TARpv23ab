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


--tabel reservation
create table reservation(
id int primary key identity (1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));
select * from reservation
select * from guest
insert into reservation(date_in, date_out, made_by, guest_id)
values('2024.04.01', '2024.04.10', 'Timur Bashirov', 1)


--tabel reserved_room
create table reserved_room(
id int primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (reservation_id) references reservation(id),
foreign key (room_type_id) references room_type(id));
select * from reserved_room
select * from reservation
select * from room_type
insert into reserved_room(number_of_rooms, room_type_id, reservation_id, status)
values('10', '1', '1','booked')

--tabel occupled_room
create table occupled_room(
id int primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key(room_id) references room(id),
reservation_id int,
foreign key(reservation_id) references reservation(id));
select * from occupled_room
select * from reservation
select * from room
insert into occupled_room(check_in, check_out, room_id, reservation_id)
values('2024-04-01 08:30', '2024-04-10 20:45', '1','1')


--tabel hosted_at
create table hosted_at(
id int primary key identity (1,1),
guest_id int,
foreign key(guest_id) references guest(id),
occupled_room_id int,
foreign key(occupled_room_id) references occupled_room(id));
select * from hosted_at
select * from occupled_room
select * from guest
insert into hosted_at(guest_id, occupled_room_id)
values('1', '4');

--
--protseduur lisab uue guesti
create procedure add_guest(
@new_first_name varchar(80),
@new_last_name varchar(80),
@new_member_since date)
as
begin
	insert into guest(first_name, last_name, member_since)
	values(@new_first_name, @new_last_name, @new_member_since);
end

exec add_guest 'Erik', 'Gerega','2024-02-16'
select * from guest