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