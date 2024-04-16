--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellKirilltsogankov2;
use hotellKirilltsogankov2;

---tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE room_type;
DELETE FROM room_type;

---CTRL+S
--git add .
--git commit -a -m "tabel room_type on listatud"
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

INSERT INTO room(number,name,status,smoke,room_type_id)
VALUES ('E10','sv','open',1, 1);

---CTRL+S
--git add .
--git commit -a -m "tabel room on listatud"
--git push

--3. guest
CREATE TABLE guest(
id int Primary key identity(1,1),
first_name Varchar(80),
last_name Varchar(80) not null,
member_since date)
SELECT * FROM guest;

--4. reservation
CREATE TABLE reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int foreign key (guest_id) references guest(id))
SELECT * FROM reservation;

insert into reservation(date_in,date_out,made_by,guest_id)
values('2024-01-10','2024-01-15','Worker: Mikro Mikle',1)
insert into reservation(date_in,date_out,made_by,guest_id)
values('2024-02-21','2024-02-29','Worker: Mikro Mikle',2)

--5. reserved_room
create table reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int foreign key (room_type_id) references room_type(id),
reservation_id int foreign key (reservation_id) references reservation(id),
satus varchar(20));

SELECT * FROM reserved_room;

insert into reserved_room(number_of_rooms,room_type_id,reservation_id,satus)
values(1,1,1,'not reserved')
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,satus)
values(1,2,2,'not reserved')

--6. occupied_room
CREATE TABLE occupied_room(

--7. hosted_at
CREATE TABLE hosted_at(
