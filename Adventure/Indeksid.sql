-- 35. indeksidServeris
-- Vaatame tabel
Select * from dbo.DimEmployee where BaseRate > 50 and BaseRate < 70;

-- Loome indeks
CREATE Index IX_tblEmployee_Salary
ON dbo.DimEmployee (BaseRate ASC);

-- Vaatame tabel indeksiga
Select * from dbo.DimEmployee where BaseRate > 50 and BaseRate < 70;

-- Kustutame indeks
Drop Index DimEmployee.IX_tblEmployee_Salary;

-- 36. Klastreeritud ja mitte-klastreeritud indeksid
-- Loome tabel indeksidele
DROP TABLE tblEmployee;
CREATE TABLE tblEmployee (
Id int Primary Key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50));

Insert into tblEmployee Values(3, 'John',4500, 'Male', 'New York');
Insert into tblEmployee Values(1, 'Sam',2500, 'Male', 'London');
Insert into tblEmployee Values(4, 'Sara',5500, 'Female', 'Tokyo');
Insert into tblEmployee Values(5, 'Todd',3100, 'Male', 'Toronto');
Insert into tblEmployee Values (2, 'Pam',6500, 'Female', 'Sydney');

-- Loome indeksid
--DROP INDEX tblEmployee.PK__tblEmplo__3214EC0760621DBE;
--Create Clustered Index IX_tblEmployee_Gender_Salary
--ON tblEmployee(Gender DESC, Salary ASC);

Create NonClustered Index IX_tblEmployee_Name
ON tblEmployee(FirstName);

-- Vaatame tabel
Select * from tblEmployee;

-- 37. Unikaalne ja mitte-unikaalne Index
-- Loome tabel
DROP TABLE tblEmployee;
CREATE TABLE tblEmployee (
Id int Primary Key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50));

DROP INDEX tblEmployee.PK__tblEmplo__3214EC07308AD74C;

Insert into tblEmployee Values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York');
Insert into tblEmployee Values(1, 'John', 'Menco',2500, 'Male', 'London');

-- Loome indeks
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName);

-- Muutume tabel
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

-- Loome indeks
CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

-- 38. Indeksi plussid ja miinused
-- Loome tabel
DROP TABLE tblEmployee;
CREATE TABLE tblEmployee (
Id int Primary Key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

Insert into tblEmployee Values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York');
Insert into tblEmployee Values (2, 'Sara', 'Menco', 6500, 'Female', 'London');
Insert into tblEmployee Values(3, 'John', 'Barber', 2500, 'Male', 'Sydney');
Insert into tblEmployee Values (4,'Pam', 'Grove',3500, 'Female', 'Toronto');
Insert into tblEmployee Values(5, 'James', 'Mirch',7500, 'Male', 'London');

-- Loome indeks
Create NonClustered Index IX_tblEmployee_Salary
On tblEmployee (Salary Asc);

-- Vaatame tabel
SELECT * FROM tblEmployee WHERE Salary > 4000 and Salary < 8000;

-- Muutume tabel
Delete from tblEmployee where Salary = 2500;
Update tblEmployee Set Salary = 9000 where Salary = 7500;

-- Vaatame tabel
Select Salary, COUNT(Salary) as Total
from tblEmployee
Group By Salary;