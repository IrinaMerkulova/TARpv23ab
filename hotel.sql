--Salvestmine TARpv23ab kasuta sisse CTRL + S
CREATE DATABASE hotellMilishenko; 
use hotellMilishenko;

-- tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description ,max_capacity) VALUES('super lux', 2),('lux', 3);
--DROP TABLE room_type;
--DELETE FROM room_type;
--CTRL + S
--git add . / git commit -a -m "room_type loodud"

--tabel room 
CREATE TABLE room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int
foreign key references room_type(id));
insert into room(number, name, status, smoke,room_type_id) VALUES ('101','classroom','vaba',0,1);
SELECT * FROM room

CREATE TABLE guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

INSERT INTO guest(first_name, last_name, member_since) VALUES ('Aleksander','Milisheno','2020-02-20');
SELECT * FROM guest

CREATE TABLE reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int foreign key references guest(id));
INSERT INTO reservation(date_in,date_out, made_by, guest_id) VALUES ('2020-02-20','2020-02-20','xz',1);
SELECT * FROM reservation
CREATE TABLE reserved_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int foreign key references room_type(id),
reservation_id int foreign key references reservation(id),
status varchar(20)
);
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status) VALUES (0, 1, 1, 'vaba');

CREATE TABLE occupied_room(
id int primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int foreign key references room(id),
reservation_id int foreign key references reservation(id)
);
INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id) VALUES ('2020-02-20','2020-02-20 15:55:55',1,1);
CREATE TABLE hosted_at(
id int primary key identity(1,1),
guest_id int foreign key references guest(id),
occupied_room_id int foreign key references occupied_room(id)
);

INSERT INTO hosted_at(guest_id, occupied_room_id) VALUES (1,1);

create procedure room_type_lisamine
@description varchar(80),
@max_capacity int
AS
BEGIN
INSERT INTO room_type(description, max_capacity) VALUES(@description, @max_capacity);
SELECT * FROM room_type;
END;

EXEC room_type_lisamine 'deluxe', 5;

create procedure room_type_kustuta
@room_type_id int
AS
BEGIN
SELECT * FROM room_type;
DELETE FROM room_type WHERE id like @room_type_id;
SELECT * FROM room_type;
END;
EXEC room_type_kustuta 3

create procedure tabeli_uuendamine 
@tabeli_nimi varchar(50),
@valik varchar(100),
@veerunimi varchar(100),
@tyyp varchar(100),
@kustutaks_id int
AS
BEGIN
DECLARE @STMT AS VARCHAR(MAX);
DECLARE @STFT AS VARCHAR(MAX);
SET @STFT = concat('SELECT * FROM ', @tabeli_nimi);
IF @valik = 'ADD'
SET @STMT = concat('ALTER TABLE ', @tabeli_nimi, ' ADD ', @veerunimi, ' ', @tyyp);
ELSE IF @valik = 'DELETE'
SET @STMT = CONCAT('DELETE FROM ', @tabeli_nimi , ' WHERE id like ', @kustutaks_id );
ELSE IF @valik = 'DROP'
SET @STMT = CONCAT('ALTER TABLE ', @tabeli_nimi, ' DROP ', @veerunimi, ' ');
END;
BEGIN;
EXEC (@STFT);
EXEC (@STMT);
EXEC (@STFT);
END;
EXEC tabeli_uuendamine 'room_type', 'DELETE', 'None', 'None', 2;

create procedure tabeli_kustuta
@tabeli_nimi varchar(50)
AS
BEGIN 
DECLARE @STMT AS VARCHAR(MAX);
SET @STMT = CONCAT('DROP TABLE ', @tabeli_nimi);
END;
BEGIN;
EXEC (@STMT);
END;
EXEC tabeli_kustuta 'hosted_at'