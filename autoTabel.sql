---SQL SERVER
CREATE DATABASE autoSats; 
USE autoSats;
CREATE table autod(
  regNr char(7) Primary Key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
