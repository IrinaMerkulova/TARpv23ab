--Indexid.sql
--Soovime leida kõik töölised, kelle palk on vahemikus 5000 kuni 7000
Create index IX_DimEmployee_Salary
on DimEmployee (BaseRate ASC)

Select * from DimEmployee where BaseRate > 5000 and BaseRate < 7000

--Kui soovid vaadata Indeksit
EXEC sp_help 'DimEmployee'; 

--Kui soovid kustutada indeksit
drop Index DimEmployee.IX_tblEmployee_Salary

--36. Klastreeritud ja mitte-klastreeritud indeksid

--mis näitab uniklaaset klastreeritud indeksi loomist Id veerus.
execute sp_helpindex DimEmployee

--Vaatame DimEmployee
Select * from DimEmployee

--Selle tulemusel SQL server ei luba luua rohkem, kui ühte klastreeritud indeksit tabeli kohta. Järgnev skript annab veateate
Create Clustered Index IX_DimEmpoyee_Name
on DimEmployee(FirstName)

--Nüüd loome klastreeritud indeksi kahe veeruga. Selleks peame enne kustutama praeguse klastreeritud indeksi Id veerus:
Drop index DimEmployee

--Nüüd käivita järgnev kood uue klastreeritud ühendindeksi loomiseks Gender ja Salary veeru põhjal
CREATE CLUSTERED INDEX IX_DimEmployee_Gender_Salary
ON DimEmployee(Gender DESC, BaseRate ASC);

--Järgnev kood loob SQL-s mitte-klastreeritud indeksi Name veeru järgi DimEmployee tabelis
Create NonClustered Index IX_DimEmployee_Name
On DimEmployee (FirstName)
