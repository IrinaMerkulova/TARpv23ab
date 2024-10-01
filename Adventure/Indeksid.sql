-- 35 fail ( Indeksid ) --------------------------------------------------------------------------------------------------------------------------------------------

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


-- 37 fail ( Unikaalne ja mitte unikaalne index ) -------------------------------------------------------------------------------------------------------------------------------

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




-- 38 fail ( Indeksi plussid ja miinused ) -------------------------------------------------------------------------------------------------------------------

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
