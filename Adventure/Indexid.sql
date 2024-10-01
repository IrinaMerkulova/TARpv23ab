--Indexid.sql
--Soovime leida kõik töölised, kelle palk on vahemikus 5000 kuni 7000
Create index IX_DimEmployee_Salary
on DimEmployee (BaseRate ASC)

Select * from DimEmployee where BaseRate > 5000 and BaseRate < 7000

--Kui soovid vaadata Indeksit
EXEC sp_help 'DimEmployee'; 

--Kui soovid kustutada indeksit
drop Index DimEmployee.IX_tblEmployee_Salary

