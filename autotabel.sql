--xampp server
create database autoTsogankov;
use autoTsogankov;
CREATE TABLE Autod (
    RegNr VARCHAR(7) PRIMARY KEY,
    Mark VARCHAR(20),
    Aasta INT,
    RegPiirk INT
);

--2
INSERT INTO Autod (Mark, RegNr, Aasta, RegPiirk) VALUES
('Audi', '123 ABC', 2000, 1),
('Ford', '777 AAA', 1988, 2),
('Ford', 'FIN 772', 2002, 1),
('Nissan', '111 CCC', 2006, 1),
('Toyota', '128 HGF', 2003, 1),
('VAZ', '544 CCH', 1960, 2);

-- 20 autot Mockaroo abil
INSERT INTO Autod (Mark, RegNr, Aasta, RegPiirk)
VALUES
('Chevrolet', '345 ABC', 2015, 2),
('BMW', '555 DEF', 2018, 1),
('Mercedes-Benz', '777 GHI', 2019, 1),
('Volvo', '999 JKL', 2017, 2),
('Hyundai', '111 MNO', 2016, 1),
('Kia', '222 PQR', 2015, 2),
('Subaru', '333 STU', 2014, 1),
('Mazda', '444 VWX', 2013, 2),
('Lexus', '666 YZA', 2012, 1),
('Infiniti', '777 BCD', 2011, 2),
('Porsche', '888 EFG', 2010, 1),
('Jeep', '999 HIJ', 2009, 2),
('Land Rover', '000 KLM', 2008, 1),
('Fiat', '111 NOP', 2007, 2),
('Renault', '222 QRS', 2006, 1),
('Peugeot', '333 TUV', 2005, 2),
('Citroën', '444 WXY', 2004, 1),
('Opel', '555 ZAB', 2003, 2),
('Suzuki', '666 CDE', 2002, 1),
('Mitsubishi', '777 EFG', 2001, 2);

--3
SELECT * FROM Autod ORDER BY Aasta DESC;

--4
SELECT DISTINCT Mark FROM Autod;

--5
SELECT RegNr FROM Autod WHERE Aasta < 1993;

--6
SELECT RegNr FROM Autod WHERE Aasta < 1993 ORDER BY RegNr;

--7
SELECT MIN(Aasta) AS EarliestYear FROM Autod;

--8
UPDATE Autod SET RegNr = '333 KKK' WHERE RegNr = 'FIN 772';

--9
DELETE FROM Autod WHERE RegNr = '777 AAA';

--10
INSERT INTO Autod (Mark, RegNr, Aasta, RegPiirk) VALUES ('Nissan', '555 NNN', 2007, 2);
SELECT * FROM Autod;
