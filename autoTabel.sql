--sql
create database autoGorbunova;
use autoGorbunova;
create table autod(
  regNr char(7) Primary key,
  mark vaechar(20),
  aasta int,
  regPiirkond int);
INSERT INTO autod (regNr, mark, aasta, regPiirkond)
VALUES 
  ('456 DEF', 'Toyota', 2010, 2),
  ('789 GHI', 'Honda', 2005, 1),
  ('101 JKL', 'Ford', 2015, 3),
  ('202 MNO', 'Chevrolet', 2008, 2),
  ('303 PQR', 'Mercedes', 2012, 3),
  ('404 STU', 'Audi', 2018, 1),
  ('505 VWX', 'Volvo', 2009, 2),
  ('606 YZA', 'Hyundai', 2014, 3),
  ('707 BCD', 'Kia', 2007, 1),
  ('808 EFG', 'Nissan', 2016, 2),
  ('909 HIJ', 'Subaru', 2011, 3),
  ('010 KLM', 'Mazda', 2013, 1),
  ('111 NOP', 'Jeep', 2006, 2),
  ('212 QRS', 'Peugeot', 2019, 3),
  ('313 TUV', 'Renault', 2004, 1),
  ('414 WXY', 'Fiat', 2017, 2),
  ('515 ZAB', 'Lexus', 2010, 3),
  ('616 CDE', 'Tesla', 2020, 1),
  ('717 FGH', 'Porsche', 2008, 2);
select * from autod
  -- 1 select
SELECT * FROM autod
ORDER BY aasta DESC;
--2 ei ole
-- 3 select
SELECT regNr
FROM autod
WHERE aasta < 1993;
-- 4 select
SELECT regNr
FROM autod
WHERE aasta < 1993
ORDER BY regNr ASC;
--5 select
SELECT min(aasta) as koigevaiksem 
FROM autod;
