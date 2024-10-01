
-- 92 fail ( DDL Trigger SQL serveris ) --------------------------------------------------------------------------------------------------------------------------

-- DDL triggeri vahemik: DDL trigger saab luua konkreetsesse andmebaasi või serveri tasemel.
CREATE TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
Print 'New table created'
END

-- Kui sa järgnevat koodi käivitad, siis trigger läheb automaatselt käima ja prindib välja sõnumi: uus tabel on loodud.
CREATE TABLE Test(Id int);

-- Ülevapool olev trigger käivitatakse ainult ühe DDL tegevuse juures CREATE_TABLE. Kui soovid, et see trigger käivitatakse mitu korda nagu muuda ja kustuta tabel, siis eralda sündmused ning kasuta koma.
ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
	Print 'A table has just been created, modified or deleted'
END

-- Kustutame Test tabel
DROP TABLE Test

-- Lisame uue välja Test tabelisse
ALTER TABLE Test ADD Makaka int

-- Nüüd vaatame näidet, kuidas ära hoida kasutajatel loomaks, muutmaks või kustatamiseks tabelit. Selleks pead olemasolevat triggerit muutma:
ALTER TRIGGER trMyFirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'You cannot create, alter or drop a table'
END

-- Kustutame Test tabel
DROP TABLE Test

-- Loome Test tabel
CREATE TABLE Test2(Id int);

-- Lisame uue välja Test tabelisse
ALTER TABLE Test ADD Makaka2 int


-- Kui lubada triggerit
DISABLE TRIGGER trMyFirstTrigger ON DATABASE

-- Kuidas kustutada triggerit
DROP TRIGGER trMyFirstTrigger ON Database

-- Järgnev trigger käivitub, kui peaksid kasutama sp_rename käsklust süsteemi stored procedurite muutmisel.
CREATE TRIGGER trRenameTable
ON DATABASE
FOR RENAME
AS
BEGIN
PRINT 'You just renamed something'
END

sp_rename 'Test', 'NewTestTable' 

-- 93 fail ( Server-Scoped DDL triggerid ) ---------------------------------------------------------------------------------------------------------------------------------------

-- Käsitletav trigger on andmebaasi vahemikus olev trigger. See ei luba luua, muuta ja kustutada tabeleid andmebaasist sinna, kuhu see on loodud.
CREATE TRIGGER tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'You cannot create, alter or drop a table in the current database'
END

-- Triggeri paneme kinni
DISABLE TRIGGER tr_DatabaseScopeTrigger ON DATABASE

-- Kui tahame, siis saame teha lahti
ENABLE TRIGGER tr_DatabaseScopeTrigger ON DATABASE

-- Proovime luua tabel
CREATE TABLE test(id int);

-- Loo Serveri-vahemikus olev DDL trigger: See on nagu andembaasi vahemiku trigger, aga erinevus seisneb, et sa pead lisama koodis sõna ALL peale
CREATE TRIGGER tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
Print 'You cannot create, alter or drop a table in any database on the server'
END

-- Kuidas saab Serveri ulatuses olevat DDL trigerit kinni panna
DISABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

-- Kuidas lubada Serveri ulatuses olevat DDL trigerit:
ENABLE TRIGGER tr_ServerScopeTrigger ON ALL SERVER

-- Saame kustutada seda triggerit
DROP TRIGGER tr_ServerScopeTrigger ON ALL SERVER;
