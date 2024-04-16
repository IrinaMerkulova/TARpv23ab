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

insert into room_type(description, max_capacity)
values ('ultra lux', 5);

insert into room_type(description, max_capacity)
values ('micro lux', 1);

insert into room_type(description, max_capacity)
values ('washed up lux', 2);

insert into room_type(description, max_capacity)
values ('omega lux', 8);

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
values ('E11', 'dv', 'close', 0, 2);

Insert into room (number,name,status,smoke,room_type_id)
values ('E12', 'se', 'close', 0, 3);

Insert into room (number,name,status,smoke,room_type_id)
values ('E13', 'nh', 'open', 0, 4);

Insert into room (number,name,status,smoke,room_type_id)
values ('E14', 'tt', 'open', 1, 5);

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
values ('Karl', 'Melik', '2015-3-07');

insert into guest (first_name,last_name,member_since)
values ('Petr', 'Efremov', '2013-3-05');

insert into guest (first_name,last_name,member_since)
values ('Rahid', 'Uss', '2011-3-01');

insert into guest (first_name,last_name,member_since)
values ('Allah', 'Akbar', '2008-3-11');


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

insert into reservation (date_in,date_out,made_by,guest_id)
values ('2018-2-24', '2018-3-24', 'Human Worker',2);
insert into reservation (date_in,date_out,made_by,guest_id)
values ('2017-2-24', '2017-3-24', 'Human Worker',3);
insert into reservation (date_in,date_out,made_by,guest_id)
values ('2016-2-24', '2016-3-24', 'Human Worker',4);
insert into reservation (date_in,date_out,made_by,guest_id)
values ('2014-2-24', '2014-3-24', 'Human Worker',5);

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

insert into reserved_room (number_of_rooms,room_type_id,reservation_id,status)
values (3, 2, 2 , 'free');
insert into reserved_room (number_of_rooms,room_type_id,reservation_id,status)
values (4, 3, 3 , 'free');
insert into reserved_room (number_of_rooms,room_type_id,reservation_id,status)
values (1, 1, 4 , 'reserved');
insert into reserved_room (number_of_rooms,room_type_id,reservation_id,status)
values (2, 1, 5 , 'reserved');

select * from reserved_room;

-- occupied room

create table occupied_room(
id int Primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reservation(id));

insert into occupied_room (check_in,check_out,room_id,reservation_id)
values ('2019-2-24 12:00', '2019-3-24 06:00', 1 , 1);

insert into occupied_room (check_in,check_out,room_id,reservation_id)
values ('2018-2-24 07:00', '2018-3-24 06:00', 2 , 2);
insert into occupied_room (check_in,check_out,room_id,reservation_id)
values ('2017-2-24 11:00', '2017-3-24 06:00', 3 , 3);
insert into occupied_room (check_in,check_out,room_id,reservation_id)
values ('2016-2-24 10:00', '2016-3-24 06:00', 4 , 4);
insert into occupied_room (check_in,check_out,room_id,reservation_id)
values ('2015-2-24 09:00', '2015-3-24 06:00', 5 , 5);

select * from occupied_room;

-- hosted_at

create table hosted_at(
id int Primary key identity (1,1),
guest_id int,
foreign key (guest_id) references guest(id),
occupied_room_id int,
foreign key (occupied_room_id) references occupied_room(id));

select * from hosted_at;

insert into hosted_at (guest_id,occupied_room_id)
values (1,1);

insert into hosted_at (guest_id,occupied_room_id)
values (2,2);
insert into hosted_at (guest_id,occupied_room_id)
values (3,3);
insert into hosted_at (guest_id,occupied_room_id)
values (4,4);
insert into hosted_at (guest_id,occupied_room_id)
values (5,5);
