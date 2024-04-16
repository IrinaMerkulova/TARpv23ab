--salvestame TARpv23ab kausta sisse ctrl+s
CREATE database hotellJegorov;
use hotellJegorov;		

--Tabel room_type
CREATE TABLE room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
SELECT *FROM room_type;
INSERT INTO room_type(description, max_capacity)
values ('Super lux',1);

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

create table reser