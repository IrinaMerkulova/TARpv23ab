-- 34 fail ( lookalsed ja globaalsed tabelid ) ----------------------------------------------------------------------------------------------------------------------

-- #PersonDetails on local temporary tabel koos Id ja Name veeruga
Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Sisesta andmed ajutisse tabelisse
INSERT INTO #PersonDetails Values(1,'Mike'), (2, 'John'), (3, 'Todd');

-- Vaata tabeli sisu ajutise tabeli abil
Select * from #PersonDetails

-- Päri sysobjects käsuga TEMPDB alt. Tabeli nimi on järeliitega alakriipsutatud ja suvaliste numbritega. Selle tulemusel pead päringus kasutama LIKE operaatorit.
Select Name from tempdb.sysobjects where Name like '#PersonDetails%'


-- Kui kasutaja tahab kustutada ajutist tabelit, siis tuleb kasutada käsklust
DROP TABLE #PersonDetails

-- protseduur selleks, et luua lokaalne tabeli kiiresti
CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
CREATE TABLE #PersonDetails(Id int, Name nvarchar(20))
INSERT INTO #PersonDetails Values(1,'Mike'), (2, 'John'), (3, 'Todd');
SELECT * FROM #PersonDetails
END
EXEC spCreateLocalTempTable;

-- Kuidas luua globaalset ajutist tabelit
CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20));

