-- SQL server
create database autoSild;
use autoSild;

create table autod(
regNr char(7) primary key,
mark varchar(20),
aasta int,
regPiirkond int)

insert into autod (mark, regNr, aasta, regPiirkond) values ('Audi', '123ABC', 2000, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '777AAA', 1988, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', 'FIN772', 2002, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Nissan', '111CCC', 2006, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Toyota', '128HGF', 2003, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('VAZ', '554CHH', 1960, 2);
