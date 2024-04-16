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

drop table room_type;
delete from room_type;
