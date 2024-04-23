--SQL Server
CREATE DATABASE AutoSotsjov;
USE autoSotsjov;
CREATE TABLE Autod(
  regNr char(7) Primary key,
  mark  varchar(20),
  aasta int,
  regPiirkond int);
insert Autod(regNr, mark, aasta, regPiirkond)
values ('123 ABC', 'Audi', 2000, 1),
('777 AAA', 'Ford', 1988, 2),
('FIN 772', 'Ford', 2002, 1),
('111 CCC', 'Nissan', 2006, 1),
('128 HGF', 'Toyota', 2003, 1),
('544 CCH', 'VAZ', 1960, 2);

--by mockaroo
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Dodge', '336 GMO', 2009, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Ford', '983 QYE', 2011, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Mazda', '411 XWD', 2006, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Chevrolet', '770 FKR', 2008, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Plymouth', '121 MUQ', 1993, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Hyundai', '625 MSR', 2005, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Jeep', '630 XQO', 2008, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Ford', '782 NIP', 1996, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Nissan', '797 REM', 2010, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Oldsmobile', '778 LKX', 1998, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Chevrolet', '214 NRB', 2010, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Nissan', '101 UHD', 2004, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Cadillac', '943 NQI', 2007, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Chevrolet', '312 UPY', 2004, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Ford', '690 JLZ', 2003, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Nissan', '405 AKQ', 2004, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Buick', '867 QLN', 2000, 2);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('GMC', '341 CBB', 1995, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Bentley', '134 EIC', 2010, 1);
insert into autod (mark, regNr, aasta, Regpiirkond) values ('Toyota', '333 OLB', 2011, 2);


--Järjesta autod tootmisaasta järgi kahanevasse järjekorda
SELECT * FROM Autod ORDER BY aasta DESC;

--Väljasta kõik erinevad margid
SELECT DISTINCT mark FROM Autod;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid
SELECT regNr FROM Autod WHERE aasta < 1993;
--Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
SELECT regNr FROM Autod WHERE aasta < 1993 ORDER BY regNr;
--Väljasta autode kõige varasem väljalaskeaasta (MIN)
SELECT MIN(aasta) AS aasta FROM Autod;

