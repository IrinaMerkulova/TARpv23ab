--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellHalchenko
use hotellHalchenko;

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type (description, max_capacity) 
Values (' super lux', 1); 

--DROP TABLE room_type;
-- DELETE FROM room_type;