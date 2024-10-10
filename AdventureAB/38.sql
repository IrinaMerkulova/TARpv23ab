-- Loome tabeli DimEmploye
Create table DimEmploye (
[Id] int Primary key,            -- Unikaalne ID
[Name] nvarchar(50),             -- Töötaja nimi
[Salary] int,                    -- Töötaja palk
[Gender] nvarchar(10),           -- Töötaja sugu
[City] nvarchar(50)              -- Linn
)

-- Lisame andmed tabelisse DimEmploye
Insert into DimEmploye Values(1,'Mike','Snadoz',4500,'Male','New York')
Insert into DimEmploye Values(2,'Sara','Menco',6500,'Male','New York')
Insert into DimEmploye Values(3,'John','Barber',2500,'Male','New York')
Insert into DimEmploye Values(4,'Pam','Grove',3500,'Male','New York')
Insert into DimEmploye Values(5,'James','Mirch',7500,'Male','New York')

-- Loome mitteklasterdatud indeksi Salary veerul
Create NonClustered Index IX_Dimploye_Salary
on DimEmploye (Salary Asc)

-- Valime kirjed, kus palk on suurem kui 4000 ja väiksem kui 8000
Select * from DimEmploye where Salary > 4000 and Salary < 8000

-- Kustutame kirje, kus palk on 2500
Delete from DimEmploye where Salary = 2500

-- Uuendame palk 9000-ks, kui praegune palk on 7500
Update DimEmploye Set Salary = 9000 where Salary = 7500

-- Valime kõik kirjed tabelist DimEmployee ja järjestame BaseRate järgi (BaseRate'i veerg ei eksisteeri)
SELECT * FROM DimEmployee ORDER BY BaseRate

-- Valime kõik kirjed tabelist DimEmploye ja järjestame palga järgi kahanevas järjekorras
Select * from DimEmploye order by Salary Desc

-- Gruppime andmed palga järgi ja loendame, mitu korda iga palk esineb
Select Salary, COUNT(Salary) as Total 
from DimEmploye 
Group By Salary
