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


--genereeri veel 20  autod mockaroo abil

insert into autod (mark, regNr, aasta, regPiirkond) values ('BMW', '505BZN', 2006, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Nissan', '749QUW', 2008, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chevrolet', '854OXK', 1997, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '720ZXP', 2009, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '277CYZ', 2002, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Jeep', '022VVY', 1997, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chrysler', '623QHG', 1993, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '603LUT', 2009, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '772KDU', 1997, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chevrolet', '198VIZ', 2009, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Saturn', '117GUG', 2007, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chevrolet', '190RWZ', 2005, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Volvo', '158YTS', 2003, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '566UNR', 1993, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mercury', '956LKZ', 2010, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Dodge', '841FNS', 1993, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Land Rover', '852VJO', 2012, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Suzuki', '584BPF', 2003, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Subaru', '636VUG', 2008, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Scion', '803JHZ', 2012, 2);
	
