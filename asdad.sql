
---добавляем новый столбец в таблицу
---lisame uue veeru tabelisse
alter table Person
add Age nvarchar(10)


--обновить данные	
--uuendame andmeid
update Person
set Age = 149
where Id = 8

	
--создание ограничения
--constraint loomine
alter table Person
add constraint CK_Person_Age check (Age > 0 and Age < 150)

	
--удалить человека с ID 8 из таблицы
--eemalda tabelist isik ID-ga 8 
select * from Person
go
delete from Person where Id = 8
go
select * from Person

	
--- добавляем в столбец
--- lisame veeru juurde
alter table Person
add City nvarchar(25)

	
-- мы хотим знать всех, кто живет в Готэм-сити
-- tahame tead kõiki, kes elavad Gothami linnas 
select * from Person where City = 'Gotham'
-- kõik, kes ei ela Gothamis
select * from Person where City <> 'Gotham'
select * from Person where City != 'Gotham'

	
-- указывает на людей определенного возраста
-- näitab teatud vanusega inimesi
select *from Person where Age = 100 or 
Age = 50 or Age = 20
select * from Person where Age in (100, 50, 20)

	
--- указывает на людей в определенном возрастном диапазоне
--- näitab teatud vanusevahemikus olevaid inimesi
select * from Person where Age between 30 and 50

	
--- подстановочный знак e показывает все города с буквой g.
--- wildcard e näitab kõik g-tähega linnad
select * from Person where City like 'n%'
select * from Person where Email like '%@%'

	
-- высмеивает любого, у кого нет знака @ в электронной почте
-- naitab kõiki, kellel ei ole @-märki emailis
select * from Person where Email not like '%@%'

--- показывает, кто находится в электронном письме до и после знака @
-- всего одна буква
--- näitab, kelle on emailis ees ja peale @-märki
-- ainult üks täht
select * from Person where Email like '_@_.com'

	
-- шоу, перед именем которых не было символов WAS
-- näitab, kelle on nimis ees WAS märke polnud
select * from Person where Name like '[^WAS]%'
-- näitab inimest, kes elab Gothamis või New Yorkis, ja on vanem kui 41
select * from Person where (City = 'Gotham' or City = 'New York')
and Age >= 40

	
--- занимает первые три строки
---võtab kolm esimest rida
select top 3 * from Person

	
--- первые три, но порядок таблицы: Возраст, а затем Имя.
--- kolm esimest, aga tabeli järjestus on Age ja siis Name
select * from Person
select top 3 Age, Name from Person

	
--- показывает первые 50% таблицы
--- näitab esimesed 50% tabelis
select top 50 percent * from Person
-- näitab inimesi vanuse järgi sorteeritud
select * from Person order by cast(Age as int)
select * from Person order by Age

	
-- показывает общий возраст людей
-- näitab inmesi summarne vanus
select sum(cast(Age as int)) from Person

--- отображает самого молодого человека
--- kuvab kõige nooremat isikut
select min(cast(Age as int)) from Person
--- kõige vanem isik
select max(cast(Age as int)) from Person

select City, sum(cast(Age as int)) as TotalAge from Person group by City





--- tund 3
	
-- Показывает имена сотрудников и идентификаторы отделов
-- Näitab töötajate nimid ja osakonna Id'ed
select distinct Name, DepartmentId from Employees

	
-- Показывает общую зарплату сотрудников
-- Näitab summarne töötajate palk
select sum(cast(Salary as int)) from Employees
-- Näitab minimaalne töötajate palk
select min(cast(Salary as int)) from Employees


alter table Employees
add City nvarchar(25)


alter table Employees
add DepartmentId
int null


--создание столбца
--veerge loomine
alter table Employees
add MiddleName nvarchar(30)
alter table Employees
add LastName nvarchar(30)
--puuduva veeru lisamine
alter table Employees
add FirstName nvarchar(30)

update Employees set FirstName = 'Tom', MiddleName = 'Nick', LastName = 'Jones'
where Id = 1
update Employees set FirstName = 'Pam', MiddleName = NULL, LastName = 'Anderson'
where Id = 2
update Employees set FirstName = 'John', MiddleName = NULL, LastName = NULL
where Id = 3
update Employees set FirstName = 'Sam', MiddleName = NULL, LastName = 'Smith'
where Id = 4
update Employees set FirstName = NULL, MiddleName = 'Todd', LastName = 'Someone'
where Id = 5
update Employees set FirstName = 'Ben', MiddleName = 'Ten', LastName = 'Sven'
where Id = 6
update Employees set FirstName = 'Sara', MiddleName = NULL, LastName = 'Connor'
where Id = 7
update Employees set FirstName = 'Valarie', MiddleName = 'Balerine', LastName = NULL
where Id = 8
update Employees set FirstName = 'James', MiddleName = '007', LastName = 'Bond'
where Id = 9
update Employees set FirstName = NULL, MiddleName = NULL, LastName = 'Crowe'
where Id = 10


--- из каждой строки берет заполненную ячейку в первом столбце и отображает только ее
--- igast reast võtab esimeses veerus täidetud lahtri ja kuvab ainult seda
select Id, coalesce(FirstName, MiddleName, LastName) as Name
from Employees

select * from Employees
select * from Department





--- мы создаем хранимую процедуру, которая отображает представление
--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees

	
--- создаём хранимую процедуру, получаем сотрудников по полу и отделу
--- loome stored procedure, Hankige töötajaid soo ja osakonna järgi
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select FirstName, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

	
--- все сотрудники мужского пола в первом отделе
--- kõik esimeses osakonnas meessoost töötavad isikud
exec spGetEmployeesByGenderAndDepartment 'Male', 1

exec spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



-- создаем хранимую процедуру, получаем количество сотрудников по полу
-- loome stored procedure, Hankige töötajate arv soo järgi
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- сообщает, сколько лиц мужского пола, и отображает соответствующую строку	
-- annab teada, palju on meessoost isikuid ning kuvab vastava stringi
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- указывает, сколько лиц мужского пола
-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount

	
--- создать хранимую процедуру, получить количество сотрудников
--- create stored procedure, Hankige töötajate arv
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end

	
--- начнем сп
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

	
--- создать хранимую процедуру, получить имя по идентификатору
--- create stored procedure, saab nime ID järgi
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = FirstName from employees where Id = @Id
end

	
-- выполняет процедуру, получает имя по ID
-- teostab protseduuri, saab nime ID järgi
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName

	
-- создаем хранимую процедуру, получаем имя по ID 2
-- create stored procedure, saab nime ID järgi 2
create proc spGetNameById2
@Id int
as begin
	return (select FirstName from Employees where Id = @Id)
end

	
-- выполняет процедуру, получает имя по ID 2
-- teostab protseduuri, saab nime ID järgi 2
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
