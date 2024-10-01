-- 32 fail ( funktsioonid ) ------------------------------------------------------------------------------------------------------------------------------------------

-- Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide
Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey, FirstName, LastName, Cast(BirthDate as Date) as DOB
	From DimEmployee)
SELECT * from fn_ILTVF_GetEmployees()

-- Mitme avaldisega tabeliväärtusega funktsioonid e multi-statement table valued function (MSTVF)

Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (EmployeeKey int, FirstName nvarchar(20), LastName nvarchar(20), DOB Date)
as
Begin
Insert into @Table
SELECT EmployeeKey, FirstName, LastName, Cast(BirthDate as Date)
From DimEmployee
Return
End	
SELECT * FROM fn_MSTVF_GetEmployees()

-- Kui nüüd soovid mõlemat funktsiooni esile kutsuda, siis kasutad koodi
Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

-- Uuendame allasuvat tabelit ja kasutame selleks ILTVF funktsiooni.
UPDATE fn_ILTVF_GetEmployees() set FirstName = 'Sam1' Where EmployeeKey = 1
SELECT * from fn_ILTVF_GetEmployees()



-- 33 fail ( funktsioonid ) ------------------------------------------------------------------------------------------------------------------------------------------------

-- Funktsioon selleks, et võtta andmed FirstName väjlast, andmed leiame primaarne võte abiga
CREATE FUNCTION fn_GetEmployeeNameById(@id int)
Returns nvarchar(20)
as
Begin
Return (Select FirstName from DimEmployee WHERE EmployeeKey = @id)
End

SELECT dbo.fn_GetEmployeeNameById(1) as FirstName

-- Funktsiooni sisu vaatamise koodinäide
sp_helptext fn_GetEmployeeNameById



-- Nüüd muudame funktsiooni ja krüpteerime selle ära
ALTER FUNCTION fn_GetEmployeeNameById(@id int)
Returns nvarchar(20)
With Encryption
as 
Begin
Return (Select FirstName FROM DimEmployee WHERE EmployeeKey = @id)
END
SELECT dbo.fn_GetEmployeeNameById(2) as FirstName

-- Kustuta tblEmployees käsuga: Drop Table tblEmployees
DROP FUNCTION fn_GetEmployeeNameById

-- Nüüd muuda funktsiooni ja kasuta käsklust WITH SCHEMABINDING valikut
ALTER FUNCTION fn_GetEmployeeNameById(@id int)
RETURNS nvarchar(20)
With SchemaBinding
as
Begin
Return (Select FirstName from dbo.DimEmployee Where EmployeeKey = @id)
END
