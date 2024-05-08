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

--- andmete sisestamine tabelisse
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')

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

create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentId int
)
