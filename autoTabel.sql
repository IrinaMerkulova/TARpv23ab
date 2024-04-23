--SQL Server
CREATE DATABASE autoSandakov;
USE autoSandakov;
CREATE table autod(
  regNr char(7) Primary key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
 SELECT * FROM autod;
insert into autod (regNr, mark, aasta, regPiirkond) values ('116 JXT', 'Land Rover', 1999, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('704 MVD', 'Toyota', 2010, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('907 VJZ', 'Mercedes-Benz', 2002, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('162 AGX', 'Aston Martin', 2006, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('892 FUS', 'Pontiac', 2009, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('268 JCK', 'Lexus', 1992, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('228 JTI', 'Chrysler', 1992, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('560 XWZ', 'Chevrolet', 1993, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('184 RDR', 'Honda', 2008, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('019 FIE', 'Ford', 1997, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('172 YUU', 'Acura', 2009, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('789 MSO', 'Lexus', 2008, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('650 YYX', 'Lexus', 2011, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('405 RKC', 'Porsche', 2001, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('962 HTG', 'Mazda', 1994, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('236 MIK', 'Chevrolet', 2001, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('102 ESP', 'Maybach', 2011, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('645 UDI', 'Chevrolet', 1993, 1);
insert into autod (regNr, mark, aasta, regPiirkond) values ('142 KTA', 'Chevrolet', 2011, 2);
insert into autod (regNr, mark, aasta, regPiirkond) values ('834 MBB', 'Ford', 2012, 2);

--Järjesta autod tootmisaasta järgi kahanevasse järjekorda
Select regNr, mark, aasta, regPiirkond
from autod
Order by aasta Desc;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid
Select regNr, aasta
from autod
where aasta <=1993

