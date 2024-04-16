-- Salvesta TARpv23ab kausta sisse
create database hotelAntonIvanov
use hotelAntonIvanov;

-- room type 

create table room_type(
id int Primary key identity (1,1),
description varchar(80),
max_capacity int);
select * from room_type;
insert into room_type(description, max_capacity)
values ('lux', 1);

--drop table room_type;
--delete from room_type;

-- room


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

-- guest

create table guest(
id int Primary key identity (1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

select * from guest;

insert into guest (first_name,last_name,member_since)
values ('Vasili', 'Efremov', '12-2-2009');


create table reservation(
id int Primary key identity (1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));

select * from reservation;

insert into reservation (date_in,date_out,made_by,guest_id)
values ('2019-2-24', '2019-3-24', 'Human Worker',1);

-- reserved room

create table reserved_room(
id int Primary key identity (1,1),
number_of_rooms int,
room_type_id int,
foreign key (room_type_id) references room_type(id),
reservation_id int,
foreign key (reservation_id) references reservation(id),
status varchar(20));

insert into reserved_room (number_of_rooms,room_type_id,reservation_id,status)
values (2, 1, 1 , 'reserved');

select * from reserved_room;

-- occupied room