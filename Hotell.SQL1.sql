--Salvestsme TARpv23ab kaust sisse CTRL+S
Create database hotellDavidL1;
use hotellDavidL1

--tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);
INSERT INTO room_type(description, max_capacity)
VALUES ('lux', 2);
INSERT INTO room_type(description, max_capacity)
VALUES ('super', 3);
INSERT INTO room_type(description, max_capacity)
VALUES ('normal', 4);
INSERT INTO room_type(description, max_capacity)
VALUES ('good', 5);

DROP TABLE room_type;
DELETE FROM room_type;
--CTRL+S
--git add.
--git commit -a -m "tabel room_type on lisatud"
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
SELECT * FROM room_type;
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E10', 'sv', 'open', 1, 1);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E11', 'sd', 'open', 1, 2);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E12', 'sf', 'open', 1, 3);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E13', 'sq', 'closed', 1, 4);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E14', 'so', 'open', 1, 5);


--3.gues
CREATE TABLE gues(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
number_since date);
SELECT * FROM gues;
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('David', 'Lennuk', '2007.04.01');
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('Erik', 'Gerega', '2006.08.15');
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('Danik', 'Eikhveld', '2005.01.05');
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('Denis', 'Dark', '2008.06.03');
INSERT INTO gues(first_name, last_name, number_since)
VALUES ('Den', 'Derik', '2007.07.01');


--4.reservation
CREATE TABLE reservation(
id int Primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references gues(id));
SELECT * FROM reservation;
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2020-04-26', '2023-05-01', 'DavidLennuk', '1');
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2023-06-22', '2024-08-12', 'DavidLennuk', '2');
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2019-10-25', '2020-12-12', 'DavidLennuk', '3');
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2020-02-09', '2023-07-03', 'DavidLennuk', '7');
INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2022-08-12', '2024-10-12', 'DavidLennuk', '8');

--5.reserved_room
CREATE TABLE reservation_room(
id int Primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM reservation_room;
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('10', '1', '1', 'open');
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('11', '2', '2', 'open');
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('12', '3', '3', 'open');
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('13', '4', '7', 'closed');
INSERT INTO reservation_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('14', '5', '8', 'open');


--6.occupied_room
CREATE TABLE occupied_room(
id int Primary key identity(1,1),
check_id datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM occupied_room;
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('10:30:10', '13:20:15', 1, 1);
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('13:25:17', '14:20:15', 2, 2);
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('14:25:10', '16:18:15', 3, 3);
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('10:30:10', '13:20:15', 4, 8);
INSERT INTO occupied_room(check_id, check_out, room_id, reservation_id)
VALUES ('10:30:10', '13:20:15', 5, 9);
--7.hostel_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES gues(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
select * from hosted_at
select * from gues
select * from occupied_room
insert into hosted_at(guest_id,occupied_room_id)
values(1,1);
insert into hosted_at(guest_id,occupied_room_id)
values(2,2);
insert into hosted_at(guest_id,occupied_room_id)
values(3,3);
insert into hosted_at(guest_id,occupied_room_id)
values(7,5);
insert into hosted_at(guest_id,occupied_room_id)
values(8,6);



--1)võimaldab leida arvutustes inimest, mis algab tähega i
Create procedure otsingitaht_from_gues
 @taht char(1)
as 
begin
 select first_name, last_name, number_since from gues
 where first_name like @taht + '%'
end;
go
exec otsingitaht_from_gues 'i';

--2)võimaldab broneeringu ID abil kustutada
create procedure Kustuta_reservation
 @kustutumisID int
as 
begin
 delete from reservation
 where id = @kustutumisID;
end;
go
exec Kustuta_reservation 2;


--3)

--Procedure Lisamise kord uue guest
create procedure Uue_gues
 @first_name varchar(80),
 @last_name varchar(80),
 @member_since DATE
as 
begin 
 insert into gues(first_name, last_name, number_since)
 values(@first_name, @last_name, @member_since);
end;
go
exec ('Daiv', 'Miki', '2007.05.09');