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
