-- 40. View uuendused.rtf
-- Loome vaate vWEmployeesData
CREATE VIEW vWEmployeesData 
AS 
SELECT EmployeeKey, FirstName, SickLeaveHours
FROM DimEmployee;

-- Kuvame kõik read vaates vWEmployeesData
SELECT * FROM vWEmployeesData;

-- Uuendame töötaja eesnime, kus EmployeeKey on 2
UPDATE vWEmployeesData
SET FirstName = 'Mikey'
WHERE EmployeeKey = 2;

-- Kustutame rea vaates vWEmployeesData, kus EmployeeKey on 2
DELETE FROM vWEmployeesData WHERE EmployeeKey = 2;

-- Lisame töötaja DimEmployee tabelisse
INSERT INTO DimEmployee(EmployeeKey, FirstName) VALUES (2, 'Mikey');

-- Loome vaate vwEmployeeDetailsByDepartment
CREATE VIEW vwEmployeeDetailsByDepartment
AS
SELECT E.EmployeeKey, E.FirstName, E.SickLeaveHours, ST.SalesTerritoryRegion
FROM DimEmployee E
JOIN DimSalesTerritory ST
ON E.SalesTerritoryKey = ST.SalesTerritoryKey;

-- Kuvame kõik read vaates vwEmployeeDetailsByDepartment
SELECT * FROM vwEmployeeDetailsByDepartment;

-- Uuendame müügiterritooriumi regiooni vaates vwEmployeeDetailsBySalesTerritoryRegion, kus eesnimi on 'John'
UPDATE vwEmployeeDetailsBySalesTerritoryRegion
SET SalesTerritoryRegion = 'IT' WHERE FirstName = 'John';

-- Kuvame kõik read vaates vwEmployeeDetailsBySalesTerritoryRegion
SELECT * FROM vwEmployeeDetailsBySalesTerritoryRegion;