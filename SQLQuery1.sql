--Slavestame TARpv23ab kausta sisse CTRL+S
create database hotellAleksandra;
use hotellAleksandra;
--tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);


DROP TABLE room_type;
DELETE FROM room_type;
--CTRL+S
--git add.
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);

--table guest
Create table guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) not null,
member_since date);
Select * from guest;
insert into guest(first_name,last_name,member_since)
values ('Illya','Heino','2007.07.03');

--tabel reservation
create table reservation(
id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id));
select * from reservation
select * from guest
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2007.12.04','2024.04.23','Aleksandra Semjonova',1);

--tabel reserved_room
create table reserved_room(
id int PRIMARY KEY identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
FOREIGN KEY (room_type_id) REFERENCES room_type(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
Select * from reserved_room
select * from reservation
select * from room_type
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'occupied');

--tabel occupied_room
create table occupied_room(
id int PRIMARY KEY identity(1,1),
check_in time,
check_out time,
room_id int,
reservation_id int,
FOREIGN KEY (room_id) REFERENCES room(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
select * from occupied_room
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('12:50:10 ','15:31:05 ',1,1);