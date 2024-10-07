-- 32. funktsioonid
USE AdventureWorksDW2019;

Create Function ILTVFGetEmployees()

--Tagastab töötaja andmed koos id, nime ja sünnikuupäevaga
returns table
as
return (select e.EmployeeKey, e.FirstName, cast(e.BirthDate as date) as DOB
from dbo.DimEmployee e);

--Mitmerealine funktsioon, mis tagastab töötaja andmed 
Create Function MSTVFGetEmployees()
returns @Table table (Id int, name nvarchar(20), DOB date)
as
begin
insert into @Table (Id, name, DOB)
select EmployeeKey, FirstName, cast(BirthDate as date)
From dbo.DimEmployee
return
end;

Select * from fn_ILTVF_GetEmployees();
Select * from fn_MSTVF_GetEmployees();

Update fn_ILTVF_GetEmployees() set FirstName='Sam1' Where EmployeeKey = 1;
Select * from fn_ILTVF_GetEmployees();

--33. funktsioonid

--Funktsioon tagastab töötaja nime selle identifikaatori järgi
create function GetEmployeeNameById(@Id int)
returns nvarchar(20)
as
begin
return (select name from dbo.tblEmployees where Id = @Id)
end;

--Funktsiooni teksti vaatamine
sp_helptext fn_GetEmployeeNameById;

--Funktsiooni muutmine selle teksti krüpteerimiseks
Alter Function fn_GetEmployeeNameById(@Id int)
returns nvarchar(20)
with encryption
as
begin
return (select name from dbo.tblEmployees where Id = @Id)
end;

Alter Function fn_GetEmployeeNameById(@Id int)
returns nvarchar(20)
with SchemaBinding
as
begin
return (select name from dbo.tblEmployees where Id = @Id)
end;

--34. funktsioonid

Create Table #PersonDetails(Id int, Name nvarchar(20));
Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

Select * from #PersonDetails

--Ajutise tabeli otsimine tempdb andmebaasi süsteemiobjektides
Select name from tempdb..sysobjects
where name like 'PersonDetails';

--Kohaliku ajutise tabeli loomise ja andmete sisestamise kord
Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');
Select * from #PersonDetails

Create Table ##EmployeeDetails(Id int, Name nvarchar(20))
