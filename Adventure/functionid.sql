 -- funktsiooonid 32
Create Function fn_ILTVF_GetEmployees()
Returns Table 
as
Return(select EmployeeKey, FirstName, Cast(BirthDate as Date) as DOB
from DimEmployee)

Create Function fn_MASTVF_GetEmployees()
Returns @Table Table(EmployeeKey int, FirstName  varchar(20), DOB Date)
as
Begin
Insert into @Table
Select EmployeeKey, FirstName, Cast(BirthDate as date)
from DimEmployee
Return
End
Select * from fn_ILTVF_GetEmployees()
Select * from fn_MSTVF_GetEmployees()

-- funktsiooonid 33

create function fn_GetEmployeeNameByID(@Id int)
Returns nvarchar(20)
as
begin 
return (Select FirstName from DimEmployee Where EmployeeKey = @Id)
End

select * from fn_GetEmployeeNameByID(1);

Alter Function fn_GetEmployeeNameById(@id int)
Returns nvarchar(20)
With Encryption 
as
Begin
Return (Select FirstName from DimEmployee Where EmployeeKey = @Id)
End

sp_helptext fn_GetEmployeeNameById
