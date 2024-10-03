-- 98 fail ( Where ja Having erinevused ) ----------------------------------------------------------------------- 

SELECT * FROM DimEmployee

-- Kui soovime ainult neid SickLeaveHours, kus adnmed kokku on suurem 4000, siis kasutame filtreerimaks tooteid HAVING tingimust
SELECT Gender, Sum(SickLeaveHours) AS TotalSickLeaveHours
FROM DimEmployee
GROUP BY Gender
HAVING SUM(SickLeaveHours) > 4000

-- Kui kasutame WHERE klasulit HAVING-u asemel, siis saame süntaksivea. Põhjuseks on WHERE-i mitte töötamine kokku arvutava funktsiooniga, mis sisaldab SUM, MIN, MAX, AVG jne.
SELECT Gender, Sum(SickLeaveHours) AS TotalSickLeaveHours
FROM DimEmployee
GROUP BY Gender
WHERE SUM(SickLeaveHours) > 4000

-- . See näide pärib kõik read Sales tabelis, mis näitavad summat ning eemaldavad kõik tooted peale iPhone-i ja Speakerite

SELECT Gender, SUM(SickLeaveHours) AS TotalSickLeaveHours
FROM DimEmployee
WHERE Gender in ('M')
GROUP BY Gender

-- Kalkuleeri M-i sICKleaveHours ja kasutad selleks HAVING klauslit. See näide pärib kõik read Sales tabelis, mis näitavad summat ning eemaldavad kõik tooted peale iPhone-i ja Speakerite.


SELECT Gender, SUM(SickLeaveHours) AS TotalSickLeaveHours
FROM DimEmployee
GROUP BY Gender
WHERE Gender in ('M')

