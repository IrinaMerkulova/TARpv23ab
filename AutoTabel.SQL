-- SQL Server
CREATE DATABASE autoAllik;
USE autoAllik;
CREATE TABLE autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
    regPiirkond int);
SELECT * FROM autod;
INSERT INTO autod(regNr, mark, aasta, regPiirkond)
VALUES ('123 ABC', 'Audi', '2000', 1),
('777 AAA', 'Ford', '1988', 2),
('FIN 772', 'Ford', '2002', 1),
('111 CCC', 'Nissan', '2006', 1),
('128 HGF', 'Toyota', '2003', 1),
('544 CCH', 'VAZ', '1960', 2),
('206 PRE', 'Ford', 1986, 1),
('488 ZRI', 'Pontiac', 2001, 1),
('352 KXD', 'Geo', 1997, 1),
('207 QBZ', 'Buick', 1994, 1),
('017 RVZ', 'Pontiac', 1966, 1),
('314 EYE', 'Volkswagen', 2010, 1),
('513 UCR', 'Dodge', 2003, 1),
('454 WKE', 'GMC', 1993, 2),
('337 IOA', 'Lincoln', 2009, 1),
('581 YCR', 'Subaru', 1989, 2),
('252 BIJ', 'Saab', 1985, 2),
('188 ACU', 'Nissan', 2001, 2),
('584 JKK', 'Buick', 1988, 1),
('080 UAA', 'Toyota', 1997, 2),
('567 CDV', 'Mitsubishi', 2009, 2),
('566 WYX', 'Cadillac', 2004, 1),
('495 ZCO', 'Buick', 2008, 1),
('623 RYV', 'Volvo', 2011, 2),
('234 BZS', 'Audi', 1994, 1),
('123 GTP', 'Mazda', 1992, 2);
