CREATE TABLE TableA
(
Id INT PRIMARY KEY,
Name NVARCHAR(50),
Gender NVARCHAR(10)
);
GO

INSERT INTO TableA VALUES 
(1, 'Alice', 'Female'), 
(2, 'Bob', 'Male'), 
(3, 'Charlie', 'Male'), 
(4, 'Diana', 'Female'), 
(5, 'Eve', 'Female');
GO

CREATE TABLE TableB
(
Id INT PRIMARY KEY,
Name NVARCHAR(50),
Gender NVARCHAR(10)
);
GO

INSERT INTO TableB VALUES 
(4, 'Diana', 'Female'), 
(5, 'Eve', 'Female'), 
(6, 'Frank', 'Male'), 
(7, 'Grace', 'Female'), 
(8, 'Hank', 'Male');
GO

SELECT Id, Name, Gender
FROM TableA
EXCEPT
SELECT Id, Name, Gender
FROM TableB;

CREATE TABLE tblEmployees
(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR(100),
Gender NVARCHAR(10),
Salary INT
);
GO

INSERT INTO tblEmployees VALUES 
('Alice', 'Female', 70000), 
('Bob', 'Male', 54000), 
('Charlie', 'Male', 46000), 
('Diana', 'Female', 48000), 
('Eve', 'Female', 51000), 
('Frank', 'Male', 62000), 
('Grace', 'Female', 68000), 
('Hank', 'Male', 75000), 
('Ivy', 'Female', 80000), 
('Jack', 'Male', 85000);
GO

SELECT Id, Name, Gender, Salary
FROM tblEmployees 
WHERE Salary >= 50000
EXCEPT 
SELECT Id, Name, Gender, Salary
FROM tblEmployees
WHERE Salary >= 60000
ORDER BY Name;

SELECT Id, Name, Gender
FROM TableA
EXCEPT 
SELECT Id, Name, Gender
FROM TableB;

SELECT Id, Name, Gender
FROM TableA
WHERE Id NOT IN (SELECT Id FROM TableB);

INSERT INTO TableA VALUES (1, 'Alice', 'Female');

SELECT Id, Name, Gender
FROM TableA
EXCEPT 
SELECT Id, Name, Gender
FROM TableB;

SELECT Id, Name, Gender
FROM TableA
WHERE Id NOT IN (SELECT Id FROM TableB);

SELECT Id, Name, Gender
FROM TableA
EXCEPT
SELECT Id, Name
FROM TableB;

SELECT Id, Name, Gender
FROM TableA
WHERE Id NOT IN (SELECT Id, Name FROM TableB);

