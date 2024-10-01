
-- 36 fail ( Klasteerid ) ----------------------------------------------------------------------------------------------------------------------------------------------

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


