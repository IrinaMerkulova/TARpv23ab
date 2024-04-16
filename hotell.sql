--salvestame TARpv23ab kausta sisse ctrl+s
CREATE database hotellJegorov;
use hotellJegorov;		

--Tabel room_type
CREATE TABLE room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
values ('Studio',4);
delete from room_type where id = 3;

--git add .
--git commit -a -m ""
--git push


--tabel room
Create table room(
id int primary key identity (1,1),
number varchar(10),
name varchar (40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;

INSERT INTO room(number,name,status,smoke,room_type_id)
VALUES ('E10','sv','open',1,1);
--git push
--git add .
--git commit -a -m ""
--git push

--tabel guest
CREATE TABLE guest (
id int primary key identity (1,1),
first_name varchar(80),
Last_name nvarchar(80),
member_since date);

INSERT INTO guest(first_name,Last_name,member_since)
VALUES ('Lev','Jegorov','2007-06-28');
--tabel reservation
Create table reservation (
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY(guest_id) references guest(id));

select * from reservation

INSERT INTO reservation(date_in,date_out,made_by,guest_id)
VALUES('2020-05-24','2023-07-19','Lev Jegorov',1)

create table reservation_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));

select * from reservation_room

INSERT INTO reservation_room (number_of_rooms,room_type_id,status)
VALUES ('10','1','open');


--tabel occupied_room
CREATE TABLE occupied_room (
id int primary key identity(1,1),
check_in date,
check_out date,
room_id int,
reservation_id int,

foreign key (room_id) references room(id),
foreign key(reservation_id) references reservation(id));

insert into occupied_room (check_in,check_out,room_id,reservation_id)
VALUES ('2019-03-22','2023-03-25','1','1')

--tabel hosted_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,

foreign key(guest_id) references guest(id),
foreign key(occupied_room_id) references occupied_room(id));
insert into hosted_at (guest_id,occupied_room_id)
values (1,1)


