-- db loomine
create database Tarpv23
-- Andmebaasi "Tarpv23" loomine.

--?
DRop DataBASE Tarpv23
-- See käsk kustutab "Tarpv23" andmebaasi.

--?
create table Gender
(
Id int NOT NULL primary key,
Gender nvarchar(10) not null
)
-- Esimene rida loob tabeli Sugu. Teine rida tagab, et väärtus ei pea olema null. Varchar maksimaalne pikkus 10 tähemärki.
	
create table Person
(
Id int not null primary key,
Name nvarchar(25),
Email nvarchar(30),
GenderId int
)
-- Esimene rida loob tabeli "Isik". Teine rida muudab selle nii, et väärtus ei saa olla null. 
--Kolmas rida loob nime ID. Neljas rida loob kordumatu meili ID. Viies rida on isiku sootunnus.
	
--- andmete sisestamine tabelisse
insert into Gender (Id, Gender)
values (1, 'Female')
insert into Gender (Id, Gender)
values (2, 'Male')
-- Naissugu sisestamine id-ga 
-- Meessugu sisestamine id-ga 
	
--- ?
alter table Person add constraint tblPerson_GenderId_FK
foreign key (GenderId) references Gender(Id)
-- Esimene rida on võõrvõtme lisamine tabeli „Person” veergu „GenderId” ja tabeli „Sugu” veergu „Id”.
-- Loob andmete terviklikkuse piirangu.
	
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
-- tabelis „Isik”, mis sisaldab teavet iga inimese kohta,
-- sealhulgas nimi, e-posti aadress ja sootunnus.
	
-- vaatame tabeli andmeid
select * from Person
-- See päring ei vali tabelist Isik kõiki andmeid.

--- võõrvõtme piirangu maha võtmine
alter table Person
drop constraint tblPerson_GenderId_FK
-- See päring on välisvõtme kustutamiseks tabelist "Isik".
	
-- sisestame väärtuse tabelisse
insert into Gender (Id, Gender)
values (3, 'Unknown')
-- See päring lisas edukalt uue kirje soo tabelisse.
-- Tabelis "Sugu" on nüüd täiendav kirje "Teadmata".

-- lisame võõrvõtme uuesti
alter table Person
add constraint DF_Person_GenderId
default 3 for GenderId
-- Tabelisse "Person" ei sisestata väärtust veerule "GenderId",
-- sellele veerule määratakse automaatselt vaikimisi väärtus 3.

---- 2 tund

select * from Person
select * from Gender

insert into Person (Id, Name, Email)
values (8, 'Test', 'Test')
-- Uus kirje sisaldab infot isiku nime "Test" ja e-posti aadressi "Test" kohta ning sellel on GenderId väärtus 3,
-- kuna selle veeru jaoks on vaikimisi määratud väärtus 3.
	
---lisame uue veeru tabelisse
alter table Person
add Age nvarchar(10)
-- Lisa uus veerg nimega "Age" tabelisse "Person", mis salvestab vanuse nvarchar-vormingus.

--uuendame andmeid
update Person
set Age = 149
where Id = 8
-- Värskendatakse veeru "Age" väärtus kirjega, mille Id on 8.

--?
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)
-- Lisab kontrolli veeru "Age" jaoks tabelisse "Person".
	
insert into Person (Id, Name, Email, GenderId, Age)
values (9, 'Test', 'Test', 2, 160)
-- Üritab sisestada kirjet tabelisse "Person" vale vanusega.
	
--?
select * from Person
go
delete from Person where Id = 8
go
select * from Person
-- Valib kõik kirjed tabelist "Person".
-- Kustutab kirje tabelist "Person", mille Id on 8.
	
--- lisame veeru juurde
alter table Person
add City nvarchar(25)
-- Lisab uue veeru "City" tabelisse "Person".
	
-- tahame tead kõiki, kes elavad Gothami linnas 
select * from Person where City = 'Gotham'
-- Valib kõik isikud, kes elavad linnas Gotham.
	
-- kõik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'
-- Valib kõik isikud, kes ei ela linnas Gotham.

-- näitab teatud vanusega inimesi
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)
-- Valib kõik isikud, kelle vanus on 100, 50 või 20 aastat.
	
--- näitab teatud vanusevahemikus olevaid inimesi
select * from Person where Age between 30 and 50
-- Valib kõik isikud vanuses 30 kuni 50 aastat.

--- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'n%'
select * from Person where Email like '%@%'
-- Valib kõik isikud, kelle eesnimi ei sisalda tähti W, A ega S.
	
-- n'itab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'
-- Valib kõik kirjed tabelist "Person", mille veerg "Email" ei sisalda "@" sümbolit.
	
--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'
-- Valib kõik kirjed tabelist "Person", mille veerg "Email" vastab mustrile, kus "@" sümbol järgneb täpselt ühele märgile, seejärel "@" ja seejärel mõni sümbol, mis lõpeb ".com"-ga.
	
--?
select * from Person where Name like '[^WAS]%'
-- Valib kõik kirjed tabelist "Person", mille nimi algab tähtedega, mis ei ole W, A ega S.
	
--- ?
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40
-- Valib kõik isikud, kes elavad Gothami või New Yorgis ja on vanemad kui 40 aastat.
	
---võtab kolm esimest rida
select top 3 * from Person
-- Valib tabelist "Person" esimesed kolm kirjet.
	
--- kolm esimest, aga tabeli järjestus on Age ja siis Name
select * from Person
select top 3 Age, Name from Person
-- Valib tabelist "Person" esimesed kolm kirjet, sorteerides need vanuse ja seejärel nime järgi.
	
--- näitab esimesed 50% tabelis
select top 50 percent * from Person
-- See päring valib tabelist "Person" esimese poole kirjetest ja sorteerib need.

--?
select * from Person order by cast(Age as int)
select * from Person order by Age
-- Mõlemad päringud sorteerivad kirjed tabelis "Person" vanuse järgi.
	
--?
select sum(cast(Age as int)) from Person
-- See päring arvutab kõikide tabeli "Person" kirjete vanuste summa.

--- kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person
-- See päring valib tabelist "Person" kõige noorema inimese vanuse.

--- kõige vanem isik
select max(cast(Age as int)) from Person
-- See päring valib tabelist "Person" kõige vanema inimese vanuse.
	
select City, sum(cast(Age as int)) as TotalAge from Person group by City
-- See päring arvutab kõigi tabelis "Person" iga linna inimeste kogu vanuse.



	
--- tund 3

--- loome uued tabelid
create table Department
(
Id int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)
-- loob uue tabeli nimega "Department" nelja veeruga: "Id", "DepartmentName", "Location" ja "DepartmentHead".
	
create table Employees
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary nvarchar(50),
DepartmentId int
)
-- loob uue tabeli nimega "Employees" viie veeruga: "Id", "Name", "Gender", "Salary" ja "DepartmentId".
	
--?
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (1, 'IT', 'London', 'Rick')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (2, 'Payroll', 'Delhi', 'Ron')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (3, 'HR', 'New York', 'Christie')
insert into Department (Id, DepartmentName, Location, DepartmentHead)
values (4, 'Other Deparment', 'Sydney', 'Cindrella')
-- lisab kirjed tabelisse "Department". Iga kirje esindab teavet konkreetse osakonna kohta.

select * from Department
-- päring select * from Department toob kõik andmed tabelist "Department", kuvades teavet iga osakonna kohta.
	
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
-- päringud insert into Employees lisavad uusi kirjeid tabelisse "Employees" teabega töötajate kohta, sealhulgas nende identifikaatori, nime, soo, palga ja osakonna identifikaatori.

---?
select distinct Name, DepartmentId from Employees
-- valib ainulaadsed töötajate nimed ja nende vastavad osakonna identifikaatorid tabelist "Employees".
	
---?
select sum(cast(Salary as int)) from Employees
-- päring arvutab kõikide töötajate palkade summa tabelis "Employees".

---?
select min(cast(Salary as int)) from Employees
-- päring leiab väikseima palga kõikide töötajate seas tabelis "Employees".

alter table Employees
add City nvarchar(25)
-- päring lisab uue veeru "City" tabelisse "Employees".

alter table Employees
add DepartmentId
int null
-- päring lisab uue veeru "DepartmentId" tabelisse "Employees" tüübiga int ja lubab väärtuse NULL.

--?
alter table Employees
add MiddleName nvarchar(30)
-- päring lisab uue veeru "MiddleName" tabelisse "Employees" tüübiga nvarchar maksimaalse pikkusega 30 sümbolit.
	
alter table Employees
add LastName nvarchar(30)
-- päring lisab uue veeru "LastName" tabelisse "Employees" tüübiga nvarchar maksimaalse pikkusega 30 sümbolit.
	
update Employees set FirstName = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1
update Employees set FirstName = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2
update Employees set FirstName = 'John', MiddleName = NULL, LastName = NULL
where Id = 3
update Employees set FirstName = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4
update Employees set FirstName = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set FirstName = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6
update Employees set FirstName = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7
update Employees set FirstName = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8
update Employees set FirstName = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9
update Employees set FirstName = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10
-- päringud uuendavad teavet tabelis "Employees", määrates väärtused veergudele "FirstName", "MiddleName" ja "LastName" iga kirje jaoks vastava identifikaatori alusel.

--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(FirstName, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department
-- päring valib identifikaatori ja nime tabelist "Employees", kus nimi võib olla pärit veergudest "FirstName", "MiddleName" või "LastName". Teine ja kolmas päring lihtsalt valivad kõik andmed tabelitest "Employees" ja "Department".

--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees
-- protseduur tagastab töötajate eesnimed ja sugu tabelist "Employees". 

--- 
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select FirstName, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end
-- Protseduur töötajate saamiseks soo ja osakonna järgi

--- kõik esimeses osakonnas meessoost töötavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1
-- Saada kõik meessoost töötajad esimeses osakonnas
	
spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'
-- Sama, kuid parameetrite nimetamisega


--?
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end
-- Protseduur töötajate arvu saamiseks soo järgi
	
-- annab teada, palju on meessoost isikuid ning kuvab vastava stringi
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount
-- Saada naiste arv ja kuvada vastav teade sõltuvalt tulemusest

-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount
-- Saada meeste arv ja kuvada see
	
---?
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
-- Protseduur kõigi töötajate arvu saamiseks
	
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees
-- Käivitada protseduur ja kuvada tulemus
	
--- ?
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = FirstName from employees where Id = @Id
end
-- Protseduur töötaja nime saamiseks tema ID järgi

--?
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName
-- Saada töötaja nimi tema ID järgi ja kuvada see

--?
create proc spGetNameById2
@Id int
as begin
	return (select FirstName from Employees where Id = @Id)
end
-- Protseduur töötaja nime saamiseks tema ID järgi
	
-- ?
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName
-- Saada töötaja nimi tema ID järgi ja kuvada see
	
select * from Employees
