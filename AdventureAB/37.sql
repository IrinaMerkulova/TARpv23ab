-- Loome tabeli DimEmployee
Create table [DimEmployee] (
[Id] int Primary key,            -- Unikaalne ID
[Name] nvarchar(50),             -- Töötaja nimi
[Salary] int,                    -- Töötaja palk
[Gender] nvarchar(10),           -- Töötaja sugu
[City] nvarchar(50)              -- Linn
)

-- Kuvame indekseid tabelis tblEmployee
Execute sp_helpindex tblEmployee

-- Lisame andmed tabelisse tblEmployee (vea tõttu: vale nimi)
Insert into tblEmployee Values(1, 'Mike', 4500, 'Male', 'New York')
Insert into tblEmployee Values(1, 'John', 2500, 'Male', 'London')

-- Kustutame indeksi tabelist tblEmployee (vale nimi)
Drop index tblEmployee.PK_tblEmplo_3214ECO7236943A5

-- Lisame andmed tabelisse tblEmployee (vea tõttu: vale nimi)
Insert into tblEmployee Values(1,'Mike', 'Sandoz', 4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco', 2500,'Male','London')

-- Loome unikaalse mitteklasterdatud indeksi FirstName ja LastName veergudel
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

-- Lisame unikaalse piiri veergu City
ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

-- Loome unikaalse indeksi veerul City, ignoreerides duplikaate
CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY
