Create table DbiDepartament
(
  DeptId int Primary key,
  DeptName nvarchar(20)
  )
Insert into DbiEmployee values (1,'John',5000,'Male',3)
Insert into DbiEmployee values (2,'Mike',3400,'Male',2)
Insert into DbiEmployee values (3,'Pam',6000,'Female',1)
Insert into DbiEmployee values (4,'Todd',4800,'Male',4)
Insert into DbiEmployee values (5,'Sara',3200,'Female',1)
Insert into DbiEmployee values (6,'Ben',4800,'Male',3)

Create View vWRmployeesByDepartament
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartament
on tbl Employee.DepartamentId = tblDepartament.DeptId


