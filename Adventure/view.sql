-- 39 
CREATE TABLE tblEmployee(
Id int Primary Key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int,
)

Create table tblDepartment(
DeptID int Primary  Key,
DeptName nvarchar(20))

Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

Insert into tblEmployee values (1,'John',5000,'Male',3)
Insert into tblEmployee values (2,'Mike',3400,'Male',2)
Insert into tblEmployee values (3,'Pam',6000,'Female',1)
Insert into tblEmployee values (4,'Todd',4800,'Male',4)
Insert into tblEmployee values (5,'Sara',3200,'Female',1)
Insert into tblEmployee values (6,'Ben',4800,'Male',3)
select * from tblDepartment;
select * from tblEmployee;

Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

Create View vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptID
Select * from vWEmployeesByDepSrtment

Create View vWITDepartment_Employees
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptID
where tblDepartment.DeptName = 'IT'
Select * from vWITDepartment_Employees

Create View vWEmployeesNonConfidentialData
as
Select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptID

Create View vWEmployyesCountByDepartment
as
Select DeptName, Count(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptID
Group by DeptName

Select * from vWITDepartment_Employees
Select * from vWEmployeesNonConfidentialData
Select * fro
