--Slavestame TARpv23ab kausta sisse CTRL+S
create database hotellAleksandra;
use hotellAleksandra;
--tabel room_type
CREATE TABLE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int);
SELECT * FROM room_type;
INSERT INTO room_type(description, max_capacity)
VALUES ('super ', 1);
INSERT INTO room_type(description, max_capacity)
VALUES ('super lux', 1);
INSERT INTO room_type(description, max_capacity)
VALUES ('lux', 1);
INSERT INTO room_type(description, max_capacity)
VALUES ('super top', 1);
INSERT INTO room_type(description, max_capacity)
VALUES ('toper', 1);


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
VALUES ('E11', 'ytv', 'open', 1, 1);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E12', 'sv', 'open', 1, 1);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E13', 'sv', 'open', 1, 1);
INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('E14', 'sv', 'open', 1, 1);

--table guest
Create table guest(
id int Primary key identity(1,1),
first_name varchar(80),
last_name varchar(80) not null,
member_since date);
Select * from guest;
insert into guest(first_name,last_name,member_since)
values ('Illya','Heino','2007.07.03');
insert into guest(first_name,last_name,member_since)
values ('Aleksandra','Heino','2007.07.03');
insert into guest(first_name,last_name,member_since)
values ('Aleksandr','Jurev','2009.10.13');
insert into guest(first_name,last_name,member_since)
values ('Dima','Jurev','2019.12.16');
insert into guest(first_name,last_name,member_since)
values ('Arina','Illmso','2005.07.16');

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
values ('2007.12.04','2020.04.23','Dima Jurber',1);
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2009.11.08','2009.07.23','Jelena Semjonova',1);
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2008.10.07','2008.12.27','Gleb Semjonov',1);
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2017.07.24','2014.08.03','David Egov',1);
insert into reservation(date_in,date_out,made_by,guest_id)
values ('2023.12.14','2024.04.13','Aleksandr Heino',1);

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
values(12,1,1,'cpied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'cupied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'occupi');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'ied');
insert into reserved_room(number_of_rooms,room_type_id,reservation_id,status)
values(12,1,1,'olsll');
--tabel occupied_room
create table occupied_room(
id int PRIMARY KEY identity(1,1),
check_in time,
check_out time,
room_id int,
reservation_id int,
FOREIGN KEY (room_id) REFERENCES room(id),
FOREIGN KEY (reservation_id) REFERENCES reservation(id));
select * from occupied_room
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('02:00:10 ','15:31:05 ',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('17:50:16 ','15:31:05 ',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('12:30:10 ','15:31:05 ',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('10:45:11 ','15:55:15 ',1,1);
insert into occupied_room(check_in,check_out,room_id,reservation_id)
values('07:59:10 ','15:41:05 ',1,1);


--tabel hosted_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
select * from hosted_at
select * from guest 
select * from occupied_room
insert into hosted_at(guest_id,occupied_room_id)
values(1,3);
insert into hosted_at(guest_id,occupied_room_id)
values(2,10);
insert into hosted_at(guest_id,occupied_room_id)
values(3,11);
insert into hosted_at(guest_id,occupied_room_id)
values(4,12);
insert into hosted_at(guest_id,occupied_room_id)
values(5,13);

--otsingitaht
Create procedure otsingitaht
	@taht char(1)
as 
begin
	select first_name, last_name, member_since from guest
	where first_name like @taht + '%'
end;
go
exec otsingitaht 'i';

--Delete reservation 
create procedure Kustuta
	@kustutumisID int
as 
begin
	delete from reservation
	where id = @kustutumisID;
end;
go
exec Kustuta 2;

--Procedure Lisamise kord eue guest
create procedure UueGuest
	@first_name varchar(80),
	@last_name varchar(80),
	@member_since DATE
as 
begin 
	insert into guest(first_name, last_name, member_since)
	values(@first_name, @last_name, @member_since);
end;
go
exec UueGuest 'Aleks', 'Sikk', '2006-05-17';