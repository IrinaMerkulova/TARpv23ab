SQL Servis tekkivad vead 
1.
CREATE room_type(
id int Primary key identity(1,1),
description varchar(80),
max_capacity int );

Unknown object type 'room_type' used in a CREATE, DROP, or ALTER statement.

Seal ei ole objekti mida peab luua

2.
CREATE TABLE room_type(
id int Primary key (1,1),
description varchar(80),
max_capacity int );


Incorrect syntax near '1'.
 Нужно добавить "identity" чтобы команда сработала.


3
delete table ostjad;

Kui soovite tabeli ise kustutada, peate kirjutama mitte "kustuta", vaid "drop"


4.
select ostjad;


vigade süntaks

между 'select'  'from' нужно поставить *




нужно написать drop table ostjad;




5.

4.

insert ostjad(name, last_name, age)
values('Bogdan', 'Sergachev', 16),
values('Gleb', 'Sõtsjov', 16);


Msg 156, Level 15, State 1, Line 32
Incorrect syntax near the keyword 'values'.


Viga seisneb selles, et peate ühe korra kirjutama "VALUES".

õige vorm:

insert ostjad(name, last_name, age)
values('Bogdan', 'Sergachev', 16),
('Gleb', 'Sõtsjov', 16);


5.


delete from id 
where ostjad = 3;

Msg 208, Level 16, State 1, Line 35
Invalid object name 'id'.

нужно написать 'Where', иначе синтакс будет неправильный 

delete from ostjad 
where id = 3;


6.

CREATE TABLE room_type(id int Primary key identity(1,1),
description varchar80,max_capacity int) ;
Column, parameter, or variable #2: Cannot find data type varchar80.
Vale parameeter, kuna "varchar" ei sisalda sulgu. "varchar" ei saa olla ilma sulgudeta
7. 

CREATE TABLE room_type(
id int Primary key identity(1,1),description varchar(80),
max_capacity int) ;SELECT  FROM room_type;
INSERT INTO room_type(description, max_capacity)VALUES ('super lux', 1),
 ('deluxe', 2),('super deluxe', 3),
('vip', 4), ('comfort', 5);
Incorrect syntax near the keyword 'FROM'.
Vale süntaks, kuna pärast "Select" ja enne "FROM" peab olema "*", muidu see ei tööta

8.
CREATE TABLE room_type(id int Primary key identity(1,1),
description varchar(80),max_capacity int) ;
SELECT * FROM room_type;INTO INSERT  room_type(description, max_capacity)
VALUES ('super lux', 1), ('deluxe', 2),
('super deluxe', 3),('vip', 4),
 ('comfort', 5);
Incorrect syntax near the keyword 'INTO'.
Süntaks on vale, kuna nõutav järjestus on "INSERT INTO" 


9.delete table room_type;
Incorrect syntax near the keyword 'table'.

Süntaks on vale, kuna "delete table" ei saa kirjutada, tabeli kustutamiseks peab see olema "drop table".


10. 

create table ostjad( 
id int primary key auto_increment,
name varchar(20),
last_name varchar(40),
age int
);


Msg 102, Level 15, State 1, Line 2
Incorrect syntax near 'auto_increment'.

id int primary key auto_increment, -- Auto_increment - auto_incrementi saab kasutada ainult xampp-is 
ja SQL-serveris peate ID automaatseks täitmiseks kasutama ID-d (1,1).

нужно вместо этого: 'id int primary key auto_increment,', 'написать: id int primary key Identity (1,1)', так как SQL не знает другой команды для автоматического заполнения.

11.
create table ostjad( 
id int primary key identity(1,1);
name varchar(20);
last_name varchar(40);
age int;
);

Incorrect syntax near ';'.

Неправильный синтакс, так как ';' обозначает законченное действие, а код пытается продолжить его выполнение

create table ostjad( 
id int primary key identity(1,1),
name varchar(20),
last_name varchar(40),
age int
);
