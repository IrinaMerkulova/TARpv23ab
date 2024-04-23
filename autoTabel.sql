--sql server
create database autoGerega;
use autoGerega;
create table autod(
  regNr char(7) primary key,
  mark varchar(20),
  aasta int,
  regPiirkond int)

  insert into autod (mark, regNr, aasta, regPiirkond)
  values ('Audi', '123 ABC', '2000', '1');
    insert into autod (mark, regNr, aasta, regPiirkond)
  values ('Ford', '777 AAA', '1988', '2');
  insert into autod (mark, regNr, aasta, regPiirkond)
  values ('Ford', 'FIN 772', '2002', '1');
    insert into autod (mark, regNr, aasta, regPiirkond)
  values ('Nissan', '111 CCC', '2006', '1');
  insert into autod (mark, regNr, aasta, regPiirkond)
  values ('Toyota', '128 HGF', '2003', '1');
  insert into autod (mark, regNr, aasta, regPiirkond)
  values ('VAZ', '544 CCH', '1960', '2');
  insert into autod (mark, regNr, aasta, regPiirkond) values ('Ram', '332CIQ', 2012, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mitsubishi', '614TFJ', 1989, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '743PUN', 2000, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '619SDH', 2013, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Audi', '125MMZ', 2009, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Land Rover', '695ZCE', 1992, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Hummer', '956JHH', 2003, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '722RRU', 2012, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Plymouth', '117YNP', 1992, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '677TRS', 2000, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Kia', '146PMF', 2002, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('BMW', '119HKM', 2001, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('BMW', '477VMP', 1992, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Ford', '042MCW', 1989, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Dodge', '065BYL', 2007, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Mercedes-Benz', '834KSN', 1999, 2);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Suzuki', '634ZPO', 2002, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('GMC', '117YZH', 1992, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Toyota', '997GIH', 1993, 1);
insert into autod (mark, regNr, aasta, regPiirkond) values ('Audi', '036HWK', 1999, 2);

select mark,aasta from autod
order by aasta desc

SELECT DISTINCT mark FROM autod;






