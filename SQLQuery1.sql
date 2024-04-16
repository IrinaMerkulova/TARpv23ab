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
