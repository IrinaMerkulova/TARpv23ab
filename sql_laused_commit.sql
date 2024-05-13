-- db loomine
create database Tarpv23

-- db kustutamine
DRop DataBASE Tarpv23

-- gender ja person tabel loomine
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)
-----------------------------------------------------------
                      teine ​​tabel
-----------------------------------------------------------	
create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)

--- foreign key loomine
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)
-----------------------------------------------------------
	               kolmas tabel
-----------------------------------------------------------
--- loome uued tabelid
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)
-----------------------------------------------------------
	               neljas tabel
-----------------------------------------------------------	
create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentId int
)
-----------------------------------------------------------
	               tabelite täitmine
-----------------------------------------------------------
-- sisestame andmed
insert into Person (Id, Name, Email, GenderId)
values (1, 'Supermees', 's@s.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (2, 'Wonderwoman', 'w@w.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (3, 'Batman', 'b@b.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (4, 'Aquaman', 'a@a.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (5, 'Catwoman', 'c@c.com', 1)
insert into Person (Id, Name, Email, GenderId)
values (6, 'Antman', 'ant"ant.com', 2)
insert into Person (Id, Name, Email, GenderId)
values (7, 'Spiderman', 'spider@spiderman.com', 2)

insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')

--parandas taotluse
insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 149)

--- võõrvõtme piirangu maha võtmine
alter table Person
drop constraint tblPerson_GenderId_FK
	
-- vaatame tabeli andmeid
select * from Person
-----------------------------------------------------------
                      teines ​​tabel
-----------------------------------------------------------
-- sisestame väärtuse tabelisse
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- lisame võõrvõtme uuesti
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId

select * from Person
-----------------------------------------------------------
                      kolms ​​tabel
-----------------------------------------------------------
-- andmete sisestamine tabelisse
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')

select * from Department
-----------------------------------------------------------
	               neljas tabel
-----------------------------------------------------------
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (1, 'Tom', 'Male', 4000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (2, 'Pam', 'Female', 3000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (3, 'John', 'Male', 3500, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (4, 'Sam', 'Male', 4500, 2)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (5, 'Todd', 'Male', 2800, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (6, 'Ben', 'Male', 7000, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (7, 'Sara', 'Female', 4800, 3)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (8, 'Valarie', 'Female', 5500, 1)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (9, 'James', 'Male', 6500, NULL)
insert into Employees (Id, Name, Gender, Salary, DepartmentId)
values (10, 'Russell', 'Male', 8800, NULL)

select * from Employees
-------------------------------------------------------------
              esimene osa taotlustega
-------------------------------------------------------------
---lisame uue veeru tabelisse
alter table Person
add Age nvarchar(10)

	
--uuendame andmeid
update Person
set Age = 149
where Id = 8

	
--constraint loomine
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

	
--eemalda tabelist isik ID-ga 8 
select * from Person
go
delete from Person where Id = 8
go
select * from Person

	
--- lisame veeru juurde
alter table Person
add City nvarchar(25)

	
-- tahame tead kõiki, kes elavad Gothami linnas 
select * from Person where City = 'Gotham'
-- kõik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

	
-- näitab teatud vanusega inimesi
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)

	
--- näitab teatud vanusevahemikus olevaid inimesi
select * from Person where Age between 30 and 50

	
--- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'n%'
select * from Person where Email like '%@%'

	
-- naitab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'


--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

	
-- näitab, kelle on nimis ees WAS märke polnud
select * from Person where Name like '[^WAS]%'
-- näitab inimest, kes elab Gothamis või New Yorkis, ja on vanem kui 41
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

	
---võtab kolm esimest rida
select top 3 * from Person

	
--- kolm esimest, aga tabeli järjestus on Age ja siis Name
select * from Person
select top 3 Age, Name from Person

	
--- näitab esimesed 50% tabelis
select top 50 percent * from Person
-- näitab inimesi vanuse järgi sorteeritud
select * from Person order by cast(Age as int)
select * from Person order by Age

	
-- näitab inmesi summarne vanus
select sum(cast(Age as int)) from Person


--- kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person
--- kõige vanem isik
select max(cast(Age as int)) from Person

select City, sum(cast(Age as int)) as TotalAge from Person group by City
