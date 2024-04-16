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

