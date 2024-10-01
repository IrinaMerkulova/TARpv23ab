--32 Funktsioonid
--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:
create function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey ,FirstName,Cast(BirthDate as Date) as DOB
	From DimEmployee)

--Mitme avaldisega tabeliväärtusega funktsioonid e multi-statement table valued function (MSTVF):
create function fn_MSTVF_GetEmployees()
Returns @Table table (EmployeeKey int, FirstName nvarchar(20),DOB Date)
as
begin
insert into @Table
Select EmployeeKey,FirstName,CAST(BirthDate as Date)
From DimEmployee
return
End
	
--Kui nüüd soovid mõlemat funktsiooni esile kutsuda, siis kasutad koodi:
Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()
	
--Uuendame allasuvat tabelit ja kasutame selleks ILTVF funktsiooni
Update fn_ILTVF_GetEmployees() set FirstName='Sam1' where EmployeeKey=1;
Select * from fn_ILTVF_GetEmployees()

--33 Funktsioonid
--Skaleeritav funktsioon ilma krüpteerimata
Create Function fn_GetEmpoyeeNameById(@Id int)
Returns nvarchar(20)
as
Begin
return (Select FirstName From DimEmployee Where EmployeeKey =@Id)
END

--Funktsiooni sisu vaatamise koodinäide
sp_helptext fn_GetEmployeeNameById

--Nüüd muudame funktsiooni ja krüpteerime selle ära:
Alter Function fn_GetEmployeeNameById(@Id int)
returns nvarchar(20)
With Encryption
as
Begin
return (Select FirstName from DimEmployee where EmployeeKey = @Id)
END

--Nüüd muuda funktsiooni ja kasuta käsklust WITH SCHEMABINDING valikut
Alter function fn_GetEmpoyeeNameById(@Id int)
Returns nvarchar(20)
With SchemaBinding
as
begin
Return (Select FirstName from DimEmployee where EmployeeKey = @Id)
END
