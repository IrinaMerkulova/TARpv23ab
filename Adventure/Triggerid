--92. DDL Trigger SQL serveris--

Create trigger trMyFirstTrigger
on Database 
For CREATE_TABLE
as
begin
	print 'New table created'
end

Create trigger trMyFirsTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	Print 'a table has just been created, modified or delited'
end

alter trigger trMyFirsTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	rollback
	Print 'you cannot create, modifie or delite a tabel'
end

disable trigger trMyFirstTrigger on database 

drop trigger trMyFirstTrigger on database

Create trigger trRenameTrigger
on database
for RENAME
as
begin
	Print 'you just renamed something'
end

--93. Server-Scoped DDL triggerid--

Create trigger tr_DatabaseScopeTrigger
on database
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	Print 'you cannot create, modifie or delite a tabel'
End

Create trigger tr_ServeScopeTrigger
on ALL server
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	rollback
	Print 'you cannot create, modifie or delite a tabel in any database on the server'
End

disable trigger tr_ServeScopeTrigger on all server

enable trigger tr_ServeScopeTrigger on all server

drop trigger tr_ServeScopeTrigger on all server
