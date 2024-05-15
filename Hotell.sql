create database HotellBasirov
use HotellBasirov

--room_type tabeli loomine 
CREATE TABLE room_type(
id int Primary key identity (1,1),
description varchar (80),
max_capacity int);

INSERT INTO room_type(description, max_capacity)
VALUES ('Common', 1);
