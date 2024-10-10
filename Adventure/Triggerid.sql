-- 92. DDL Trigger SQL serveris
-- Loome trigger
CREATE TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
Print 'New table created'
END

-- Testime trigger tabeli loomida
Create Table Test (Id int);

-- Muutume trigger
ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE AS
BEGIN
Rollback
Print 'You cannot create, alter or drop a table'
END

-- Kustutame trigger
DISABLE TRIGGER trMyFirstTrigger ON DATABASE;

DROP TRIGGER trMyFirstTrigger ON DATABASE

-- Loome trigger
CREATE TRIGGER trRenameTable
ON DATABASE
FOR RENAME
AS
BEGIN
Print 'You just renamed something'
END

-- 93. Server-Scoped DDL triggerid
-- Loome triggerid
CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE AS
BEGIN
ROLLBACK
Print 'You cannot create, alter or drop a table in the current database' END

CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE AS BEGIN
ROLLBACK
Print 'You cannot create, alter or drop a table in any database on the server' END

-- Kustuta trigger
DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER;
DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER;