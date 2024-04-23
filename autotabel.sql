-- SQL Server
CREATE DATABASE autoMilishenko;
USE autoMilishenko;
CREATE TABLE autod(
regNr char(7) primary key,
mark varchar(255),
aasta int,
regPiirk int
);

INSERT INTO autod(regNr, mark, aasta, regPiirk) VALUES ('123 ABC', 'Audi', 2000, 1 ), ('777 AAA', 'Ford', 1988, 2), ('FIN 772', 'Ford', 2002, 1), ('111 CCC', 'Nissan', 2006, 1), ('128 HGF', 'Toyota', 2003, 1), ('544 CCH','VAZ',1960,2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('422 YPJ', 'Volvo', 2006, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('724 QIQ', 'Chevrolet', 2012, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('257 JZA', 'Volvo', 2000, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('600 GRS', 'Volkswagen', 1987, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('028 RJV', 'Chrysler', 1993, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('517 KOK', 'Oldsmobile', 1996, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('154 QEJ', 'Audi', 2003, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('594 CMV', 'Audi', 2012, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('601 OGD', 'Lincoln', 1991, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('074 GML', 'Mercury', 1995, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('929 KMF', 'Ford', 1985, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('484 ERM', 'Acura', 1996, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('638 CWZ', 'MINI', 2012, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('892 URA', 'Ford', 2008, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('032 DSL', 'Volvo', 2004, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('900 OXJ', 'Bentley', 2010, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('236 CBF', 'Ford', 1998, 1);
insert into  autod (regNr, mark, aasta, regPiirk) values ('377 FXZ', 'Chevrolet', 1998, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('658 ESA', 'Volkswagen', 2009, 2);
insert into  autod (regNr, mark, aasta, regPiirk) values ('885 CEL', 'Porsche', 2011, 1);



SELECT * FROM autod ORDER BY aasta DESC;
SELECT * FROM autod WHERE aasta < 1993;
SELECT min(aasta) as 'aasta'  FROM autod;

