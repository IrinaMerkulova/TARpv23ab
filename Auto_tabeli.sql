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

-- Väljasta enne 1993. aastat toodetud autode registrinumbrid
SELECT regNr FROM autod WHERE aasta < 1993;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
SELECT regNr FROM autod WHERE aasta < 1993 ORDER BY regNr ASC;

--Väljasta autode kõige varasem väljalaskeaasta (MIN)
SELECT MIN(aasta) AS Earliest_Year FROM autod;

--Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
UPDATE autod SET regNr = '333 KKK' WHERE regNr = '102 MFG';

--Kustuta auto id-ga 4
DELETE FROM autod WHERE regNr = '123 ABC';
