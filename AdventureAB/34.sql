-- Loome ajutise tabeli #PersonDetails
Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Lisame andmed ajutisse tabelisse
Insert into #PersonDetails Values(1, 'Mike')
Insert into #PersonDetails Values(2, 'John')
Insert into #PersonDetails Values(3, 'Todd')

-- Kuvame kõik kirjed tabelist #PersonDetails
Select * from #PersonDetails

-- Otsime ajutiste tabelite nimed tempdb andmebaasist, mis vastavad #PersonDetails mustrile
Select name from tempdb..sysobjects 
where name like '#PersonDetails%'

-- Kustutame ajutise tabeli #PersonDetails
DROP TABLE #PersonDetails

-- Loome protseduuri spCreateLocalTempTable, mis loob ajutise tabeli ja lisab sinna andmed
Create Procedure spCreateLocalTempTable
as
begin
    Create Table #PersonDetails(Id int, Name nvarchar(20))
    
    Insert into #PersonDetails Values(1, 'Mike')
    Insert into #PersonDetails Values(2, 'John')
    Insert into #PersonDetails Values(3, 'Todd')
    
    -- Kuvame tabeli #PersonDetails sisu
    Select * from #PersonDetails
END

-- Loome globaalse ajutise tabeli ##EmployeeDetails
Create Table ##EmployeeDetails(Id int, Name nvarchar(20))

-- Lisame andmed globaalsesse ajutisse tabelisse
Insert into ##EmployeeDetails Values(1, 'Alice')
Insert into ##EmployeeDetails Values(2, 'Bob')
Insert into ##EmployeeDetails Values(3, 'Charlie')

-- Otsime globaalseid ajutisi tabeleid tempdb andmebaasist, mis vastavad ##EmployeeDetails mustrile
Select name from tempdb..sysobjects 
where name like '##EmployeeDetails%'

-- Kuvame kõik kirjed tabelist ##EmployeeDetails
Select * from ##EmployeeDetails
