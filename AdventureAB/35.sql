-- Valime kõik kirjed tabelist DimEmployee, kus BaseRate on suurem kui 50 ja väiksem kui 70
Select * from DimEmployee where BaseRate > 50 and BaseRate < 70

-- Loome indeksi IX_DimEmployee_BaseRate veerul BaseRate kasvavas järjekorras
Create Index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)

-- Kuvame DimEmployee objekti tekstilise kirjelduse (struktuur, määrangud jne)
Execute sp_helptext DimEmployee

-- Kustutame indeksi IX_DimEmployee_BaseRate tabelist DimEmployee
Drop Index DimEmployee.IX_DimEmployee_BaseRate
