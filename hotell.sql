--1. room_type
CREATE TABLE room_type(
id int Primary key,
description varchar (80),
max_capacity int);
SELECT * FROM room_type;

INSERT INTO room_type(description,max_capacity)
VALUES ('basic',1);
INSERT INTO room_type(description,max_capacity)
VALUES ('comfort',2);
INSERT INTO room_type(description,max_capacity)
VALUES ('comfort+',3);
INSERT INTO room_type(description,max_capacity)
VALUES ('lux',4);
INSERT INTO room_type(description,max_capacity)
VALUES ('president',5);

--2. room
CREATE TABLE room(
id int Primary key NOT NULL,
number varchar (50),
name varchar (50),
status varchar (50),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id));

INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES ('A1','sd','open',1,1),
('B12','ma','close',0,3),
('C52','mv','open',0,2),
('B9','jt','open',1,4),
('A22','ir','close',0,3);

--3. guest
CREATE TABLE guest(
id int Primary key AUTO_INCREMENT,
first_name varchar (80),
last_name varchar (80),
member_since date);

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Roman', 'Sandakov', '2024-02-19'),
('Alina', 'Ivanova', '2023-08-15'),
('Dmitry', 'Petrov', '2022-11-30'),
('Olga', 'Sidorova', '2023-05-10'),
('Ivan', 'Smirnov', '2023-12-25');

--4. reservation
CREATE TABLE reservation(
id int Primary key AUTO_INCREMENT,
date_in date,
date_out date,
made_by varchar (20),
guest_id int,
foreign key (guest_id) references guest(id));

INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2024-04-16', '2024-04-26', 'Sunrise Inn', 1),
('2024-05-01', '2024-05-10', 'Ocean Breeze Hotel', 2),
('2024-06-12', '2024-06-20', 'Mountain View Lodge', 3),
('2024-07-15', '2024-07-25', 'City Central Hotel', 4),
('2024-08-05', '2024-08-15', 'Grand Stay Inn', 5);

--5. reserved_room
CREATE TABLE reserved_room(
id int Primary key AUTO_INCREMENT,
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(50),
foreign key (room_type_id) references room_type(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM reserved_room;

INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES ('5', 1, 1 , 'suletud'),
('13', 1, 1 , 'avatud'),
('24', 1, 1 , 'avatud'),
('52', 1, 1 , 'suletud'),
('15', 1, 1 , 'avatud');

--6. occupied_room
CREATE TABLE occupied_room(
id int Primary key AUTO_INCREMENT,
check_in datetime,
check_out datetime,
room_id int,
reservation_id int,
foreign key (room_id) references room(id),
foreign key (reservation_id) references reservation(id));
SELECT * FROM occupied_room;

INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES ('2024-05-23 11:35:00', '2024-05-30 12:19:20', 1, 1),
('2024-05-01 14:00:00', '2024-05-10 10:00:00', 2, 2),
('2024-06-12 16:45:30', '2024-06-20 11:30:15', 3, 3),
('2024-07-15 17:20:00', '2024-07-25 12:45:00', 4, 4),
('2024-08-05 13:30:00', '2024-08-15 09:50:00', 5, 5);

--7. hosted_at
CREATE TABLE hosted_at(
id int Primary key AUTO_INCREMENT,
guest_id int,
occupied_room_id int,
FOREIGN KEY (guest_id) REFERENCES guest(id),
FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id));
SELECT * FROM hosted_at; 

INSERT INTO hosted_at(guest_id, occupied_room_id)
VALUES (1, 5),
(2, 3),
(3, 1),
(4, 4),
(5, 2);

--uue soomuse lisamise menetlus
CREATE PROCEDURE AddReservation(
    IN date_in DATE,
    IN date_out DATE,
    IN made_by VARCHAR(20),
    IN guest_id INT
)
BEGIN
    INSERT INTO reservation(date_in, date_out, made_by, guest_id)
    VALUES (date_in, date_out, made_by, guest_id);
    
    SELECT * FROM reservation;
END 
