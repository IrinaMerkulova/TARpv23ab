-- db loomine
create database Tarpv23

-- andmebaasi kustutamine
DRop DataBASE Tarpv23

-- ID ja Genderi veergude andmebaasi loomine
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)
-- tabeli loomine "Person"
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

--- Sekundaarvõtme lisamine
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)

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

-- vaatame tabeli andmeid
select * from Person

--- võõrvõtme piirangu maha võtmine
alter table Person
drop constraint tblPerson_GenderId_FK

-- sisestame väärtuse tabelisse
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- lisame võõrvõtme uuesti
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId


---- 2 tund

select * from Person
select * from Gender

insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')

---lisame uue veeru tabelisse
alter table Person
add Age nvarchar(10)

--uuendame andmeid
update Person
set Age = 149
where Id = 8

-- kontrollib sisestatud inimese vanust vahemikus 0-150
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 160)

-- kustuta tabelist "Person" rida, kus ID=8
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

-- n'itab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'

--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

--Valib kõik kirjed, mis ei alga tähega "w" "a" "s"
select * from Person where Name like '[^WAS]%'
--- näidata kõiki kirjeid, kus on märgitud linn "Gotham" või "New York" ja vanus on kõrgem või võrdne 40
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

---võtab kolm esimest rida
select top 3 * from Person

--- kolm esimest, aga tabeli järjestus on Age ja siis Name
select * from Person
select top 3 Age, Name from Person

--- näitab esimesed 50% tabelis
select top 50 percent * from Person
-- valib kõik kirjed vanuse järgi
select * from Person order by cast(Age as int)
select * from Person order by Age

-- vanuste summa 
select sum(cast(Age as int)) from Person

--- kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person
--- kõige vanem isik
select max(cast(Age as int)) from Person

select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3

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

-- kirjutab andmed tabelitesse "Department" ja "Employees"
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')

select * from Department

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

--- näitab ainult üks kord nime, kui see kordub
select distinct Name, DepartmentId from Employees

--- kõigi palkade summa
select sum(cast(Salary as int)) from Employees
--- minimaalne palk
select min(cast(Salary as int)) from Employees


alter table Employees
add City nvarchar(25)


alter table Employees
add DepartmentId
int null


-- lisab tabelisse "Employees" veerud nimega "MiddleName" ja "LastName", samuti täidab selle andmetega
alter table Employees
add MiddleName nvarchar(30)

alter table Employees
add LastName nvarchar(30)


update Employees set Name = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1
update Employees set Name = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2
update Employees set Name = 'John', MiddleName = NULL, LastName = NULL
where Id = 3
update Employees set Name = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4
update Employees set Name = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set Name = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6
update Employees set Name = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7
update Employees set Name = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8
update Employees set Name = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9
update Employees set Name = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10


--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(Name, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department





--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- loob protseduur, kus on võimalik leida töötajaid nende soo ja ameti järgi
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select Name, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

--- kõik esimeses osakonnas meessoost töötavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



-- loob protseduuri, kus saab teada, kui palju inimesi nende soo alusel töötab
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- annab teada, palju on meessoost isikuid ning kuvab vastava stringi
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

--- loob protseduuri, kus saab teada, kui palju inimesi ettevõttes töötab
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

--- loob protseduuri, mis näitab inimese nime tema ID järgi
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = Name from employees where Id = @Id
end

-- Otsib inimese nime tema ID, ID=6 nimi Ben
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName

-- loob protseduuri, mis näitab inimese nime tema ID järgi ilma muutujata EmployeeName
create proc spGetNameById2
@Id int
as begin
	return (select Name from Employees where Id = @Id)
end

-- ?
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
