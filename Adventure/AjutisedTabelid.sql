-- 34. ajutisedTabelid
-- Loome ajutise tabel
Create Table #PersonDetails(Id int, Name nvarchar(20));

Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');

-- Vaatame tabel
Select * from #PersonDetails;

Select name from tempdb..sysobjects
where name like '#PersonDetails%';

-- Kustutame tabel
DROP TABLE #PersonDetails;

-- Loome protseduur
Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
Insert into #PersonDetails Values(1, 'Mike');
Insert into #PersonDetails Values(2, 'John');
Insert into #PersonDetails Values(3, 'Todd');
Select * from #PersonDetails
End

-- Loome ajutise tabel
Create Table ##EmployeeDetails(Id int, Name nvarchar(20));