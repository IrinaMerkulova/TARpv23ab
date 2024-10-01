-- 39 fail ( SQL serveris VIEWS ) ---------------------------------------------------------------------------------------------------------------------

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

-- 40 fail ( View uuendused ) --------------------------------------------------------------------------------------------------------

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