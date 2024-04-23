--sql Server
CREATE DATABASE autoJegorov;
USE autoJegorov;
CREATE table autod(
  regNr char(7) Primary Key,
mark varchar(20),
aasta int,
regPiirkond int)
--tabeli täitmine
INSERT INTO autod (regNr, mark, aasta, regPiirkond)
VALUES
('ABC 123', 'Toyota', 2016, 3),
('XYZ 789', 'Honda', 2019, 1),
('JKL 456', 'Ford', 2015, 2),
('MNO 321', 'Chevrolet', 2017, 4),
('PQR 654', 'Volkswagen', 2013, 3),
('GHI 987', 'Mercedes', 2020, 2),
('UVW 654', 'Hyundai', 2018, 1),
('LMN 321', 'Kia', 2014, 4),
('QRS 987', 'Nissan', 2016, 3),
('OPQ 654', 'Volvo', 2019, 1),
('TUV 321', 'Subaru', 2015, 2),
('VWX 987', 'Mazda', 2017, 4),
('BCD 654', 'Audi', 2013, 3),
('EFG 321', 'BMW', 2018, 2),
('HIJ 987', 'Toyota', 2014, 1),
('YZA 654', 'Honda', 2016, 3),
('BCD 321', 'Ford', 2019, 1),
('EFG 987', 'Chevrolet', 2015, 2),
('zxc 622', 'renault', 2012, 4),
('HIJ 654', 'Volkswagen', 2017, 4);

SELECT * FROM autod
--Järjesta autod tootmisaasta järgi kahanevasse järjekorda
SELECT * FROM autod ORDER BY aasta DESC
--Väljasta kõik erinevad margid
SELECT DISTINCT mark FROM autod;
--Väljasta enne 1993. aastat toodetud autode registrinumbrid
SELECT regNr FROM autod WHERE aasta < 1993;
--Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
SELECT regNr FROM autod WHERE aasta < 1993 ORDER BY regNr ASC;
--Väljasta autode kõige varasem väljalaskeaasta (MIN)
SELECT MIN(aasta) AS vaiksem FROM autod;
--Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
UPDATE autod
SET regNr = '333 KKK'
WHERE regNr = 'PQR 654';
-- Kustuta auto id-ga 4
DELETE FROM autod 
WHERE regNr = 'MNO 321';
-- Lisa uus masin nimekirja. Vaata tabeli sisu.
INSERT INTO autod (regNr, mark, aasta, regPiirkond)
VALUES
('555 NNN', 'Nissan', 2007, 2);
