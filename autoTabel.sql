--SQL Server
create Database autoKudriashev;
use autoKudriashev;

create Table auto(
RegNr char(7) Primary Key,
Mark varchar(20),
Aasta int,
RegPiirk int
)

insert into auto(Mark, RegNr, Aasta, RegPiirk)
values
('Audi','123 ABC',2000,1),
('Ford','777 AAA',1988,2),
('Ford','FIN 772',2002,1),
('Nissan','111 CCC',2006,1),
('Toyota','128 HGF',2003,1),
('VAZ','544 CCH',1960,2);

select * from auto;