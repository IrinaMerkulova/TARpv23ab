--sql Server
CREATE DATABASE autoSemjonova;
USE autoSemjonova;
CREATE TABEL autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int, 
  regPiirkond int)
  
SELECT * FROM autod
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('123 ABC', 'Audi', 2000, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('777 AAA', 'Ford', 1988, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('FIN 772', 'Ford', 2002, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('111 CCC', 'Nissan', 2006, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('128 HGF', 'Toyota', 2003, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('544 CCH', 'VAZ', 1960, 2);

  
