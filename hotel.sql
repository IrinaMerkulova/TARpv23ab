--salvestame TARpv23ab kausta sisse
create database hotellSats;
use hotellSats;

--table room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int );
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1),
 ('deluxe', 2),
('super deluxe', 3),
('vip', 4),
 ('comfort', 5);



--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--tabel room
CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar (40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
SELECT * FROM room;
INSERT INTO room(number,name, status, smoke, room_type_id)
VALUES ('E11', 'Kirill', 'close', 0, 6),
('E12', 'sv', 'open', 1, 3),
('E13', 'Lev', 'close', 0, 4),
('E14', 'sv', 'open', 1, 5);
--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--3. tabel guest
CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);
SELECT * FROM guest;
INSERT INTO guest(first_name,last_name, member_since)
VALUES 
 ('Lev', 'Jegorov', '2024-01-21'),
 ('Gleb', 'Sõtsjov', '2024-01-31'),
 ('Bogdan', 'Segachev', '2023-12-24'),
 ('Seva', 'Tsarev', '2023-11-1');

--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push


--4. reservation
CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date ,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));
SELECT * FROM reservation;
INSERT INTO reservation(date_in,date_out, made_by, guest_id)
VALUES ('2023-10-11', '2023-01-07', 'DUBAI', '3'),
('2023-09-21', '2023-10-07', 'Abudabi', '4'),
('2023-08-07', '2023-08-11', 'Meie', '5'),
('2023-07-06', '2023-07-07', 'Teie', '2');

--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--5. reserved_room
CREATE TABLE reserved_room(
id int Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
FOREIGN KEY (room_type_id) references room_type(id), 
FOREIGN KEY (reservation_id) references reservation(id));
SELECT * FROM reserved_room;
INSERT INTO reserved_room(number_of_rooms,room_type_id, reservation_id, status)
VALUES 
(1, 6, 1, 'open'),
(10, 1, 10, 'open'),
(3, 4, 11, 'open'),
(4, 3, 12, 'open');
--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--6.occupied_room
CREATE TABLE occupied_room(
id int Primary key identity(1,1),
cheãk_in datetime,
chek_out datetime,
room_id int,
reservation_id int,
FOREIGN KEY (room_id) references room(id), 
FOREIGN KEY (reservation_id) references reservation(id));
SELECT * FROM occupied_room;
INSERT INTO occupied_room(cheãk_in,chek_out, room_id, reservation_id)
VALUES ('2024-12-12', '2024-12-14', 1, 1),
('2023-11-10', '2023-11-14', 5, 10),
('2023-12-01', '2023-12-14', 6, 11),
('2023-09-12', '2023-09-24', 7, 12),
('2023-08-11', '2023-08-14', 8, 13);
--CTRL + S
--git add .
--git commit -a -m "tabel room on lisatud"
--git push

--7.hosted_at
CREATE TABLE hosted_at(
id int Primary key identity(1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) references guest(id),
FOREIGN KEY (occupied_room_id) references occupied_room(id));
SELECT * FROM hosted_at;
INSERT INTO hosted_at(guest_id,occupied_room_id)
VALUES 
(2, 7),
(3, 4),
(4, 5),
(5, 6);
