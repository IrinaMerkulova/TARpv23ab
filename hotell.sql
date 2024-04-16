--Salvesame TARpv23ab kausta sisse CTRL+S
create database hotellKudriashev;
use hotellKudriashev;

--tabel room_type
CREATE TABLE room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type
INSERT INTO room_type(description,max_capacity)
VALUES ('super ultra mega lux',1);