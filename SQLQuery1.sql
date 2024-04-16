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
Insert into room_type(description_,max_capacity)
Values('LUX','4')
Insert into room_type(description_,max_capacity)
Values('Basic','3')
Insert into room_type(description_,max_capacity)
Values('Basic +','6')



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

--tabeli reserved_room
create table reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int foreign key (room_type_id) references room_type(id),
reservation_id int foreign key (reservation_id) references reservation(id),
satus varchar(20));

Select * from reserved_room;

insert into reserved_room(number_of_rooms,room_type_id,reservation_id,satus)
values(1,1,1,'not reserved')
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,satus)
values(1,2,2,'not reserved')


--tabeli occupied_room
create table occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int foreign key (room_id) references room(id),
reservation_id int foreign key (reservation_id) references reservation(id))

Select * from occupied_room

insert into occupied_room(check_in, check_out, room_id,reservation_id)
values('2024-01-12 23:12:28','2024-01-15 12:23:56', 1, 1)

-- tabeli hosted_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int foreign key (guest_id) references guest(id),
occupied_room_id int foreign key (occupied_room_id) references occupied_room(id))



select * from hosted_at;

insert into hosted_at(guest_id, occupied_room_id)
values(1,1)