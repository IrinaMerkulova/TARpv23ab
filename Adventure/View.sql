-- 39. View SQL serveris
-- Loome tabelid
DROP TABLE tblEmployee
CREATE TABLE tblEmployee (
Id int Primary Key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int);

CREATE TABLE tblDepartment (
DeptId int Primary Key,
DeptName nvarchar(20));

Insert into tblDepartment values (1,'IT');
Insert into tblDepartment values (2, 'Payroll');
Insert into tblDepartment values (3,'HR');
Insert into tblDepartment values (4,'Admin');

Insert into tblEmployee values (1,'John', 5000, 'Male', 3);
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2);
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1);
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4);
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1);
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3);

-- Loome view
Create View vWemployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId;

-- Vaatame view
SELECT * FROM vWemployeesByDepartment;

-- Loome view'id
Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName = 'IT';

Create View vWEmployeesNonConfidentialData
as
Select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId;

Create View vWEmployeesCountByDepartment
as
Select DeptName, COUNT(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
Group By DeptName;

-- Vaatame view'id
SELECT * FROM vWITDepartment_Employees;
SELECT * FROM vWEmployeesNonConfidentialData;
SELECT * FROM vWEmployeesCountByDepartment;

-- 40. View uuendused
-- Loome tabel
DROP TABLE tblEmployee
CREATE TABLE tblEmployee (
Id int Primary Key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int);

Insert into tblEmployee values (1, 'John', 5000, 'Male', 3);
Insert into tblEmployee values (2, 'Mike', 3400, 'Male', 2);
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1);
Insert into tblEmployee values (4, 'Todd', 4800, 'Male', 4);
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1);
Insert into tblEmployee values (6, 'Ben', 4800, 'Male', 3);

-- Loome view
Create view vwEmployeesDataExceptSalary
as
Select Id, Name, Gender, DepartmentId
from tblEmployee

-- Vaatame view
Select * from vWEmployeesDataExceptSalary;

-- Muutume tabel view'iga
Update vwEmployeesDataExceptSalary
Set Name = 'Mikey' Where Id = 2;

-- Kustutame tabeli v‰‰rtus view'iga
Delete from VWEmployeesDataExceptSalary where Id = 2;
Insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2);

-- Loome tabel
CREATE TABLE tblDepartment (
DeptId int Primary Key,
DeptName nvarchar(20));

Insert into tblDepartment values (1,'IT');
Insert into tblDepartment values (2, 'Payroll');
Insert into tblDepartment values (3,'HR');
Insert into tblDepartment values (4,'Admin');

-- Loome view
Create view vwEmployeeDetailsByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

-- Vaatame view
SELECT * FROM vwEmployeeDetailsByDepartment;

-- Muutume tabel view'iga
Update vwEmployeeDetailsByDepartment
set DeptName='IT' where Name = 'John';