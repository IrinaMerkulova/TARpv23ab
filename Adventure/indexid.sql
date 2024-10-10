--35. Indeksid serveris--

Create table Employee
(
Id int primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
);

insert into Employee values (1, 'Sam', 2500, 'Male', 'New york');
insert into Employee values (2, 'Pohn', 6500, 'Female', 'Lonndon');
insert into Employee values (3, 'John', 4500, 'Male', 'Tokyo');
insert into Employee values (4, 'Sara', 5500, 'Female', 'Toronto');
insert into Employee values (5, 'Todd', 3100, 'Male', 'Tallinn');

Select * from tblEmployee where Salary > 5000 and Salary < 7000

Create Index IX_Employee_Salary
ON Employee(SALARY ASC)

--36. Klastreeritud ja mitte-klastreeritud indeksid--

Drop Index Employee.PK__Employee__3214EC07E9CDF3AD

Create Clustered Index IX_tblEmployee_Gender_Salary
ON Employee(Gender DESC, Salary ASC)

insert into Employee values (1, 'Sam', 2500, 'Male', 'New york');
insert into Employee values (2, 'Pohn', 6500, 'Female', 'Lonndon');
insert into Employee values (3, 'John', 4500, 'Male', 'Tokyo');
insert into Employee values (4, 'Sara', 5500, 'Female', 'Toronto');
insert into Employee values (5, 'Todd', 3100, 'Male', 'Tallinn');

Select * from tblEmployee

Create Clustered Index IX_tblEmployee_Name
ON Employee(Name)

Create NonClustered index IX_tblEmployee_Name
ON Employee(Name)

--37. Unikaalne ja mitte-unikaalne indeks--

create table tblEmployee(
id int Primary key,
FirstName nvarchar (50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50))

EXEC sp_helpIndex tblEmployee

insert into tblEmployee Values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee Values(1, 'John', 'Menco', 2500, 'Male', 'London')

Drop index tblEployee.PK_tblEmplo_3214ECO7236943A5

Insert into tblEmployee Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployee Values(1,'John', 'Menco',2500,'Male','London')

CREATE UNIQUE NONCLUSTERED INDEX UIX_DimEmployee_FirstName_LastName
ON DimEmployee (FirstName, LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

--38. Indeksi plussid ja miinused--

Create table tblEmployee(
	Id int Primary key,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Salary int,
	Gender nvarchar(10),
	City nvarchar(50)
	);

insert into tblEmployee values(1, 'Mike', 'Sandoz', 4500, 'Male', 'New York')
insert into tblEmployee values(2, 'Sara', 'Menco', 6500, 'Female', 'London')
insert into tblEmployee values(3, 'John', 'Barber', 2500, 'Male', 'Sydney')
insert into tblEmployee values(4, 'Pam', 'Grove', 3500, 'Female', 'Toronto')
insert into tblEmployee values(5, 'James', 'Mirch', 7500, 'Male', 'London')
Loo mitte-klastreeritud indeks Salary veerule:

CREATE NONCLUSTERED INDEX IX_tblEmployee_Salary
ON tblEmployee (Salary ASC)

SELECT * FROM tblEmployee WHERE Salary > 4000 AND Salary < 8000

DELETE FROM tblEmployee WHERE Salary = 2500

UPDATE tblEmployee SET Salary = 9000 WHERE Salary = 7500

SELECT * FROM tblEmployee ORDER BY Salary

SELECT * FROM tblEmployee ORDER BY Salary Desc

SELECT Salary, COUNT(Salary) AS Total
FROM tblEmployee
GROUP BY Salary
