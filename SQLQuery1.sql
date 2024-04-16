create database HotelliReservNadvornoi
use  HotelliReservNadvornoi
--tabeli room_type
create table room_type(
id int identity(1,1),
description_ varchar(80),
max_capacity int); 

select * from room_type;

Insert into room_type(description_,max_capacity)
Values('Super VIP LUX','5')
Insert into room_type(description_,max_capacity)
Values('Alone','1')

alter table room_type
add primary key (id)

--tabeli room 
create table room(
id int primary key identity(1,1),
number varchar(10),
name_ varchar(40),
status_  varchar(10),
smoke bit,
room_type_id int foreign key (room_type_id) references room_type(id))

select * from room;

insert into room(number,name_,status_,smoke,room_type_id)
values('A232','LUX','open','True',1)
insert into room(number,name_,status_,smoke,room_type_id)
values('A102','Alone','open','True',2)


--tabeli guest
create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) not null,
member_since date)

select * from guest;

Insert into guest(first_name,last_name,member_since)
values('Klark','Kent','2024-01-12')
Insert into guest(first_name,last_name,member_since)
values('Jolin','Kudjo','2024-02-19')

--tabeli reservation
create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int foreign key (guest_id) references guest(id))


select * from reservation;

insert into reservation(date_in,date_out,made_by,guest_id)
values('2024-01-12','2024-01-15','Worker: Allan Smitt',1)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2024-02-19','2024-02-29','Worker: Allan Smitt',2)