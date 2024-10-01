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

