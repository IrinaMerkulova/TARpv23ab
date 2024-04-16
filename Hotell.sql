--Salvestamine TARpv23ab kasuta sisse CTRL+S
create database hotellJegorov;
use hotellJegorov;

--table room_type 
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE room_type;
DELETE FROM room_type;

CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key(room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;

INSERT INTO room(number, name, status, smoke, room_type_id)
Values ('E10', 'sv', 'open', 1, 1);



CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date)
SELECT * FROM guest;


CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key(guest_id)references guest(id));
select * from reservation


CREATE TABLE reserved_room(
id int Primary key identity(1,1),
number_of_room int,
room_type_id int
foreign key(room_type_id) references room_type(id),
reservation_id int,
foreign key(reservation_id) references reservation(id),
status varchar (20));
select * from reserved_room


