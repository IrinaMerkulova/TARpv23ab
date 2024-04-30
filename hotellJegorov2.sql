-- Salvestame TARpv23ab kausta sisse CTRL + S
create database hotellJegorov2;
use hotellJegorov2;

-- tabel room_type
create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int);
select * from room_type;
insert into room_type(description, max_capacity)
values ('duplex',2),
('super lux',1),
('premium',5),
('studio',4),
('apartament',3);

--drop table room_type;
--delete from room_type;
--where id = ...

--tabel room

create table room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
FOREIGN KEY (room_type_id) references room_type(id));

select * from room
select * from room_type

insert into room(number,name,status,smoke,room_type_id)
values ('E10', 'sv', 'open', 0, 1),
('E11', 'sv', 'open', 1, 2),
('E12', 'sv', 'open', 0, 3),
('E13', 'sv', 'open', 1, 4),
('E14', 'sv', 'open', 0, 5);

--tabel guest

create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name nvarchar(80),
member_since date);

insert into guest(first_name,last_name,member_since)
VALUES ('Lev','Jegorov','2007-06-28'),
('Martin','Sild','2006-07-10'),
('Erik','Gerega','2007-04-30'),
('Seva','Tsarev','2007-01-5'),
('Lev','Jegorov','2007-08-10');


select * from guest

--tabel reservation

create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
FOREIGN KEY (guest_id) references guest(id));

select * from reservation

insert into reservation(date_in,date_out,made_by,guest_id)
VALUES('2020-05-24','2023-07-19','Lev Jegorov',1),
('2021-05-24','2022-07-19','Martin Sild',2),
('2009-05-24','2001-07-19','Seva Tsarev',3),
('2005-05-24','2000-07-19','Erik Gerega',4),
('2004-05-24','1976-07-19','Seva Tsarev',5);

--tabel reservation_room

create table reservation_room(
id int primary key identity(1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20),

foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));

select * from reservation_room

insert into reservation_room (number_of_rooms, room_type_id,reservation_id,status)
VALUES ('10','1','1','open'),
('11','2','2','open'),
('12','3','3','open'),
('13','4','4','open'),
('14','5','5','open');


--tabel occupied_room

create table occupied_room(
id int primary key identity(1,1),
check_in date,
check_out date,
room_id int,
reservation_id int,

foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));

select * from occupied_room

insert into occupied_room (check_in, check_out, room_id, reservation_id)
VALUES ('2019-03-22','2023-03-25','1','1'),
('2010-03-22','2023-03-25','2','2'),
('2011-03-22','2023-03-25','3','3'),
('2012-03-22','2023-03-25','4','4'),
('2016-03-22','2023-03-25','5','5');

--tabel hosted_at

create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,

foreign key (guest_id) references guest(id),
foreign key (occupied_room_id) references occupied_room(id));

insert into hosted_at (guest_id,occupied_room_id)
values (1,1),
(2,2),
(3,3),
(4,4),
(5,5);

select * from hosted_at


--proceduuri loomine
--proceduur mis lisab kliendi hotelli andmebaasile
CREATE PROCEDURE AddNewClient,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20)
AS
BEGIN
    INSERT INTO Clients (FirstName, LastName, Email, Phone)
    VALUES (@FirstName, @LastName, @Email, @Phone)
END