--salvestame  TARpv23ab kausta sisse
create database hotellSergachev;
use hotellSergachev;

create table room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);

select * from room_type;

insert into room_type( description, max_capacity)
values('Delux', 1),
('Cheap', 1),
('Expensive', 4),
('Eco', 3);


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
values('E12', 'sv', 'open', 1, 2),
('E13', 'sv', 'open', 1, 4),
('E14', 'sv', 'open', 1, 3),
('E15', 'sv', 'open', 1, 5);


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
values ('Lev', 'Egorov', '02-02-2024');


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
values('2024-02-03', '2024-12-03', 'London', 10),
('2024-02-03', '2024-12-03', 'Lost Angeles', 11);

--CTRL +S
-- git add . 
-- git commit -a -m "tabeli room on listatud"
-- git push


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
values(10, 1, 13, 'Lux'),
(11, 1, 14, 'ECO'),
(12, 1, 15, 'Perfect');


--CTRL +S
-- git add . 
-- git commit -a -m "tabeli room on listatud"
-- git push

-- 6. occupied_room
create table occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));

select * from occupied_room;

insert into occupied_room(check_in, check_out, room_id, reservation_id)
values('2024-04-02', '2024-06-02', 1, 12),
('2024-04-02', '2024-06-02', 5, 13),
('2024-04-02', '2024-06-02', 4, 14),
('2024-04-02', '2024-06-02', 3, 15),
('2024-04-02', '2024-06-02', 2, 16);



--CTRL +S
-- git add . 
-- git commit -a -m "tabeli room on listatud"
-- git push

-- 7. hosted_at

create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,
foreign key (guest_id) references guest(id),
foreign key (occupied_room_id) references occupied_room(id));

select * from hosted_at;
select * from guest;
select * from occupied_room;

insert into hosted_at(guest_id, occupied_room_id)
values (7, 1),
(9, 2),
(8, 4),
(10, 5),
(11, 3);


--CTRL +S
-- git add . 
-- git commit -a -m "tabeli room on listatud"
-- git push