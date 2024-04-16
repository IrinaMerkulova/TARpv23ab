--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellViblyy
use hotellViblyy;

--table room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);

CREATE TABLE room(
id int Primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(40),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));

SELECT * FROM room;
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10','sv', 'free', 1, 1);

CREATE TABLE guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date);

SELECT * FROM guest;
INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Tyler', 'Durden', '1999-10-15');

CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));

SELECT * FROM reservation;
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('1999-10-16', '1999-10-17',  'Robert Paulson', 1);

CREATE TABLE reserved_room(
id int Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
foreign key (room_type_id) references room_type(id),
reservation_id int,
status varchar(20),
foreign key (reservation_id) references reservation(id));

SELECT * FROM reserved_room; 
INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status) 
VALUES ('1', 1, 1, 'booked');


CREATE TABLE ocupied_room(
id int Primary key identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reservation(id));

SELECT * FROM ocupied_room;
INSERT INTO ocupied_room(check_in, check_out, room_id, reservation_id)
VALUES ('1999-10-16 17:15:01', '1999-10-17 10:10:22', 1 , 1)

CREATE TABLE hosted_at(
id int Primary key identity(1,1),
guest_id int,
foreign key (guest_id) references guest(id),
ocupied_room_id int,
foreign key (ocupied_room_id) references ocupied_room(id));

SELECT * FROM hosted_at;
INSERT INTO hosted_at(guest_id, ocupied_room_id)
VALUES (1, 1)


-- See protseduur on tehtud selleks et lisada uue reservatsiooni (üksikasjalikumalt kirjeldatud gitkommentis) --
CREATE PROCEDURE Create_Reservation
-- Kirjutame andmeid mis me lisame hiljem: --
    @date_in date,
    @date_out date,
    @made_by varchar(20),
    @guest_id int,
    @room_type_id int,
    @number_of_rooms int
AS
BEGIN
    DECLARE @reservation_id int;
    
    -- Siin me lisame andmeid tabelile (reservation) --
    INSERT INTO reservation (date_in, date_out, made_by, guest_id)
    VALUES (@date_in, @date_out, @made_by, @guest_id);
    
    SET @reservation_id = SCOPE_IDENTITY();
    
    -- Siin me lisame andmeid tabelile (reserved_room) --
    INSERT INTO reserved_room (number_of_rooms, room_type_id, reservation_id, status)
    VALUES (@number_of_rooms, @room_type_id, @reservation_id, 'booked');
END;
GO



