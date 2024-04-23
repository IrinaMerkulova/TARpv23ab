---SQL Server
CREATE DATABASE autoBasirov;
USE autoBasirov;
CREATE table autod(
  regNr char(7) Primary key,
Mark varchar(20),
Aasta int,
RegPiirk int
);

INSERT INTO autod (regNr,Mark,Aasta,RegPiirk) 
VALUES ('123 ABC', 'Audi', 2000, 1),
('777 AAA', 'Ford', 1988, 2),
('FIN 772', 'Ford', 2002, 1),
('111 CCC', 'Nissan', 2006, 1),
('128 HGF', 'Toyota', 2003, 1),
('544 CCH', 'VAZ', 1960, 2);
