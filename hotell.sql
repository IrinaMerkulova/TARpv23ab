--Salvestame TARpv23ab kausta sisse CTRL+S
CREATE database hotellTsarev;
use hotellTsarev;

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES('super lux', 1),
('mega lux', 3),
('comfort', 4),
('econom', 6),
('premium', 2);
--CTRL + S
--git add .
--git commit -a -m "tabel room_type on lisatud"
--git commit -a -m "täidetud tabel room_type"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key(room_type_id) references room_type(id));
SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1),
('A15', 'rb', 'close', 1, 2),
('B5', 'vb', 'open', 0, 3),
('C20', 'tc', 'close', 1, 4),
('F25', 'kf', 'open', 0, 5);
--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git commit -a -m "täidetud tabel room"
--git push
--3. guest
CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name nvarchar(80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name, last_name, member_since)
VALUES('Kirill', 'Sats', '2024-03-12'),
('Bogdan', 'Sergachev', '2024-03-12'),
('Martin', 'Sild', '2024-03-12'),
('Irina', 'Merkulova', '2024-03-12'),
('Lev', 'Jegorov', '2024-03-12');
--CTRL + S
--git add .
--git commit -a -m "tabel guest on lisatud"
--git commit -a -m "täidetud tabel guest"
--git push
--4. reservation
CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key(guest_id) references guest(id));
SELECT * FROM reservation;
SELECT * FROM guest;
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES('2024-03-13', '2024-03-20', 'Three Crowns', 1),
('2024-03-21', '2024-03-30', 'Citybox', 2),
('2024-03-14', '2024-03-19', 'Ibis', 3),
('2024-03-16', '2024-03-27', 'Hestia', 4),
('2024-03-18', '2024-03-26', 'Radisson', 5);
--CTRL + S
--git add .
--git commit -a -m "tabel reservation on lisatud"
--git commit -a -m "täidetud tabel reservation"
--git push
--5. reserved_room
CREATE TABLE reserved_room(
id int Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
foreign key(room_type_id) references room_type(id),
reservation_id int,
foreign key(reservation_id) references reservation(id),
status varchar(20));
SELECT * FROM reserved_room;
SELECT * FROM room_type;
SELECT * FROM reservation;
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES(20 , 1, 1, 'Avatud'),
(15 , 2, 2, 'Avatud'),
(25 , 3, 3, 'Suletud'),
(10 , 4, 4, 'Avatud'),
(5 , 5, 5, 'Suletud');
--CTRL + S
--git add .
--git commit -a -m "tabel reserved_room on lisatud"
--git commit -a -m "täidetud tabel reserved_room"
--git push
--6. occupied_room
CREATE TABLE occupied_room(
id int Primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key(room_id) references room(id),
reservation_id int,
foreign key(reservation_id) references reservation(id));
SELECT * FROM occupied_room;
SELECT * FROM room;
SELECT * FROM reservation;
INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES('2024-03-25' , '2024-04-05' , 1, 1),
('2024-03-12' , '2024-04-03' , 2, 2),
('2024-03-31' , '2024-03-12' , 3, 3),
('2024-03-22' , '2024-04-02' , 4, 4),
('2024-03-11' , '2024-03-21' , 5, 5);
--CTRL + S
--git add .
--git commit -a -m "tabel occupied_room on lisatud"
--git commit -a -m "täidetud tabel occupied_room"
--git push
--7. hosted_at
CREATE TABLE hosted_at(
id int Primary key identity(1,1),
guest_id int,
foreign key(guest_id) references guest(id),
occupied_room_id int,
foreign key(occupied_room_id) references occupied_room(id));
SELECT * FROM hosted_at;
SELECT * FROM guest;
SELECT * FROM occupied_room;
INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES(1, 1),
(2, 4),
(3, 5),
(4, 6),
(5, 7);
--CTRL + S
--git add .
--git commit -a -m "tabel hosted_at on lisatud"
--git commit -a -m "täidetud tabel hosted_at"
--git push

--1.Andmete lisamine tabelisse room_type (description ja max_capacity sisestab kasutaja kui käivatab protseduuri)
CREATE PROCEDURE RoomTypeLisamine
@description varchar(100),
@max_capacity int
AS
BEGIN
INSERT INTO room_type (description, max_capacity)
VALUES (@description, @max_capacity);
SELECT * FROM room_type;
END;
--kontroll
EXEC RoomTypeLisamine 'duplex', 2;
--CTRL + S
--git add .
--git commit -a -m "lõi protseduuri RoomTypeLisamine"
--git push

--2. Kustutamis protseduur, kustutab room_type tema ID järgi (kasutaja sisestab ID ja siis room_type kustutakse)
CREATE PROCEDURE RoomTypeKustutamine
@room_typeID int
AS
BEGIN
SELECT * FROM room_type;
DELETE FROM room_type
WHERE id=@room_typeID;
SELECT * FROM room_type;
END;
--kontroll
EXEC RoomTypeKustutamine 7;
--CTRL + S
--git add .
--git commit -a -m "lõi protseduuri RoomTypeKustutamine"
--git push