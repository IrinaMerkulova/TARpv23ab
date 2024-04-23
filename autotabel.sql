---SQL server
CREATE DATABASE autoViblyy;
USE autoViblyy;
CREATE TABLE autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)

INSERT autod VALUES ('Audi', '123 ABC', 2000, 1)
INSERT autod VALUES ('Ford', '777 AAA', 1988, 2)
