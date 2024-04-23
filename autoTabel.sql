--sql server
create database autoGerega;
use autoGerega;
create table autod(
  regNr char(7) primary key,
  mark varchar(20),
  aasta int,
  regPiirkond int)
