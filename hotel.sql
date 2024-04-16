--salvestame TARpv23ab kausta sisse
create database hotellSats;
use hotellSats;

--table room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int );
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar (40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
INSERT INTO room(number,name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);
--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--3. tabel guest
CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name,last_name, member_since)
VALUES ('Kirill', 'Sats', '2024-04-21');

--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push


--4. reservation
CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date ,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));
SELECT * FROM reservation;
INSERT INTO reservation(date_in,date_out, made_by, guest_id)
VALUES ('2024-01-01', '2024-01-07', 'DUBAI', '1');

--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--5. reserved_room
--6.occipied_room
--7.hosted_at