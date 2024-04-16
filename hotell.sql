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
values('Super Luxury Suite', 2),
('Deluxe Room', 3),
('Standard Room', 4),
('Economy Room', 1),
('Executive Suite', 2);
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
insert into guest(first_name, last_name, member_since)
values('John',' Shmid', '2023-03-14');
select * from guest

-- luuan reservation
create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));
insert into reservation(date_in, date_out, made_by)
values('2023-05-16',' 2023-05-18', 'alex');
select * from reservation

-- luuan tabel reserved_room 
create table reserved_room(
id int primary key identity(1,1),
number_of_room int,
room_type_id int 
foreign key (room_type_id) references room_type(id),
reservation_id int,
foreign key (reservation_id) references reservation(id),
status varchar(20));
INSERT INTO reserved_room (number_of_room, status)
VALUES 
(101, 'Booked'),   
(102, 'Reserved'),  
(103, 'Occupied'),  
(104, 'Pending'),   
(105, 'Confirmed'); 
select * from reserved_room 

--luuan occupied_room
create table occupied_room(
id int primary key identity(1,1),
check_in date,
check_out date,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reservation(id));

--luuan hosted_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int,
foreign key (guest_id) references guest(id));
