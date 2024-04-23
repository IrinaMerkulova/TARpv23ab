---SQL server
CREATE DATABASE autoViblyy;
USE autoViblyy;
CREATE TABLE autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)

INSERT autod VALUES ('Audi', '123 ABC', 2000, 1)
INSERT autod VALUES ('Ford', '777 AAA', 1988, 2)
INSERT autod VALUES ('Ford', 'FIN 772', 2002, 1)
INSERT autod VALUES ('Nissan', '111 CCC', 2006, 1)
INSERT autod VALUES ('Toyota', '128 HGF', 2003, 1)
INSERT autod VALUES ('VAZ', '544 CCH', 1960, 2)
insert into autod (mark, regNr, aasta, regPiirkond) values ('BMW', '909 FEI', 1997, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '999 CFX', 1995, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mazda', '630 WIA', 1987, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '639 RRU', 2008, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chevrolet', '320 IZT', 2008, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Infiniti', '967 QVM', 2003, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Bentley', '899 MQR', 2008, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Buick', '025 CGW', 1997, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Land Rover', '530 GII', 2012, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mitsubishi', '820 QTP', 1998, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Chevrolet', '549 JRI', 2003, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mercury', '078 DWB', 1987, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mercedes-Benz', '486 IZS', 2003, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Lexus', '933 UXN', 2007, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Pontiac', '214 FAN', 2006, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mitsubishi', '673 TWC', 1996, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Audi', '153 MAB', 1990, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '352 MDV', 1992, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '597 EGS', 2006, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mitsubishi', '320 CBR', 2007, 2);

