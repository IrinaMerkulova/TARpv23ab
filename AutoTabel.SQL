---SQL Server
CREATE DATABASE autoMyrseth;
USE autoMyrseth;
CREATE table autod(
  regNr char(7) Primary key,
  mark varchar(20),
  aasta int,
  regPliirkond int)
SELECT * FROM autod;
INSERT INTO autod(regNr, mark, aasta, regPliirkond)
VALUES('123 ABC', 'Audi', 2000, 1),
('777 AAA', 'Ford', 1988, 2),
('FIN 772', 'Ford', 2002, 1),
('111 CCC', 'Nissan', 2006, 1),
('128 HGF', 'Toyota', 2003, 1),
('544 CCH', 'VAZ', 1960, 2),
('346HQO', 'Lexus', 2005, 1),
('934VFX', 'Chevrolet', 1994, 2),
('715EKF', 'Ram', 2012, 1),
('668TTM', 'Mitsubishi', 2001, 2),
('619NCU', 'Porsche', 2008, 1),
('474QGS', 'GMC', 2002, 2),
('972OLJ', 'Lexus', 2006, 2),
('134LXL', 'Peugeot', 2006, 1),
('676ZRZ', 'Hyundai', 1996, 2),
('192DSC', 'Volkswagen', 1993, 2),
('724IYN', 'Pontiac', 2002, 1),
('748YSU', 'Chevrolet', 1978, 1),
('558MPN', 'Subaru', 2010, 2),
('494SRM', 'Chevrolet', 2011, 1),
('522GXH', 'Isuzu', 2003, 2),
('313MDU', 'Dodge', 1992, 2),
('015MHX', 'Volkswagen', 1998, 1),
('433XXH', 'Chevrolet', 1997, 2),
('697AQI', 'Cadillac', 2011, 2),
('232NBT', 'Dodge', 1994, 1);
