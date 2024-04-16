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
values('super lux', 1);