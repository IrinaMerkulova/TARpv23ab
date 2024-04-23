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
