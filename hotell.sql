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