-- 32. funktsioonid
-- Loome funktsioonid

Create Function fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB
From dbo.DimEmployee);

Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (Id int, Name nvarchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date)
From dbo.DimEmployee
Return
End;

-- Vaatame funktsioonid
Select * from fn_ILTVF_GetEmployees();
Select * from fn_MSTVF_GetEmployees();

-- Testime funktsioonid
Update fn_ILTVF_GetEmployees() set FirstName='Sam1' Where EmployeeKey = 1;
Select * from fn_ILTVF_GetEmployees();

-- 33. funktsioonid
-- Loome tabelid funktsioonidele
CREATE TABLE dbo.tblEmployees (
Id int Primary Key,
Name nvarchar(50) NULL,
DateOfBirth datetime NULL,
Gender nvarchar(10) NULL,
DepartmentId int NULL);

Insert into dbo.tblEmployees values (1, 'Sam', '1980-12-30 00:00:00.000', 'Male',1);
Insert into dbo.tblEmployees values (2, 'Pam', '1982-09-01 12:02:36.260', 'Female',2);
Insert into dbo.tblEmployees values (3,'John', '1985-08-22 12:03:30.370','Male',1);
Insert into dbo.tblEmployees values (4,'Sara', '1979-11-29 12:59:30.670', 'Female',3);
Insert into dbo.tblEmployees values (5, 'Todd', '1978-11-29 12:59:30.670', 'Male',1);

-- Loome funktsioonid
Create Function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;

-- Muutume funktsioonid
Alter Function fn_GetEmployeeNameById(@Id int)
Returns nvarchar(20)
With Encryption
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;

-- Muutume tabel
DROP TABLE tblEmployees;

CREATE TABLE dbo.tblEmployees (
Id int Primary Key,
Name nvarchar(50) NULL,
DateOfBirth datetime NULL,
Gender nvarchar(10) NULL,
DepartmentId int NULL);

Insert into dbo.tblEmployees values(1,'Sam','1980-12-30 00:00:00.000','Male',1);
Insert into dbo.tblEmployees values(2,'Pam','1982-09-01 12:02:36.260','Female',2);
Insert into dbo.tblEmployees values(3,'John','1985-08-22 12:03:30.370','Male',1);
Insert into dbo.tblEmployees values(4,'Sara','1979-11-29 12:59:30.670','Female',3);
Insert into dbo.tblEmployees values(5,'Todd','1978-11-29 12:59:30.670','Male',1);

-- Muutume funktsioonid
Alter Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
With SchemaBinding
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;