-- ajutisedTableid 34
create table #PersonDetails(
Id int,
Name nvarchar(20))

Insert into #PersonDetails Values(1,'Mike')
Insert into #PersonDetails Values(2,'John')
Insert into #PersonDetails Values(3,'Todd')
select * from  #PersonDetails
Select * from #PersonDetails

Select name from tempdb..sysobjects
where name like '#PersonDetails%'

Create Procedure spCreateLocalTempTable
as
Begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
Insert into #PersonDetails Values(1,'Mike')
Insert into #PersonDetails Values(2,'John')
Insert into #PersonDetails Values(3,'Todd')
Select * from #PersonDetails
End
EXEC spCreateLocalTempTable

CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20));
