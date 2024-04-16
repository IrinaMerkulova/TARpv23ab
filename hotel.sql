--Salvestame TARpv23ab kausta sisse CTRL+S
create database hotellOstapjuk;
use hotellOstapjuk;

--tabeli room_type
create table room_type(
id int PRIMARY KEY identity(1,1),
description varchar(80),
max_capacity int);
select * from room_type
insert into room_type(description,max_capacity)
values('super lux',1);
insert into room_type(description,max_capacity)
values('lux',2);
insert into room_type(description,max_capacity)
values('family',5);
insert into room_type(description,max_capacity)
values('common',2);
insert into room_type(description,max_capacity)
values('economy',4);

--tabeli room loomine
create table room(
id int PRIMARY KEY identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) REFERENCES room_type(id));
Select * from room;
Select * from room_type
insert into room(number,name,status,smoke,room_type_id)
Values ('E10','sv','open',1,1);
insert into room(number,name,status,smoke,room_type_id)
Values ('E13','cm','open',0,4);
insert into room(number,name,status,smoke,room_type_id)
Values ('E11','sv','close',1,2);
insert into room(number,name,status,smoke,room_type_id)
Values ('E12','fm','open',0,3);
insert into room(number,name,status,smoke,room_type_id)
Values ('E14','ec','close',0,5);

--tabel guest
create table guest(
id int PRIMARY KEY identity(1,1),
first_name varchar(80),
last_name varchar(80) not null,
member_since date);
Select * from guest;
insert into guest(first_name,last_name,member_since)
values ('Kolja','Veelo','2023.06.18');
insert into guest(first_name,last_name,member_since)
values ('Kirill','Kavalenko','2021.07.10');
insert into guest(first_name,last_name,member_since)
values ('Valja','Puu','2023.09.29');
insert into guest(first_name,last_name,member_since)
values ('Anastasia','Muhina','2019.01.14');
insert into guest(first_name,last_name,member_since)
values ('Luri','Kleepi','2024.01.01');

--tabel reservation
create table reservation(
id int PRIMARY KEY identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id));
select * from reservation
select * from guest
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2024.04.16','2024.04.23','Kolja Veelo',1)
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2023.02.20','2023.02.27','Kirill Kavalenko',2)
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2022.08.13','2022.08.20','Valja Puu',3)
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2024.07.01','2024.07.08','Anastasia Muhina',4)
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2024.06.12','2024.06.20','Luri Kleepi',5)

--tabel reserved_room
create table reserved_room(
id int PRIMARY KEY identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),
FOREIGN KEY (room_type_id) REFERENCES room_type(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
Select * from reserved_room
select * from reservation
select * from room_type
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'occupied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(10,2,2,'occupied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(20,3,3,'not occupied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(30,4,6,'not occupied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(50,5,7,'occupied');

--tabel occupied_room
create table occupied_room(
id int PRIMARY KEY identity(1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
FOREIGN KEY (room_id) REFERENCES room(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
select * from occupied_room
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2024-04-16 12:59:32','2024-04-23 15:30:00',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2023-05-16 12:59:32','2023-05-23 15:30:00',2,2);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2022-06-16 12:59:32','2022-06-23 15:30:00',3,3);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2021-07-16 12:59:32','2021-07-23 15:30:00',4,6);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('2020-08-16 12:59:32','2020-08-23 15:30:00',5,7);

--tabel hosted-at
create table hosted_at(
id int PRIMARY KEY identity(1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
insert into hosted_at(guest_id,occupied_room_id)
values(1,1);
insert into hosted_at(guest_id,occupied_room_id)
values(2,2);
insert into hosted_at(guest_id,occupied_room_id)
values(3,3);
insert into hosted_at(guest_id,occupied_room_id)
values(4,4);
insert into hosted_at(guest_id,occupied_room_id)
values(5,5);
select * from hosted_at

--3 proceduuri
--1 proceduur Uute kirjete lisamine tabelisse room_type
CREATE PROCEDURE RoomTypeLisamine
@description varchar(80),
@max_capacity int
AS
BEGIN

INSERT INTO room_type(description, max_capacity)
VALUES (@description,@max_capacity);
SELECT * FROM room_type;

END;
--kontroll
Exec RoomTypeLisamine 'super super lux',10

--2 proceduur
