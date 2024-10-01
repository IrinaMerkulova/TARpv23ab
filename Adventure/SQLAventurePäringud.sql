SELECT * FROM DimEmployee

-- 32 fail ( funktsioonid ) ------------------------------------------------------------------------------------------

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



-- 33 fail ( funktsioonid ) ------------------------------------------------------------------------------------------------

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


-- 34 fail ( lookalsed ja globaalsed tabelid ) ----------------------------------------------------------------------------------------------

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


-- 35 fail ( Indeksid ) --------------------------------------------------------------------------------------------

-- leiame töötajad, kes oli jäänud haigeks suurem kui 30 t. ja väiksem kui 60 t.
SELECT * FROM DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60

-- Nüüd loome indeksi, mis aitab päringut: Loome indeksi SickLeaveHours veerule
CREATE INDEX IX_tblEmployee_Salary
ON DimEmployee(SickLeaveHours ASC)

-- Kui soovid vaadata Indeksit: Object Exploreris laienda Indexes kausta. 
-- Alternatiiviks kasuta sp_helptext-i süsteemi SP-de jaoks.
-- Järgnev päring tagastab kõik indeksid tblEmployee tabelis.
Execute sp_helptext DimEmployee

-- Kui soovid kustutada indeksit: Kui kustutad indeksi, siis täpsusta tabeli nimi.
Drop index DimEmployee.IX_tblEmployee_Salary

-- 36 fail ( Klasteerid ) ----------------------------------------------------------------------------------------------

-- Loome tabel
CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)

-- Lisame andmed nagu siin
INSERT INTO tblEmployee VALUES(3, 'John', 4500, 'Male', 'New York'),
(1, 'Sam', 2500, 'Male', 'London'),
(4, 'Sara', 5500, 'Female', 'Tokyo'),
(5, 'Todd', 3100, 'Male', 'Toronto'),
(2, 'Pam', 6500, 'Female', 'Sydney')

-- Käivita järgnev päring
Select * from tblEmployee


-- Sellepärast, et me ei või luua "Clustered" indeks, siis me kustutame praegune "Clustered" indeks
-- "PK__tblEmplo__3214EC0706CD04F7" nimelt
DROP INDEX PK__tblEmplo__3214EC0706CD04F7

-- Loome oma "Clustered" indeks tblEmployee jaoks
CREATE CLUSTERED INDEX IX_tblEmployee_Name ON tblEmployee(Name)

-- Kustutame oma indeks
DROP INDEX tblEmployee.IX_tblEmployee_Name

-- Nüüd käivita järgnev kood uue klastreeritud ühendindeksi loomiseks Gender ja Salary veeru põhjal
CREATE CLUSTERED INDEX IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

Select * from tblEmployee

-- Samas mitte-klastreeritud on salvestatud tabelist eraldi ja on vaja lisaruumi
CREATE NONCLUSTERED INDEX IX_tblEmployee_Name 
ON tblEmployee(Name)

-- 37 fail ( Unikaalne ja mitte unikaalne index ) -------------------------------------------------------------------------------

-- Loome tabeli Employee, kui seda ei ole loodud
CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)

-- Saame kontrollida seda käsklusega sp_helpindex , mis on süsteemi SP talletatud
Execute sp_helpindex tblEmployee

-- Nüüd on Id veerg UNIQUE CLUSTERED INDEX tüüpi 
INSERT INTO tblEmployee VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York'), (1, 'John', 'Menco', 2500, 'Male', 'Londod')

-- Kui proovime kustutada Unique Clustered Index-st, siis anna meile veateate
DROP INDEX tblEmployee.PK__tblEmplo__3214EC07236943A5

-- Nüüd proovime sisestada duplikaatväärtust Id veergu ja veateadet ei näe.
INSERT INTO tblEmployee VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York'), (1, 'John', 'Menco', 2500, 'Male', 'Londod')

-- Kuidas saab luua unikaalset mitte-klastreeritud indeksit FirstName ja LastName veeru põhjal.
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

-- Kui peaksid lisama unikaalse piirangu, siis unikaalne indeks luuakse tagataustal. Selle tõestuseks lisame koodiga unikaalse piirangu City veerule.
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

-- Kui käivitad EXECUTE SP_HELPCONSTRAINT tblEmployee, siis tekib nimekiri UNIQUE NONCLUSTERED indeks.
EXECUTE SP_HELPCONSTRAINT tblEmployee

-- Kui soovin ainult viie rea tagasi lükkamist ja viie mitte korduva sisestamist, siis selleks kasutatakse IGNORE_DUP_KEY valikut
CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

-- 38 fail ( Indeksi plussid ja miinused ) -------------------------------------------------------------------------------------------

-- Loo mitte-klastreeritud indeks SickLeaveHours veerule
CREATE NonClustered Index IX_DimEmployee_SickLeaveHours
On DimEmployee ( SickLeaveHours Asc );

Select * from DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60;

--  Kui soovid uuendada või kustutada rida, siis SQL server peab esmalt leidma rea ja indeks saab aidata seda otsingut kiirendada.
DELETE FROM DimEmployee where SickLeaveHours = 31;
UPDATE DimEmployee Set SickLeaveHours = 20 where SickLeaveHours = 40

-- See välistab päringu käivitamisel ridade sorteerimise, mis oluliselt  suurendab  protsessiaega.
SELECT * FROM DimEmployee order by SickLeaveHours

-- Salary veeru indeks saab aidata ka allpool olevat päringut. Seda tehakse indeksi tagurpidi skanneerimises.
SELECT * FROM DimEmployee order by SickLeaveHours DESC

-- GROUP BY päringud saavad kasu indeksitest
SELECT SickLeaveHours, Count(SickLeaveHours) as Total from DimEmployee GROUP BY SickLeaveHours


-- 39 fail ( SQL serveris VIEWS ) ---------------------------------------------------------------------

SELECT * FROM DimEmployee
SELECT * FROM DimSalesTerritory

-- Selleks, et saada soovitud tulemus, me peaksime ühendama kaks tabelit omavahel. Kui JOIN-d on sulle uus teema, siis vaata eelnevaid harjutusi JOIN-de kohta.
SELECT EmployeeKey, FirstName, SickLeaveHours, ST.SalesTerritoryRegion
FROM DimEmployee E join DimSalesTerritory ST
on E.SalesTerritoryKey = ST.SalesTerritoryKey

-- Nüüd loome view, kus kasutame JOIN-i
CREATE VIEW vWEmployeesSalesTerritoryRegion
as
SELECT E.EmployeeKey, E.FirstName, E.SickLeaveHours, ST.SalesTerritoryRegion
FROM DimEmployee E
JOIN DimSalesTerritory ST
ON E.SalesTerritoryKey = ST.SalesTerritoryKey;

-- Kui soovime näha andmeid läbi view, siis selleks saab kasutada SELECT käsklust
SELECT * FROM vWEmployeesSalesTerritoryRegion

-- View, mis tagastab ainult IT osakonna töötajad
CREATE VIEW vWCanadaSalesTerritoryRegion_Employees
AS 
SELECT E.EmployeeKey, E.FirstName, E.SickLeaveHours, ST.SalesTerritoryRegion
FROM DimEmployee E
JOIN DimSalesTerritory ST
ON E.SalesTerritoryKey = ST.SalesTerritoryKey
WHERE ST.SalesTerritoryRegion = 'Canada'


SELECT * FROM vWCanadaSalesTerritoryRegion_Employees

-- View, kus ei ole Salary veergu
CREATE VIEW vWEmployeesCountBySalesTerritoryRegion
as
SELECT ST.SalesTerritoryRegion, Count(E.EmployeeKey) as TotalEmployees
FROM DimEmployee E
JOIN DimSalesTerritory ST
ON E.SalesTerritoryKey = ST.SalesTerritoryKey
GROUP BY ST.SalesTerritoryRegion


SELECT * FROM vWEmployeesCountBySalesTerritoryRegion

sp_helptext vWEmployeesCountBySalesTerritoryRegion

DROP VIEW [vWEmployeesCountBySalesTerritoryRegion]

-- 40 fail ( View uuendused ) --------------------------------------------------------

-- Teeme View, mis tagastab peaaegu kõik veerud, aga va Salary veerg.
CREATE VIEW vWEmployeesData 
AS 
SELECT EmployeeKey, FirstName, SickLeaveHours
FROM DimEmployee

SELECT * FROM vWEmployeesData

-- Uuendame view-d, aga SQL server uuendab tblEmployee tabelis olevat infot. Selleks peab kasutama SELECT väljendit
UPDATE vWEmployeesData
SET FirstName = 'Mikey'
WHERE EmployeeKey = 2;

-- Samas on võimalik sisestada ja kustutada ridu baastabelis ning kasutada view-d.
DELETE FROM vWEmployeesData WHERE EmployeeKey = 2;
INSERT INTO vWEmployeesData(EmployeeKey, FirstName) VALUES (2, 'Mikey');
SELECT * FROM vWEmployeesData

-- Kood selle loomiseks
CREATE VIEW vwEmployeeDetailsBySalesTerritoryRegion
AS
SELECT E.EmployeeKey, E.FirstName, E.SickLeaveHours, ST.SalesTerritoryRegion
FROM DimEmployee E
JOIN DimSalesTerritory ST
ON E.SalesTerritoryKey = ST.SalesTerritoryKey;

SELECT * FROM vwEmployeeDetailsBySalesTerritoryRegion

-- Tee päring ja peaksid nägema tulemust, mis on välja toodud üleval pildil
SELECT * FROM vwEmployeeDetailsBySalesTerritoryRegion

-- Nüüd uuendame John osakonda HR pealt IT peale. Hetkel on kaks töötajat HR osakonnas.
Update vwEmployeeDetailsBySalesTerritoryRegion
SET SalesTerritoryRegion = 'Northwest' WHERE FirstName = 'Rob';

SELECT * FROM vwEmployeeDetailsBySalesTerritoryRegion;