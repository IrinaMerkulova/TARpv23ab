-- Loome tabeli DimEmployee
Create table [DimEmployee] (
[Id] int Primary key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50))

-- Lisame andmed tabelisse DimEmployee
Insert into DimEmployee Values(3, 'John', 4500, 'Male', 'New York')
Insert into DimEmployee Values(1, 'Sam', 2500, 'Male', 'London')
Insert into DimEmployee Values(4, 'Sara', 5500, 'Female', 'Tokyo')
Insert into DimEmployee Values(5, 'Todd', 3100, 'Male', 'Toronto')
Insert into DimEmployee Values(2, 'Pam', 6500, 'Female', 'Sydney')

-- Kuvame kõik kirjed
Select * from DimEmployee

-- Loome mitteklasterdatud indeksi veerul Name
Create NonClustered Index IX_DimEmployee_Name
on DimEmployee(Name)

-- Kustutame indeksi (võib olla vale nimi)
Drop index DimEmployee.PK_DimEmplo_3214EC070A9D95DB

-- Loome klasterdatud indeksi veergudel Gender ja Salary
Create Clustered Index IX_DimEmployee_Gender_Salary
ON DimEmployee(Gender DESC, Salary ASC)
