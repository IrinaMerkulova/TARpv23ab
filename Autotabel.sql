--- SQL Server 
CREATE DATABASE autoHalchenko;
USE autoHalchenko;
CREATE table autod( 
  regNr char(7) Primary key,
  mark varchar(20),
  aasta int,
  regPiirkond int);
INSERT INTO autod(regNr, mark, aasta, regPiirkond) 
Values ('123 ABC' , 'Audi', 2000, 1),
('777 AAA' , 'Ford', 1988, 2),
('FIN 772' , 'Ford', 2002, 1),
('111 CCC' , 'Nissan', 2006, 1),
('128 HGF' , 'Toyota', 2003, 1),
('544 CCH' , 'VAZ', 1960, 2);
Select * from autod;
insert into autod (regNr, mark, aasta, regPiirkond) values ('185 PTV', 'Chevrolet', 1993, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('834 QGN', 'Lexus', 2001, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('912 ELI', 'GMC', 1999, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('233 ALR', 'Subaru', 1996, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('991 SXF', 'BMW', 2012, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('210 IAY', 'Dodge', 1995, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('001 HUV', 'Ford', 2002, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('750 WBL', 'Mercury', 2008, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('251 LZM', 'BMW', 2009, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('513 IPQ', 'Porsche', 2010, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('067 SJI', 'Suzuki', 1992, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('903 FTV', 'Toyota', 2000, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('916 HRT', 'Chrysler', 1994, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('377 WKU', 'Mazda', 2006, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('750 JZZ', 'Acura', 2004, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('900 LXH', 'Toyota', 1992, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('308 JQI', 'BMW', 2004, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('747 HIT', 'Honda', 2005, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('019 HYV', 'Maserati', 2005, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('853 OFN', 'Mercury', 1992, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('435 OCL', 'Buick', 2001, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('570 ZVD', 'Mercedes-Benz', 1998, 2);
--- Tee järgmised SELECT laused: 
--- 1. Järjesta autod tootmisaasta järgi kahanevasse järjekorda
Select * from autod
order by aasta DESC;

--- 2. Väljasta kõik erinevad margid
SELECT DISTINCT mark FROM autod;

--- 3. Väljasta enne 1993. aastat toodetud autode registrinumbrid
SELECT regNr, mark, aasta from autod
where aasta<1993;

--- 4. Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
SELECT regNr, mark, aasta from autod
where aasta<1993
order by mark;

--- 5. Väljasta autode kõige varasem väljalaskeaasta (MIN)
SELECT MIN(aasta) AS min_aasta from autod;

--- 6. Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
UPDATE autod 
SET regNr ='333 KKK'
WHERE regNr = '067 SJI';
