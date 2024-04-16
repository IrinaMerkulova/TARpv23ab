-- Salvesta TARpv23ab kausta sisse
create database hotelAntonIvanov
use hotelAntonIvanov;

create table room_type(
id int Primary key identity (1,1),
description varchar(80),
max_capacity int);
select * from room_type;
insert into room_type(description, max_capacity)
values ('lux', 1);

--drop table room_type;
--delete from room_type;

create table room(
id int Primary key identity (1,1),
number varchar(40),
name varchar(40),
status varchar(40),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
select * from room;
select * from room_type;

Insert into room (number,name,status,smoke,room_type_id)
values ('E10', 'sv', 'open', 1, 1);

-- table room on lisatud

create table guest(
id int Primary key identity (1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

select * from guest;

insert into guest (first_name,last_name,member_since)
values ('Vasili', 'Efremov', '12-2-2009');