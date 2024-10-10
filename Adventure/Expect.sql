-- 87
Create Table TableA
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'John', 'Male')
Insert into TableA values (5, 'Sara', 'Female')
Go

Create Table TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableB values (4, 'John', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')
Go
select * from TableA
select * from TableB

SELECT Id, Name, Gender
FROM TableA
EXCEPT
Select Id,Name,Gender
FROM TableB

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
select * from tblEmployees

SELECT Id, Name, Gender, Salary
FROM tblEmployees 
WHERE Salary >= 50000
Except 
SELECT Id, Name, Gender, Salary
FROM tblEmployees
WHERE Salary >= 60000
order by Name
--88
Create Table TableA
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Go

Create Table TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableB values (2, 'Mary', 'Female')
Insert into TableB values (3, 'Steve', 'Male')
Go

Select Id, Name, Gender FROM TableA
Except 
Select Id, Name, Gender From TableB

SELECT Id, Name, Gender FROM TableA
WHERE Id NOT IN (Select Id From TableB)


select * from TableA
select * from TableB

SELECT Id, Name, Gender FROM TableA
EXCEPT 
SELECT Id,Name,Gender From TableB

Select Id, Name, Gender From TableA
Where Id NOT IN (Select Id from TableB)
