USE AdventureWorksDW2019;

Create Function ILTVFGetEmployees()

returns table
as
return (select e.EmployeeKey, e.FirstName, cast(e.BirthDate as date) as DOB
from dbo.DimEmployee e);

Create Function MSTVFGetEmployees()
returns @Table table (Id int, name nvarchar(20), DOB date)
as
begin
insert into @Table (Id, name, DOB)
select EmployeeKey, FirstName, cast(BirthDate as date)
From dbo.DimEmployee
return
end;
