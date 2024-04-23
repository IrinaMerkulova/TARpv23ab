---SQL Server
CREATE DATABASE autoTsarev;
USE autoTsarev;
CREATE TABLE autod(
  regNr char(7) PRIMARY KEY,
  mark varchar(20),
  aasta int,
  regPiirkond int);
SELECT * FROM autod;
INSERT INTO autod (Mark,RegNr,Aasta,regPiirkond)
VALUES ('Audi','123 ABC',2000,1),
('Ford','777 AAA',1988,2),
('Ford','FIN 772',2002,1),
('Nissan','111 CCC',2006,1),
('Toyota','128 HGF',2003,2),
('VAZ','544 CCH',1960,2),
('Volkswagen','626 RTC',2011,1),
('McLaren','314 ZDA',2021,1),
('Lada','666 KAN',2004,2),
('Cadillac','431 DDC',1999,1),
('BMW','423 SUS',2022,2),
('Ferrari','CAN 213',2001,2),
('Honda','RAB 232',2000,1),
('Rolls-Royce','231 ACC',2000,1),
('Dodge','SAS BAK',2014,1),
('Lamborghini','BCE 221',2005,2),
('Fiat','323 GTC',1994,1),
('Mercedes-Benz','444 GLS',2020,2),
('Audi','FAR 231',1999,1),
('Citroen','DAF 228',2000,2),
('BMW','889 ICA',2022,1),
('Land Rover','331 GTR',1998,2),
('Nissan','776 TTC',2011,1),
('Opel','523 TOP',2007,1),
('Daihatsu','612 CAB',2006,2),
('Lexus','522 POP',2008,1);
--Autod järjestatuna tootmisaasta järgi kahanevasse järjekorda:
SELECT * FROM autod ORDER BY Aasta DESC;
--Kõikide erinevate autode margid:
SELECT DISTINCT Mark FROM autod;
--Enne 1993. aastat toodetud autode registrinumbrid:
SELECT RegNr FROM autod WHERE Aasta < 1993;
--Enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras:
SELECT RegNr FROM autod WHERE Aasta < 1993 ORDER BY RegNr;
--Autode kõige varasem väljalaskeaasta (MIN):
SELECT MIN(Aasta) AS Varasem_Aasta FROM autod;
--Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK):
UPDATE autod SET RegNr = '333 KKK' WHERE RegNr = '111 CCC';
SELECT * FROM autod;
