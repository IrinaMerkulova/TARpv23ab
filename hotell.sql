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

--tabel reservation_room

create table reservation_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),

foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));

select * from reservation_room

insert into reservation_room (number_of_rooms, room_type_id,reservation_id,status)
values (1,1,1,'open');

--tabel occupied_room

create table occupied_room(
id int primary key identity(1,1),
check_in date,
check_out date,
room_id int,
reservation_id int,

foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));

select * from occupied_room

insert into occupied_room (check_in, check_out, room_id, reservation_id)
values ('2023-08-23','2023-12-01',1,1);

--tabel hosted_at

create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,

foreign key (guest_id) references guest(id),
foreign key (occupied_room_id) references occupied_room(id));

insert into hosted_at (guest_id,occupied_room_id)
values (1,1)

select * from hosted_at

--Uue külalise lisamine 
--procedure lisab uue eesnime, perenime ja millal on tulnud

CREATE PROCEDURE AddGuest
    @first_name VARCHAR(80),
    @last_name NVARCHAR(80),
    @member_since DATE
AS
BEGIN
    INSERT INTO guest (first_name, last_name, member_since)
    VALUES (@first_name, @last_name, @member_since);
END;

EXECUTE AddGuest @first_name = 'Lev', @last_name = 'Jegorov', @member_since = '2023-01-15';
EXECUTE AddGuest @first_name = 'Seva', @last_name = 'Tsarev', @member_since = '2023-12-12';
EXECUTE AddGuest @first_name = 'Bogdan', @last_name = 'Sergatsov', @member_since = '2023-08-23';
EXECUTE AddGuest @first_name = 'Kirill', @last_name = 'Sats', @member_since = '2023-11-20';

select * from guest

CREATE PROCEDURE AddRoomType
    @description VARCHAR(80),
    @max_capacity INT
AS
BEGIN
    INSERT INTO room_type (description, max_capacity)
    VALUES (@description, @max_capacity);
END;

EXECUTE AddRoomType @description = 'Standard', @max_capacity = 10;
EXECUTE AddRoomType @description = 'Econom', @max_capacity = 3;
EXECUTE AddRoomType @description = 'Prime', @max_capacity = 4;
EXECUTE AddRoomType @description = 'Lux', @max_capacity = 5;

select * from room_type

