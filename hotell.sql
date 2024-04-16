--Salvesta TARpv23ab kausta sisse CTPL+S 
create database hotellAllik;
use hotellAllik;

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

DROP TABLE room_type;
DELETE FROM room_type;

-- CTRL + S
-- git add .
-- git commit -a -m "tabel room_type on lisatud"
-- git push

-- tabel room
CREATE TABLE room(
id int Primary key identity (1,1),
number varchar (10),
name varchar (40),
status varchar (10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;

INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);

-- CTRL + S
-- git add .
-- git commit -a -m "tabel room on lisatud"
-- git push

-- tabel guest
CREATE TABLE guest(
id int Primary key identity (1,1),
first_name varchar (80),
last_name varchar (80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Valeria', 'Allik', '2024-04-16');

-- CTRL + S
-- git add .
-- git commit -a -m "tabel guest on lisatud"
-- git push

-- tabel reservation
CREATE TABLE reservation(
id int Primary key identity (1,1),
date_in date,
date_out date,
made_by varchar (20),
guest_id int,
foreign key (guest_id) references guest(id));
SELECT * FROM reservation;

INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2024-04-16', '2024-04-26', 'TallinnHotell', 1);

-- CTRL + S
-- git add .
-- git commit -a -m "tabel reservation on lisatud"
-- git push

-- tabel reserved_room
CREATE TABLE reserved_room(
id int Primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM reserved_room;

INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('505', 1, 1 , 'puhastamine');

DROP TABLE reserved_room;

-- CTRL + S
-- git add .
-- git commit -a -m "tabel reserved_room on lisatud"
-- git push

-- tabel occupied_room
CREATE TABLE occupied_room(
id int Primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM occupied_room;

INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES ('2024-04-23 15:30:45', '2024-05-01 12:15:40', 1, 1);

DROP TABLE occupied_room;

-- CTRL + S
-- git add .
-- git commit -a -m "tabel occupied_room on lisatud"
-- git push

-- table hosted_at
CREATE TABLE hosted_at(
id int Primary key identity (1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
SELECT * FROM hosted_at; 

INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES (1, 1);

-- CTRL + S
-- git add .
-- git commit -a -m "tabel hosted_at on lisatud"
-- git push