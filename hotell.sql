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