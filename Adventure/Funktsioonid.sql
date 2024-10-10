--32. Mitme avaldisega tabeliväärtusega funktsioonid--
CREATE TABLE Employees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50),
    DateOfBirth DATETIME,
    Gender NVARCHAR(10),
    DepartmentId INT
);

INSERT INTO Employees (Name, DateOfBirth, Gender, DepartmentId)
VALUES
('Sam', '1980-12-30 00:00:00.000', 'Male', 1),
('Pam', '1982-09-01 12:02:36.260', 'Female', 2),
('John', '1985-08-22 12:03:30.370', 'Male', 1),
('Sara', '1979-11-29 12:59:30.670', 'Female', 3),
('Todd', '1978-11-29 12:59:30.670', 'Male', 1);

CREATE FUNCTION GetEmployees()
RETURNS TABLE
AS
RETURN (
    SELECT Id, Name, DateOfBirth AS DOB
    FROM Employees
);

SELECT * FROM GetEmployees();

Create Function fn_ILTVF_GetEmployees()
Return Table 
as
Return (Select id, Name, Cast(DateOfBirth as date) as  DOB From tblEmployees)

Create Function fn_MSTVF_GetEmployees()

Returns @Table Table (Id int, Name nvarchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as Date)
From dbo.DimEmployee
Return
End;

SELECT * FROM fn_MSTVF_GetEmployees();

Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

Update GetEmployees() set Name='Sam1' Where id = 1;
Select * from GetEmployees();

--33. Funktsiooniga seotud tähtsad kontseptsioonid--

Create Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;

sp_helptext fn_GetEmployeeNameById

Alter Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
With Encryption
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;

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

Alter Function fn_GetEmployeeNameById(@Id int)

Returns nvarchar(20)
With SchemaBinding
as
Begin
Return (Select Name from dbo.tblEmployees Where Id = @Id)
End;

DROP TABLE dbo.tblEmployees;

--34. Ajutised tabelid--

Create Table #PersonDetails(Id int, Name nvarchar(20));

Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

Select * from #PersonDetails

Select name from tempdb..sysobjects
where name like '#PersonalDetails%'

Create Procedure spCreateLocalTempTable

as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))

Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

Select * from #PersonDetails
End

Create Table ##EmployeeDetails(Id int, Name nvarchar(20))





