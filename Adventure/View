--39. View SQL serveris--

Create table tblEmployee(
	Id int Primary key,
	Name nvarchar(30),
	Salary int,
	Gender nvarchar(10),
	Departamentid int
	);

Create table tblDepartment	
	(
	Deptid int primary key,
	DeptName nvarchar(20)
	);

insert into tblDepartment values(1, 'IT')
insert into tblDepartment values(2, 'Payroll')
insert into tblDepartment values(3, 'HR')
insert into tblDepartment values(4, 'Admin')

insert into tblEmployee values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee values(6, 'Ben', 4800, 'Male', 3)

Create View vWEemployeesByDepartment
as
Select id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.Departamentid=tblDepartment.Deptid

Select * from vWEemployeesByDepartment

Create View vWITDepartment_Employees
as 
Select id, Name, Salary, gender, DepthName 
from tblEmployee
join tblDepartment
on tblEmployee.Department = tblDepartment.Deptid
where tblDepartment.DeptName = 'IT'

Create View vWEemployeesNonConfidentalData
as 
Select id, Name, gender, DepthName 
from tblEmployee
join tblDepartment
on tblEmployee.Department = tblDepartment.Deptid

Create View vWEemployeesCountByDepartment
as
Select DeptName, count(id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.Departamentid=tblDepartment.Deptid
Group By DeptName

Select * from vWEemployeesCountByDepartment

--40. View uuendused--

Create table tblEmployee(
	Id int Primary key,
	Name nvarchar(30),
	Salary int,
	Gender nvarchar(10),
	Departamentid int
	);

insert into tblEmployee values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee values(6, 'Ben', 4800, 'Male', 3)

Create View vWEemployeesDataExceptSalary
as
Select id, Name, Gender, Departamentid
from tblEmployee

update vWEemployeesDataExceptSalary
set name = 'Mikey' where id = 2

Delete from vWEemployeesDataExceptSalary where id = 2 
insert into vWEemployeesDataExceptSalary values (2, 'Mikey', 'Male', 2);

Create table tblDepartment	
	(
	Deptid int primary key,
	DeptName nvarchar(20)
	);

insert into tblDepartment values(1, 'IT')
insert into tblDepartment values(2, 'Payroll')
insert into tblDepartment values(3, 'HR')
insert into tblDepartment values(4, 'Admin')

Create View vWEemployeesDetailsByDepartment
as
Select id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.Departamentid=tblDepartment.Deptid

Select * from vWEemployeesDetailsByDepartment

update vWEemployeesDetailsByDepartment
set DeptName='IT' where name = 'John'
