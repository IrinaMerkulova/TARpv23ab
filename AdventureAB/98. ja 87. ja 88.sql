-- Loome tabeli TableA
-- 87
Create Table TableA 
(
id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
Go

-- Lisame andmed tabelisse TableA
Insert into TableA values(1,'Mark', 'Male')
Insert into TableA values(2,'Mary', 'Female')
Insert into TableA values(3,'Steve', 'Male')
Insert into TableA values(4,'John', 'Male')
Insert into TableA values(5,'Sara', 'Female')

-- Loome tabeli TableB
Create Table TableB
(
id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
Go

-- Lisame andmed tabelisse TableB
Insert into TableB values(4,'John', 'Male')
Insert into TableB values(5,'Sara', 'Female')
Insert into TableB values(6,'Pam', 'Female')
Insert into TableB values(7,'Rebeka', 'Female')
Insert into TableB values(8,'Jordan', 'Male')
Go

-- Valime kõik kirjed, mis on tabelis TableA, kuid mitte tabelis TableB
Select Id, Name, Gender
From TableA
Except
Select Id, Name, Gender
from TableB

-- Loome töötajate tabeli tblEmployees
Create Table tblEmployees 
(
id int identity primary key,
Name nvarchar(50),
Gender nvarchar(10),
Salary int
)
Go

-- Lisame andmed töötajate tabelisse tblEmployees
Insert into tblEmployees values('Mark', 'Male', 52000)
Insert into tblEmployees values('Mary', 'Female', 55000)
Insert into tblEmployees values('Steve', 'Male', 45000)
Insert into tblEmployees values('John', 'Male', 40000)
Insert into tblEmployees values('Sara', 'Female', 48000)
Insert into tblEmployees values('Pam', 'Female', 60000)
Insert into tblEmployees values('Tom', 'Male', 58000)
Insert into tblEmployees values('George', 'Male', 65000)
Insert into tblEmployees values('Tina', 'Female', 67000)
Insert into tblEmployees values('Ben', 'Male', 80000)
Go

-- Valime töötajad, kelle palk on suurem või võrdne 50000, kuid väiksem kui 60000
Select Id, Name, Gender, Salary
From tblEmployees
Where Salary >= 50000
Except
Select Id, Name, Gender, Salary
from tblEmployees
Where Salary >= 60000
order By Name

-- 88

-- Valime kirjed, mis on tabelis TableA, kuid mitte tabelis TableB (erinevad võimalused)
Select id, Name, Gender From TableA
Except
Select id, Name, Gender From TableB

Select id, Name, Gender from TableA
Where id Not IN (Select id from TableB)

Select id, Name, Gender from TableA
Except 
Select id, Name, Gender from Table

Select id, Name, Gender from TableA
Where id not in (Select id from TableB)

Select id, Name, Gender from TableA
Except
Select id, Name from TableB

Select id, Name, Gender from TableA
Where id not in (select id, Name from TableB)

-- 98

-- Loome müügitabeli Sales
Create table Sales
(
Product nvarchar(50),
SaleAmount int
)
Go

-- Lisame andmed müügitabelisse
insert into Sales values('iPhone',500)
insert into Sales values('Laptop',800)
insert into Sales values('iPhone',1000)
insert into Sales values('Speaker',400)
insert into Sales values('Laptop',600)
Go

-- Summeerime müügi toote järgi
Select Product, Sum(SaleAmount) AS TotalSales
From Sales
Group By Product

-- Valime tooted, mille müük on suurem kui 1000
Select Product, Sum(SaleAmount) AS TotalSales
From Sales
Group by Product 
Having Sum(SaleAmount) > 1000

-- Vale päring, kus WHERE asub enne GROUP BY
Select Product, Sum(SaleAmount) AS TotalSales
From Sales
Group by Product 
Where Sum(SaleAmount) > 1000

-- Valime teatud tooted ja summeerime nende müügi
Select Product, Sum(SaleAmount) AS TotalSales
From Sales
Where Product in ('iPhone', 'Speakers')
Group by Product

-- Vale päring, kus WHERE asub peale GROUP BY
Select Product, Sum(SaleAmount) AS TotalSales
From Sales
Group by Product
Where Product in ('iPhone', 'Speakers')
