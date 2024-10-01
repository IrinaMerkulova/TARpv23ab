-- 35 fail ( Indeksid ) --------------------------------------------------------------------------------------------------------------------------------------------

-- leiame töötajad, kes oli jäänud haigeks suurem kui 30 t. ja väiksem kui 60 t.
SELECT * FROM DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60

-- Nüüd loome indeksi, mis aitab päringut: Loome indeksi SickLeaveHours veerule
CREATE INDEX IX_tblEmployee_Salary
ON DimEmployee(SickLeaveHours ASC)

-- Kui soovid vaadata Indeksit: Object Exploreris laienda Indexes kausta. 
-- Alternatiiviks kasuta sp_helptext-i süsteemi SP-de jaoks.
-- Järgnev päring tagastab kõik indeksid tblEmployee tabelis.
Execute sp_helptext DimEmployee

-- Kui soovid kustutada indeksit: Kui kustutad indeksi, siis täpsusta tabeli nimi.
Drop index DimEmployee.IX_tblEmployee_Salary
