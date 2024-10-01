--35. Indeksid serveris

create table tblEmployee(
Id int primary key identity(1,1),
Name varchar(50),
Salary int,
Gender varchar(10)
);
insert into tblEmployee(Name, Salary, Gender)
values 
('Sam',2500,'Male'),
('Pam',6500,'Female'),
('John',4500,'Male'),
('Sara',5500,'Female'),
('Todd',3100,'Male');

--Võtab välja kõik töötajad, kelle palk jääb vahemikku 5000-7000
select * from tblEmployee where Salary > 5000 and Salary < 7000;

--Loob tabeli indeksi
create index IX_DimEmployee_Salary
on DimEmployee (BaseRate ASC)

--kuvab teavet tabeli struktuuri kohta
exec sp_help 'DimEmployee'; 

--Indeksi kustutamine
drop index DimEmployee.IX_tblEmployee_Salary
