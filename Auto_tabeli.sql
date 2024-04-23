--sql Server
CREATE DATABASE autoDavidL;
USE autoDavidL;
CREATE table atod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
  SELECT * from autod

  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('123 ABC', 'Audi', 1988, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('777 AAA', 'Ford', 1988, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('FIN 772', 'Ford', 2002, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('111 CCC', 'Nissan', 2006, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('128 HGF', 'Toyota', 2003, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('544 CCH', 'VAZ', 1960, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('467 SIH', 'Opel', 2020, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('207 ABD', 'Volvo', 1999, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('102 MFG', 'Tesla', 2020, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('285 EFR', 'Mercedes', 2009, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('228 BAS', 'Mitsubishi', 2023, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('252 MED', 'Skoda', 2013, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('000 KIL', 'Ural', 1954, 1);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('012 DIN', 'Mazda', 2000, 2);
  INSERT INTO autod(regNr, mark, aasta, regPiirkond)
  Values('748 DES', 'JEEP', 2020, 1);

--  Järjesta autod tootmisaasta järgi kahanevasse järjekorda
SELECT * FROM autod ORDER BY aasta DESC;

--Väljasta kõik erinevad margid
SELECT DISTINCT mark FROM autod;
