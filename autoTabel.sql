--SQL Server
create Database autoKudriashev;
use autoKudriashev;

create Table auto(
RegNr char(7) Primary Key,
Mark varchar(20),
Aasta int,
RegPiirk int);

insert into auto(Mark, RegNr, Aasta, RegPiirk)
values
('Audi','123 ABC',2000,1),
('Ford','777 AAA',1988,2),
('Ford','FIN 772',2002,1),
('Nissan','111 CCC',2006,1),
('Toyota','128 HGF',2003,1),
('VAZ','544 CCH',1960,2);

insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('009 HCS', 'BMW', 1996, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('888 IDT', 'Volkswagen', 1989, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('244 SMR', 'Cadillac', 2010, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('698 TOC', 'Jeep', 2008, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('334 THB', 'Mercedes-Benz', 2006, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('680 OQD', 'Mercedes-Benz', 1992, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('643 UZL', 'Toyota', 2007, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('984 CLU', 'Mazda', 2007, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('269 XMT', 'Alfa Romeo', 1993, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('581 EDH', 'Subaru', 2011, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('057 GMV', 'Hyundai', 2012, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('554 KTU', 'Suzuki', 2000, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('513 KUL', 'BMW', 2005, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('956 MGR', 'Dodge', 2001, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('146 RYX', 'Lamborghini', 1990, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('421 SOD', 'Mercury', 1991, 2);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('450 BIL', 'Aston Martin', 2010, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('838 KLC', 'Chevrolet', 2007, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('639 MSC', 'Jeep', 2003, 1);
insert into auto (RegNr, Mark, Aasta, RegPiirk) values ('172 HSY', 'GMC', 1996, 2);

--·         Järjesta autod tootmisaasta järgi kahanevasse järjekorda
select * from auto
order by aasta DESC;

--·         Väljasta kõik erinevad margid
select distinct RegNr,Mark from auto;

--·         Väljasta enne 1993. aastat toodetud autode registrinumbrid
select RegNr,Mark,Aasta from auto
where Aasta<1993;

--·         Väljasta enne 1993. aastat toodetud autode registrinumbrid tähestiku järjekorras
select RegNr,Mark,Aasta from auto
where Aasta<1993
order by Mark;

--·         Väljasta autode kõige varasem väljalaskeaasta (MIN)
select MIN(Aasta) AS minAasta from auto;

--·         Muuda registrinumbrit autol, mille id on 3 (uus number 333 KKK)
UPDATE auto
SET RegNr = '333 KKK'
WHERE RegNr = 'FIN 772';