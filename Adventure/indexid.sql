-- indeksid 35

SELECT * FROM DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60

CREATE INDEX IX_tblEmployee_Salary
ON DimEmployee(SickLeaveHours ASC)

Execute sp_helptext DimEmployee

Drop index DimEmployee.IX_tblEmployee_Salary
  
-- 36
  
CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)
INSERT INTO tblEmployee
VALUES(3, 'John', 4500, 'Male', 'New York'),
(1, 'Sam', 2500, 'Male', 'London'),
(4, 'Sara', 5500, 'Female', 'Tokyo'),
(5, 'Todd', 3100, 'Male', 'Toronto'),
(2, 'Pam', 6500, 'Female', 'Sydney')
Select * from tblEmployee

DROP INDEX tblEmployee.IX_tblEmployee_Name

CREATE CLUSTERED INDEX IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)
Select * from tblEmployee

CREATE NONCLUSTERED INDEX IX_tblEmployee_Name 
ON tblEmployee(Name)
  
-- 37
  
INSERT INTO tblEmployee
VALUES 
(1, 'John',  2500, 'Male', 'London');

Drop index tblEmployee.PK_tblEmplo_3214ECO7236943A5
Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)
EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

-- 38
  
create NonClustered Index IX_tblEmployee_Salary
On tblEmployee(Salary Asc)

CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[FirstName] nvarchar(50),
[LastName] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)
Insert into tblEmployee Values(1,'Mike','Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(2,'Sara','Menco',6500,'Female','London')
Insert into tblEmployee Values(3,'John','Barber',2500,'Male','Sydney')
Insert into tblEmployee Values(4,'Pam','Grove',3500,'Female','Toronto')
Insert into tblEmployee Values(5,'James','Mirch',7500,'Male','London')
Select * from tblEmployee

Select * from tblEmployee where Salary > 4000 and Salary < 8000;

Delete from tblEmployee where Salary = 2500
Update tblEmployee Set Salary = 9000 where Salary = 7500

Select* from tblEmployee order by Salary
Select* from tblEmployee order by Salary Desc

Select Salary, Count(Salary) as Total 
from tblEmployee 
Group By Salary
