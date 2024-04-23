-- SQL Server --

create database autoSergachev;
use autoSergachev;

create table autod(
  regNr char(7) primary key,
  mark varchar(20),
  aasta int,
  regPiirkond int
);
  

insert autod(regNr, mark, aasta, regPiirkond)
values('123 ABC', 'Audi', 2000, 1),
('777 AAA', 'Ford', 1988, 2),
('FIN 772', 'Ford', 2002, 1),
('111 CCC', 'Nissan', 2006, 1),
('128 HGF', 'Toyota', 2003, 1),
('544 CCH', 'VAZ', 1960, 2);

insert into autod (regNr, mark, aasta, regPiirkond) values ('641 JSI', 'Volvo', 2003, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('808 YRN', 'Mercedes-Benz', 2002, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('616 GIU', 'Alfa Romeo', 1994, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('469 QYW', 'Mitsubishi', 1988, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('627 DNC', 'Mazda', 1996, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('360 YKJ', 'Ford', 1970, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('234 PUO', 'Hyundai', 2007, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('504 BVB', 'GMC', 2001, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('686 TCU', 'Mazda', 1995, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('697 YOC', 'BMW', 2013, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('125 NAL', 'Pontiac', 1990, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('592 UGI', 'Cadillac', 2001, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('433 CDZ', 'Acura', 1998, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('370 SLC', 'BMW', 1957, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('148 BNB', 'Mercury', 2010, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('508 ZHO', 'Chevrolet', 1962, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('053 DXJ', 'Ford', 1986, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('824 LVQ', 'Audi', 2005, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('234 MYM', 'Bentley', 2012, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('050 MVH', 'Chevrolet', 1996, 2);


-- Järjesta autod tootmisaasta järgi kahanevasse järjekorda

select * from autod order by aasta;


