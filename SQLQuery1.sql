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
