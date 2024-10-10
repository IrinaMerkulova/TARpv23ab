--98 Where ja Having erinevused.rtf 

--Loome tabeli Sales ja sisestame andmed
CREATE TABLE Sales (
    Product NVARCHAR(50),
    SaleAmount INT
);
GO 

INSERT INTO Sales (Product, SaleAmount)
VALUES 
    ('iPhone', 500),
    ('Laptop', 800),
    ('iPhone', 1000),
    ('Speakers', 400),
    ('Laptop', 600);
GO

select * from Sales
--Selleks, et arvutada kogu müüki toote pealt, siis peame kirjutama GROUP BY päringu:
SELECT Product, SUM(SaleAmount) as TotalSales
FROM Sales
GROUP BY Product

--Kui soovime ainult neid tooteid, kus müük kokku on suurem kui 1000€, siis kasutame filtreerimaks tooteid HAVING tingimust.
SELECT Product, SUM(SaleAmount) as TotalSales
FROM Sales
GROUP BY Product
HAVING SUM(SaleAmount) > 1000

--Kui kasutame WHERE klasulit HAVING-u asemel, siis saame süntaksivea. Põhjuseks on WHERE-i mitte töötamine kokku arvutava funktsiooniga, mis sisaldab SUM, MIN, MAX, AVG jne.
SELECT Product, SUM(SaleAmount) as TotalSales
FROM Sales
GROUP BY Product
WHERE SUM(SaleAmount) > 1000

--Kalkuleeri iPhone-i ja Speakerite müüki ja kasuta selleks HAVING klauslit. See näide pärib kõik read Sales tabelis, mis näitavad summat ning eemaldavad kõik tooted peale iPhone-i ja Speakerite.
SELECT Product, SUM(SaleAmount) as TotalSales
FROM Sales
WHERE Product in ('iPhone','Speakers')
GROUP BY Product

--Kalkuleeri iPhone-i ja Speakerite müüki ja kasutad selleks HAVING klauslit. See näide pärib kõik read Sales tabelis, mis näitavad summat ning eemaldavad kõik tooted peale iPhone-i ja Speakerite
SELECT Product, SUM(SaleAmount) as TotalSales
FROM Sales
GROUP BY Product
HAVING Product in ('iPhone','Speakers')
