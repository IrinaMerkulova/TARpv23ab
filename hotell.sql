--Salvestame TARpv23ab
create database hotellGorbunova
use hotellGorbunova
-- tabel roomt_type
create table room_type(
id int primary key identity(1,1),
description varchar(80),
max_capacity int)
select * from room_type;
insert into room_type(description, max_capacity)
values('Super Luxury Suite', 2),
('Deluxe Room', 3),
('Standard Room', 4),
('Economy Room', 1),
('Executive Suite', 2);
-- cntr s
-- git add .
-- git commit -a -m "tabel room_type on lisatud"
-- gti push

--tabel room
create table room(
id int primary key identity(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));
select * from room;
select * from room_type;
insert into room (number, name, status, smoke, room_type_id)
values ('E10', 'sv', 'open',1, 1),
('E11', 'Room Deluxe', 'Occupied', 0, 2),
('E12', 'Executive Suite', 'Reserved', 0, 5),
('E13', 'Standard Room', 'Open', 0, 3),
('E14', 'Economy Room', 'Vacant', 0, 4);

-- teeme tabel guest
create table guest(
id int primary key identity(1,1),
first_name varchar(80),
last_name varchar(80),
member_since date)
insert into guest(first_name, last_name, member_since)
values('Alice', 'Johnson', '2022-09-28'),
('Michael', 'Brown', '2023-01-10'),
('Emily', 'Davis', '2023-04-02'),
('David', 'Wilson', '2022-12-15');
select * from guest

-- luuan reservation
create table reservation(
id int primary key identity(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id));
insert into reservation (date_in, date_out, made_by, guest_id)
values('2023-05-16', '2023-05-18', 'Alex', 1),
('2023-06-20', '2023-06-25', 'John', 2),
('2023-07-10', '2023-07-15', 'Alice', 3),
('2023-08-05', '2023-08-08', 'Michael', 4),
('2023-09-12', '2023-09-18', 'Emily', 5);

select * from reservation

-- luuan tabel reserved_room 
create table reserved_room(
id int primary key identity(1,1),
number_of_room int,
room_type_id int 
foreign key (room_type_id) references room_type(id),
reservation_id int,
foreign key (reservation_id) references reservation(id),
status varchar(20));
INSERT INTO reserved_room (number_of_room, status)
VALUES 
(101, 'Booked'),   
(102, 'Reserved'),  
(103, 'Occupied'),  
(104, 'Pending'),   
(105, 'Confirmed'); 
select * from reserved_room 

--luuan occupied_room
create table occupied_room(
id int primary key identity(1,1),
check_in date,
check_out date,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reservation(id));
INSERT INTO occupied_room (check_in, check_out, room_id, reservation_id)
VALUES('2023-05-16', '2023-05-18', 1, 1), 
('2023-06-20', '2023-06-25', 2, 2),
('2023-07-10', '2023-07-15', 3, 3),  
('2023-08-05', '2023-08-08', 4, 4),  
('2023-09-12', '2023-09-18', 5, 5);  

--luuan hosted_at
create table hosted_at(
id int primary key identity(1,1),
guest_id int,
foreign key (guest_id) references guest(id));


create procedure AddGuest -- see funktsioon on külalise lisamiseks
    @first_name varchar(80),
    @last_name varchar(80),
    @member_since date
as
begin
    insert into guest (first_name, last_name, member_since)
    values(@first_name, @last_name, @member_since);
end; 
EXEC AddGuest 'Alice', 'Johnson', '2022-09-28';

create procedure AddReservation -- see funktsioon on ette nähtud broneeringu lisamiseks
@date_in date,
@date_out date,
@made_by varchar(20),
@guest_id int
as
begin
	insert into reservation (date_in, date_out, made_by, guest_id)
	values(@date_in, @date_out, @made_by, @guest_id)
end;
EXEC AddReservation '2023-05-16', '2023-05-18', 'Alex', 1

create procedure DeleteGuest --funktsioon külalise eemaldamiseks
    @guest_id int
as
begin
    delete from guest where id = @guest_id;
end;
EXEC DeleteGuest @guest_id = 3;