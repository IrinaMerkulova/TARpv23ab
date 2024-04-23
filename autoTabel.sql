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

---Sisestatud on järgmised 20 autot

INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('298 EQQ', 'BMW', 2000, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('208 ETK', 'BMW', 2000, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('200 ETK', 'BMW', 1990, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('200 ETU', 'BMW', 1993, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('244 PÜC', 'BMW', 1999, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('244 PIC', 'Audi', 1993, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('591 PIC', 'Audi', 2003, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('511 IIC', 'Audi', 2013, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('911 IIC', 'Nissan', 2011, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('911 CTC', 'Nissan', 2011, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('911 C0C', 'Nissan', 2011, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('901 C0C', 'Nissan', 2011, 3);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('900 CCC', 'Nissan', 2001, 3);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('884 CCC', 'Nissan', 2011, 3);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('884 EOC', 'Nissan', 2001, 3);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('284 EOC', 'Toyota', 2001, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('284 EIC', 'Toyota', 2024, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('224 EIC', 'Toyota', 2004, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('224 EEC', 'Toyota', 1990, 2);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('220 EEC', 'Toyota', 2004, 3);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('120 EEC', 'Toyota', 2014, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('130 ACC', 'Toyota', 2014, 1);
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
Values ('130 ABC', 'Audi', 2014, 1);  


--Järjesta autod tootmisaasta järgi kahanevasse järjekorda
SELECT * FROM autod ORDER BY aasta DESC;

--Väljasta kõik erinevad margid
SELECT DISTINCT mark FROM autod;

-- Väljasta enne 1993. aastat toodetud autode registrinumbrid
SELECT regNr FROM autod 
  WHERE aasta < 1993;

--Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
SELECT regNr FROM autod 
  WHERE aasta < 1993 ORDER BY regNr ETK;

--Väljasta autode kõige varasem väljalaskeaasta (MIN)
SELECT MIN(aasta) AS Earliest_Year FROM autod;

---Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
UPDATE autod SET regNr = '333 KKK' 
  WHERE regNr = '244 PIC';

--Kustuta auto id-ga 4
DELETE FROM autod
  WHERE regNr = '128 HGF';

--Lisa uus masin nimekirja. Vaata tabeli sisu.
INSERT INTO autod(mark, regNr, aasta, regPiirkond) 
  VALUES ('NBMW', '675 NPD', 2017, 2);
SELECT * FROM autod;
