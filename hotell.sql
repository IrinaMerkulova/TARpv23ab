--Salvestame TARpv23ab kasuta sisse CTRL+S
create database hotellMyrseth;
use hotellMyrseth;

--tabel room_type
create table room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE  room_type;
DELETE FROM room_type;

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(40),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabeli guest
CREATE TABLE guest(
id int Primary key identity (1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT *FROM guest;
insert into guest(first_name, last_name, member_since)
VALUES ('David', 'Myrseth', '2024-04-16');

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

--tabeli reservation
CREATE TABLE reservation(
id int Primary key identity (1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));
SELECT * FROM reservation;
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES('2024-04-16', '2024-04-30', 'TallinnHotell', 1);

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

CREATE TABLE reserved_room(
id int Primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));

INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES(505, 1, 1, 'puhastamine');
SELECT * FROM reserved_room;

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

CREATE TABLE occupied_room(
id int Primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_Id) references reservation(id));
SELECT * FROM occupied_room;
INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES('2024-04-25 17:38:24', '2024-04-30 19:20:30', 1, 1);

DELETE FROM occupied_room WHERE id = 1;

--CTRL S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git push

CREATE TABLE hosted_at(
id int Primary key identity (1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
SELECT * FROM hosted_at; 

INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES (1, 2);
SELECT * FROM hosted_at;
DROP TABLE hosted_at;
SELECT * FROM occupied_room;