
--sql server
CREATE DATABASE AutoJegorov;
USE AutoJegorov;
CREATE TABLE Autod (
  regNr char(7) primary key,
  mark varchar(20) A
  aasta int,
  regPiirkond int,
  );

INSERT INTO Autod (regNr, mark, aasta, regPiirkond)
VALUES
('123 ABC', 'Audi', 2000, 1),
('777 AAA', 'Ford', 1988, 2),
('FIN 772', 'Ford', 2002, 1),
('111 CCC', 'Nissan', 2006, 1),
('128 HGF', 'Toyota', 2003, 1),
('544 CCH', 'VAZ', 1960, 2);
('475 HDT', 'Kia', 2011, 1),
('679 JEL', 'Ford', 1997, 9),
('490 AVD', 'Infiniti', 2010, 6),
('834 XBP', 'Suzuki', 1991, 8),
('689 JRI', 'Mazda', 2003, 1),
('677 AMT', 'Honda', 2002, 5),
('913 OYY', 'Merkur', 1985, 4),
('253 MIU', 'Ford', 2009, 1),
('226 AOL', 'Volvo', 2000, 8),
('334 EYU', 'Pontiac', 1970, 4),
('144 SUC', 'Ford', 2008, 5),
('907 VAA', 'Chrysler', 2004, 7),
('031 YSR', 'Maybach', 2005, 5),
('862 XFV', 'Foose', 2007, 1),
('274 BGT', 'Mercury', 1999, 4),
('233 KNW', 'Chevrolet', 2003, 2),
('065 LKS', 'Chevrolet', 2008, 9),
('717 AUS', 'Lexus', 1995, 4),
('842 UXH', 'Maserati', 2011, 9),
('218 NCY', 'Lincoln', 2009, 1);

--Järjesta autod tootmisaasta järgi kahanevasse järjekorda:
SELECT * FROM Autod ORDER BY aasta DESC;

Väljasta kõik erinevad margid:
SELECT DISTINCT mark FROM Autod;

Väljasta enne 1993. aastat toodetud autode registrinumbrid:
SELECT regNr FROM Autod WHERE aasta < 1993;

Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras:
SELECT regNr FROM Autod WHERE aasta < 1993 ORDER BY regNr;

Väljasta autode kõige varasem väljalaskeaasta (MIN):
SELECT MIN(aasta) AS varem_aasta FROM Autod;





