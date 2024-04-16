--Salvesame TARpv23ab kausta sisse CTRL+S
create database hotellKudriashev;
use hotellKudriashev;

--tabel room_type
CREATE TABLE room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description,max_capacity)
VALUES ('super ultra mega lux',1),
('super ultra lux',2),
('super mega lux',3),
('super lux',4),
('lux',5);

--tabel room
CREATE TABLE room(
id int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(10),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number,name,status,smoke,room_type_id)
VALUES ('E10','sv','open',1,1),
('E07','mo','open',0,3),
('B133','nv','closed',1,2),
('B144','jp','open',1,4),
('B222','ur','open',0,3);

--tabel guest
CREATE TABLE guest(
id int PRIMARY KEY identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name,last_name,member_since)
VALUES ('Vladislav','Kudriašev','2007-02-25'),
('David','Lennuk','2022-03-21'),
('Marija','Gorbunova','2021-06-10'),
('Kirill','Sats','2022-04-12'),
('Tarrare','The French','1798-02-25');

--tabel reservation
CREATE TABLE reservation(
id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));
SELECT * FROM reservation;
SELECT * FROM guest;
INSERT INTO reservation(date_in,date_out,made_by,guest_id)
VALUES ('2007-02-25','2024-04-16','ADEO Hotels','1'),
('2017-02-25','2056-04-16','ADEO Hotels','2'),
('2013-02-25','2568-02-13','ADEO Hotels','3'),
('2014-02-25','9999-01-01','ADEO Hotels','4'),
('2012-02-25','2131-04-29','ADEO Hotels','5');

--tabel reserved_room
CREATE TABLE reserved_room(
id int PRIMARY KEY identity(1,1),
number_of_rooms int,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id),
reservation_id int,
FOREIGN KEY (reservation_id) references reservation(id),
status varchar(20));
SELECT * FROM room_type;
SELECT * FROM reservation;
SELECT * FROM reserved_room;
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status)
VALUES (250,1,1,'puhastus'),
(256,2,5,'puhastus'),
(128,3,4,'avatud'),
(64,4,3,'suletud'),
(32,5,2,'avatud');

--tabel occupied_room
CREATE TABLE occupied_room(
id int PRIMARY KEY identity(1,1),
check_in date,
check_out date,
room_id int,
FOREIGN KEY (room_id) references room(id),
reservation_id int,
FOREIGN KEY (reservation_id) references reservation(id));
SELECT * FROM room;
SELECT * FROM reservation;
SELECT * FROM occupied_room;
INSERT INTO occupied_room(check_in,check_out,room_id,reservation_id)
VALUES ('2007-02-25','2024-04-16',1,1),
('2017-02-25','2131-04-29',2,5),
('2013-02-25','2568-02-13',4,3),
('2014-02-25','2056-04-16',3,4),
('2012-02-25','9999-01-01',5,2);

--tabel hosted_at
CREATE TABLE hosted_at(
id int PRIMARY KEY identity(1,1),
guest_id int,
FOREIGN KEY (guest_id) references guest(id),
occupied_room_id int,
FOREIGN KEY (occupied_room_id) references occupied_room(id));
SELECT * FROM guest;
SELECT * FROM occupied_room;
SELECT * FROM hosted_at;
INSERT INTO hosted_at(guest_id,occupied_room_id)
VALUES (1,1), 
(2,5),
(3,4),
(4,3),
(5,2);

--proceduur guestLisamine
-- Võtab eesnime (eesnimi), perekonnanime (perenimi) ja liikme_alates ning lisab sisestatud andmed tabeli lõppu.

CREATE PROCEDURE guestLisamine
@first_name varchar(80),
@last_name varchar(80),
@member_since date
AS
BEGIN
INSERT INTO guest(first_name,last_name,member_since) VALUES
(@first_name,@last_name,@member_since);
SELECT * FROM guest;
END;

EXEC guestLisamine 'Lev','Egorov','2022-04-05'

--proceduur roomUpdate
-- Aktsepteerib ID, numbri, nime, oleku, suitsu ja ruumi_tüübi_id, kus see asendab kõik väärtused pärast id selles väärtuses, kus on sisestatud ID.

CREATE PROCEDURE roomUpdate
@id int,
@uus_number varchar(10),
@uus_name varchar(10),
@uus_status varchar(10),
@uus_smoke bit,
@uus_room_type_id int
AS
BEGIN
UPDATE room
SET number = @uus_number,
name = @uus_name,
status = @uus_status,
smoke = @uus_smoke,
room_type_id = @uus_room_type_id
WHERE id = @id;
SELECT * FROM room;
END;

EXEC roomUpdate 1,'E10','im','closed',0,1

--proceduur reservationOtsimine
-- Võtab kirja ja tagastab kõik made_bys, mis algavad selle tähega.

CREATE PROCEDURE reservationOtsimine
@taht char(1)
AS
BEGIN
SELECT guest_id,made_by
FROM reservation
WHERE made_by like concat(@taht, '%')
END;

EXEC reservationOtsimine A