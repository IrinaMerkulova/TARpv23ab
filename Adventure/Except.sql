-- 87 fail ( Except operaator ) ---------------------------------------------------------------------------------------------------------------------------------

-- Loome kahte tabelit
CREATE TABLE TableA
(
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
Go

INSERT INTO TableA VALUES (1, 'Mark', 'Male'), (2, 'Mary', 'Female'), (3, 'Steve', 'Male'), (4, 'John', 'Male'), (5, 'Sara', 'Female')
GO

CREATE TABLE TableB (
Id int primary key,
Name nvarchar(50),
Gender nvarchar(10)
)
GO

INSERT INTO TableB VALUES (4, 'John', 'Male'), (5, 'Sara', 'Female'), (6, 'Pam', 'Female'), (7, 'Rebeka', 'Female'), (8, 'Jordan', 'Male')
GO

-- Pane tähele, et järgnev rida tagastab unikaalse ridade arvu vasakust tabelist, mida ei ole paremas tabelis.
SELECT Id, Name, Gender
FROM TableA
EXCEPT
Select Id,Name,Gender
FROM TableB

-- Except operaatorit saab kasutada ka ühe tabeli peal. Loome ja kasutame tblEmployee tabelit

Create table tblEmployees

(
Id int identity primary key,
Name nvarchar(100),
Gender nvarchar(10),
Salary int

)

Go

Insert into tblEmployees values ('Mark', 'Male', 52000)
Insert into tblEmployees values ('Mary', 'Female', 55000)
Insert into tblEmployees values ('Steve', 'Male', 45000)
Insert into tblEmployees values ('John', 'Male', 40000)
Insert into tblEmployees values ('Sara', 'Female', 48000)
Insert into tblEmployees values ('Pam', 'Female', 60000)
Insert into tblEmployees values ('Tom', 'Male', 58000)
Insert into tblEmployees values ('Georg', 'Male', 65000)
Insert into tblEmployees values ('Tina', 'Female', 67000)
Insert into tblEmployees values ('Ben', 'Male', 80000)

Go

SELECT Id, Name, Gender, Salary
FROM tblEmployees 
WHERE Salary >= 50000
Except 
SELECT Id, Name, Gender, Salary
FROM tblEmployees
WHERE Salary >= 60000
order by Name

-- 88 fail (Erinevus Except) --------------------------------------------------------------
-- Järgnev päring tagastab read vasakust päringust, mis ei ole paremas tabelis 
Select Id, Name, Gender FROM TableA
Except 
Select Id, Name, Gender From TableB

-- Sama tulemuse võib saavutada NOT IN operaatoriga
SELECT Id, Name, Gender FROM TableA
WHERE Id NOT IN (Select Id From TableB)

-- Sisesta järgnev rida tabelisse TableA
Insert Into TableA values (1, 'Mark', 'Male')

-- Nüüd käivita järgnev EXCEPT päring

SELECT Id, Name, Gender FROM TableA
EXCEPT 
SELECT Id,Name,Gender From TableB

-- Nüüd käivita NOT IN operaatoriga kood
Select Id, Name, Gender From TableA
Where Id NOT IN (Select Id from TableB)

-- Järgnevas päringus on meelega veergude arv erinev
SELECT Id, Name, Gender From TableA
EXCEPT
Select Id, Name from TableB

-- Järgnevas päringus alampäring tagastab mitu veergu
Select Id, Name ,Gender From TableA
Where Id NOT IN (Select Id, Name from TableB)





