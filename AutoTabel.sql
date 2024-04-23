--sql server
CREATE DATABASE AutoJegorov;
USE AutoJegorov;
CREATE TABLE Autod (
  regNr char(7) primary key,
  mark varchar(20) ,
  aasta int,
  regPiirkond int)
