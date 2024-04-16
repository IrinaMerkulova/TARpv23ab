--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellOstapjuk;
use hotellOstapjuk;

--tabeli room_type
create table room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
select * from room_type
insert into room_type(description,max_capacity)
values('super lux',1);