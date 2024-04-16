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