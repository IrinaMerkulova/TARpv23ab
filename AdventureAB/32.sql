-- Loome funktsiooni fn_ILTVF_GetEmployees, mis tagastab tabeli
CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE -- Funktsioon tagastab andmed tabelina
AS
RETURN (
-- Valime töötajate võtme, eesnime ja sünnikuupäeva (tüüp konverteeritakse DATE-ks)
SELECT EmployeeKey, FirstName, CAST(BirthDate AS DATE) AS DOB
FROM DimEmployee
);

-- Loome funktsiooni fn_MSTVF_GetEmployees, mis tagastab tabeli koos määratletud struktuuriga
Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (EmployeeKey int, FirstName nvarchar(20), DOB Date) -- Tagastame tabeli määratud veergudega
as
Begin
-- Lisame andmed tabelisse @Table
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date) -- Valime töötajate võtme, eesnime ja sünnikuupäeva (konverteerituna)
From DimEmployee

Return -- Tagastame tulemuse
End

-- Käivitame funktsiooni fn_ILTVF_GetEmployees ja valime kõik tulemused
SELECT * FROM fn_ILTVF_GetEmployees();
