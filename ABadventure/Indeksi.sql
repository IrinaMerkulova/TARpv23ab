-- 35 fail
SELECT * FROM DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60

CREATE INDEX IX_tblEmployee_Salary
ON DimEmployee(SickLeaveHours ASC)


Execute sp_helptext DimEmployee

Drop index DimEmployee.IX_tblEmployee_Salary

  
-- 36 fail


CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)


INSERT INTO tblEmployee VALUES(3, 'John', 4500, 'Male', 'New York'),
(1, 'Sam', 2500, 'Male', 'London'),
(4, 'Sara', 5500, 'Female', 'Tokyo'),
(5, 'Todd', 3100, 'Male', 'Toronto'),
(2, 'Pam', 6500, 'Female', 'Sydney')

Select * from tblEmployee

DROP INDEX PK__tblEmplo__3214EC0706CD04F7

CREATE CLUSTERED INDEX IX_tblEmployee_Name ON tblEmployee(Name)

DROP INDEX tblEmployee.IX_tblEmployee_Name


CREATE CLUSTERED INDEX IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

Select * from tblEmployee


CREATE NONCLUSTERED INDEX IX_tblEmployee_Name 
ON tblEmployee(Name)





-- 37 fail 


CREATE TABLE [tblEmployee](
[Id] int Primary Key,
[Name] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50)
)


Execute sp_helpindex tblEmployee

 
INSERT INTO tblEmployee VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York'), (1, 'John', 'Menco', 2500, 'Male', 'Londod')

e
DROP INDEX tblEmployee.PK__tblEmplo__3214EC07236943A5


INSERT INTO tblEmployee VALUES (1, 'Mike', 'Sandoz', 4500, 'Male', 'New York'), (1, 'John', 'Menco', 2500, 'Male', 'Londod')


Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)


ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)


EXECUTE SP_HELPCONSTRAINT tblEmployee


CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY




-- 38 fail 

CREATE NonClustered Index IX_DimEmployee_SickLeaveHours
On DimEmployee ( SickLeaveHours Asc );

Select * from DimEmployee WHERE SickLeaveHours > 30 and SickLeaveHours < 60;

 
DELETE FROM DimEmployee where SickLeaveHours = 31;
UPDATE DimEmployee Set SickLeaveHours = 20 where SickLeaveHours = 40


SELECT * FROM DimEmployee order by SickLeaveHours


SELECT * FROM DimEmployee order by SickLeaveHours DESC

SELECT SickLeaveHours, Count(SickLeaveHours) as Total from DimEmployee GROUP BY SickLeaveHours
