---SQL SERVER
CREATE DATABASE autoSats; 
USE autoSats;
CREATE table autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
SELECT * FROM autod
INSERT INTO autod (regNr, mark, aasta, regPiirkond)
VALUES ('123 ABC', 'Audi', 2000, 1) 
VALUES ('777 AAA', 'Ford', 1998, 2) 
VALUES ('FIN 772', 'Ford', 2002, 1) 
VALUES ('111 CCC', 'Nissan', 2006, 1) 
VALUES ('128 HGF', 'Toyota', 2003, 1) 
VALUES ('544 CCH', 'VAZ', 1960, 2) 


