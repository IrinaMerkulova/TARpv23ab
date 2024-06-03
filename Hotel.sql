-- Создание базы данных hotellSots и переключение на неё
create database hotellSots;
use hotellSots;

-- Создание таблицы room_type
create table room_type(
    id int primary key identity(1,1),
    description varchar(80),
    max_capacity int
);

-- Вставка данных в таблицу room_type
insert into room_type(description, max_capacity)
values('SUPER LUX', 1);

-- Создание таблицы room
create table room(
    id int primary key identity(1,1),
    number varchar(10),
    name varchar(40),
    status varchar(10),
    smoke bit,
    room_type_id int,
    FOREIGN KEY (room_type_id) references room_type(id)
);

-- Вставка данных в таблицу room
insert into room(number, name, status, smoke, room_type_id)
values ('E10', 'sv', 'open', 1, 1);

-- Создание таблицы guest
create table guest(
    id int primary key identity(1,1),
    first_name varchar(80),
    last_name nvarchar(80),
    member_since date
);

-- Вставка данных в таблицу guest
insert into guest(first_name, last_name, member_since)
values ('Gleb', 'Sotsjov', '2007-09-17');

-- Создание таблицы reservation
create table reservation(
    id int primary key identity(1,1),
    date_in date,
    date_out date,
    made_by varchar(20),
    guest_id int,
    FOREIGN KEY (guest_id) references guest(id)
);

-- Вставка данных в таблицу reservation
insert into reservation(date_in, date_out, made_by, guest_id)
values ('2023-08-06', '2023-09-01', 'Gleb Sotsjov', 1);

-- Создание таблицы reservation_room
create table reservation_room(
    id int primary key identity(1,1),
    number_of_rooms int,
    room_type_id int,
    reservation_id int,
    status varchar(20),
    foreign key (room_type_id) references room_type(id),
    foreign key (reservation_id) references reservation(id)
);

-- Вставка данных в таблицу reservation_room
insert into reservation_room (number_of_rooms, room_type_id, reservation_id, status)
values (1, 1, 1, 'open');

-- Создание таблицы occupied_room
create table occupied_room(
    id int primary key identity(1,1),
    check_in date,
    check_out date,
    room_id int,
    reservation_id int,
    foreign key (room_id) references room(id),
    foreign key (reservation_id) references reservation(id)
);

-- Вставка данных в таблицу occupied_room
insert into occupied_room (check_in, check_out, room_id, reservation_id)
values ('2023-08-23', '2023-12-01', 1, 1);

-- Создание таблицы hosted_at
create table hosted_at(
    id int primary key identity(1,1),
    guest_id int,
    occupied_room_id int,
    foreign key (guest_id) references guest(id),
    foreign key (occupied_room_id) references occupied_room(id)
);

-- Вставка данных в таблицу hosted_at
insert into hosted_at (guest_id, occupied_room_id)
values (1, 1);

-- Создание процедуры для добавления гостя
create procedure guest_lisamine
    @first_name varchar(80),
    @last_name varchar(80),
    @member_since date
as
begin
    insert into guest(first_name, last_name, member_since)
    values (@first_name, @last_name, @member_since);
end;

-- Вызов процедуры для добавления гостя
exec guest_lisamine 'Gleb', 'Sotsev', '2024-05-03';

-- Создание процедуры для удаления гостя по его ID
create procedure delete_guest
    @deleteID int
as
begin
    delete from guest 
    where id = @deleteID;
end;

-- Вызов процедуры для удаления гостя
exec delete_guest 12;

-- Создание процедуры для удаления гостя из hosted_at по его ID
create procedure delete_hosted_guest
    @id int
as
begin
    delete from hosted_at
    where id = @id;
end;

-- Вызов процедуры для удаления гостя из hosted_at
exec delete_hosted_guest 7;
