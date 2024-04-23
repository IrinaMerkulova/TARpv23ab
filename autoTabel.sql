---SQL SERVER
CREATE DATABASE autoSats; 
USE autoSats;
CREATE table autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
---teeme tabel
INSERT INTO autod (regNr, mark, aasta, regPiirkond)
VALUES ('123 ABC', 'Audi', 2000, 1) 
VALUES ('777 AAA', 'Ford', 1998, 2) 
VALUES ('FIN 772', 'Ford', 2002, 1) 
VALUES ('111 CCC', 'Nissan', 2006, 1) 
VALUES ('128 HGF', 'Toyota', 2003, 1) 
VALUES ('544 CCH', 'VAZ', 1960, 2) 
SELECT * FROM autod
---lisa uus 20 autod
insert into autod (regNr, mark, aasta, regPiirkond) values ('007 KIR', 'BMW',  1997, 4);
insert into autod (regNr, mark, aasta, regPiirkond) values ('111 KOL', 'Mazda', 2005, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('222 TAK', 'Lexus', 1997, 71);
insert into autod (regNr, mark, aasta, regPiirkond) values ('123 NOM', 'Volkswagen', 1998, 8);
insert into autod (regNr, mark, aasta, regPiirkond) values ('121 JEP', 'Mercury', 1999, 77);
insert into autod (regNr, mark, aasta, regPiirkond) values ('456 PON', 'Ford', 1996, 92);
insert into autod (regNr, mark, aasta, regPiirkond) values ('001 JAA','Ford', 2000, 54);
insert into autod (regNr, mark, aasta, regPiirkond) values ('DE1MARK','Chevrolet', 1978, 44);
insert into autod (regNr, mark, aasta, regPiirkond) values ('666 BUZ', 'Buick', 2005, 57);
insert into autod (regNr, mark, aasta, regPiirkond) values ('777 TOP', 'Subaru',  2009, 44);
insert into autod (regNr, mark, aasta, regPiirkond) values ('555 BOG', 'Chrysler', 1997, 88);
insert into autod (regNr, mark, aasta, regPiirkond) values ('112 KOP', 'Mercury', 1993, 57);
insert into autod (regNr, mark, aasta, regPiirkond) values ('654 AUI', 'Ford', 1955, 34);
insert into autod (regNr, mark, aasta, regPiirkond) values ('654 RZF', 'Pontiac', 1962, 36);
insert into autod (regNr, mark, aasta, regPiirkond) values ('878 BCB', 'Chevrolet', 2001, 4);
insert into autod (regNr, mark, aasta, regPiirkond) values ('327 MRN', 'Chrysler', 2000, 96);
insert into autod (regNr, mark, aasta, regPiirkond) values ('312 KKK', 'Mazda', 2001, 27);
insert into autod (regNr, mark, aasta, regPiirkond) values ('333 DDD', 'Mazda', 1993, 63);
insert into autod (regNr, mark, aasta, regPiirkond) values ('122 POL', 'Jaguar', 2007, 79);
insert into autod (regNr, mark, aasta, regPiirkond) values('111 PFF', 'Chevrolet', 1996, 46);

---kustutamine auto 4 id'ga
delete from autod where regNr = '111 KOL';


--- Järjesta autod tootmisaasta järgi kahanevasse järjekorda
select * from autod order by aasta

---Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
update autod set regNr ='333 KKK' where regNr = '333 FAQ'


  --- Väljasta enne 1993. aastat toodetud autode registrinumbrid
select * from autod where aasta <=1993



---sorteeritud väljalaskekuupäeva
select * from autod order by aasta

---LISAMINE UUE AUTO
insert into autod (regNr, mark, aasta, regPiirkond) values ('099 NEO', 'BMW',  2022, 99);
