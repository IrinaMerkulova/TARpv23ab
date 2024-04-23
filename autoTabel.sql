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

---veel 20  autod mockaroo abil

INSERT INTO autod (regNr,Mark,Aasta,RegPiirk)
VALUES ('546 CZP', 'Chevrolet', 2009, 1),
('158 QLN', 'Toyota', 2009, 1);
('620 CWH', 'Buick', 2005, 1),
('837 CDP', 'Subaru', 1995, 1),
('252 MYN', 'Dodge', 1999, 1),
('456 QCM', 'Aston Martin', 2010, 2),
('723 JDU', 'Honda', 2010, 1),
('426 STE', 'Chevrolet', 2006, 1),
('199 FEH', 'Mitsubishi', 2006, 2),
('245 ZIX', 'Daewoo', 2001, 1),
('170 NKK', 'Volkswagen', 1997, 1),
('148 YNC', 'Saab', 2011, 2),
('012 LBS', 'BMW', 2003, 2),
('261 RES', 'Chevrolet', 1976, 2),
('046 HFP', 'Mercury', 1993, 1),
('516 NPF', 'Chevrolet', 1994, 1),
('910 VVQ', 'Mercury', 2003, 2),
('047 BHD', 'Chevrolet', 2000, 1),
('662 EID', 'Chevrolet', 1997, 2),
('954 DSV', 'Suzuki', 2009, 1);

---Järjesta autod tootmisaasta järgi kahanevasse järjekorda
Select * from autod Order by Aasta DESC;

---Väljasta kõik erinevad margid
Select DISTINCT Mark from autod;

---Väljasta enne 1993. aastat toodetud autode registrinumbrid
Select regNr from autod Where Aasta < 1993;

---Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
Select regNr from autod Where Aasta < 1993 Order by regNr;

---Väljasta autode kõige varasem väljalaskeaasta (MIN)
Select MIN(Aasta) as Min from autod;

--- Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
Update autod SET regNr='333 KKK' Where regNr='FIN 772'
