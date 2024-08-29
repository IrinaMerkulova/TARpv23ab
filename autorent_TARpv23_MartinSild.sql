--loome database autorentSild
create database autorentSild;

--kasutame autorentSild
use autorentSild;

--loome tabeli auto
CREATE TABLE auto(
autoID int not null Primary key IDENTITY(1,1),
regNumber char(6) UNIQUE,
markID int,
varv varchar(20),
v_aasta int,
kaigukastID int,
km decimal(6,2)
);
SELECT * FROM auto

--loome tabeli mark
CREATE TABLE mark(
markID int not null Primary key IDENTITY(1,1),
autoMark varchar(30) UNIQUE
);

--paneme andmed siise
INSERT INTO mark(autoMark)
VALUES ('Ziguli');
INSERT INTO mark(autoMark)
VALUES ('Lambordzini');
INSERT INTO mark(autoMark)
VALUES ('BMW');
SELECT * FROM mark;

--loome tabeli kaigukast
CREATE TABLE kaigukast(
kaigukastID int not null Primary key IDENTITY(1,1),
kaigukast varchar(30) UNIQUE
);

--paneme andmed sisse
INSERT INTO kaigukast(kaigukast)
VALUES ('Automaat');
INSERT INTO kaigukast(kaigukast)
VALUES ('Manual');
SELECT * FROM kaigukast;

--anneme teise vıtit
ALTER TABLE auto
ADD FOREIGN KEY (markID) REFERENCES mark(markID);
ALTER TABLE auto
ADD FOREIGN KEY (kaigukastID) REFERENCES kaigukast(kaigukastID);

--loome tabeli klient
CREATE TABLE klient (
    klientID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    kliendiNimi VARCHAR(50),
    telefon VARCHAR(20),
    aadress VARCHAR(50),
    soiduKogemus VARCHAR(30)
);

--loome tabeli rendiLeping ja anname teist vıttit
CREATE TABLE rendiLeping (
    lepingID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    rentiAlgus DATE,
    rentiLopp DATE,
    klientID INT,
    regNumber VARCHAR(6),
    rendiKestvus INT,
    hindKokku DECIMAL(5,2),
    tootajaID INT,
    FOREIGN KEY (klientID) REFERENCES klient(klientID),
    FOREIGN KEY (tootajaID) REFERENCES tootaja(tootajaID)
);

--loome tabeli tootaja ja anname teist vıttit
CREATE TABLE tootaja (
    tootajaID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    tootajaNimi VARCHAR(50),
    ametID INT,
    FOREIGN KEY (ametID) REFERENCES amet(ametID),
);

--loome tabeli amet
CREATE TABLE amet (
    ametID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ametNimi VARCHAR(50) NOT NULL
);

--kuvame andmed kolmest tabelist
select * from auto, mark, kaigukast
where mark.markID=auto.markID and kaigukast.kaigukastID=auto.kaigukastID

select * from auto
INNER JOIN mark ON mark.markID=auto.markID
INNER JOIN kaigukast ON kaigukast.kaigukastID=auto.kaigukastID

--t‰idame tabeli auto
INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
VALUES ('123ABC', 1, 'Red', 2010, 1, 145.67);

INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
VALUES ('456DEF', 2, 'Yellow', 2018, 2, 521.22);

INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
VALUES ('789GHI', 3, 'Black', 2020, 1, 690.12);

INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
VALUES ('012JKL', 1, 'Blue', 2015, 2, 236.78);

INSERT INTO auto(regNumber, markID, varv, v_aasta, kaigukastID, km)
VALUES ('345MNO', 2, 'Green', 2022, 1, 765.43);

SELECT * FROM auto;

--t‰idame tabeli mark
INSERT INTO mark(autoMark)
VALUES ('Audi');

INSERT INTO mark(autoMark)
VALUES ('Mercedes');

SELECT * FROM mark;

--t‰idame tabeli kaigukast
INSERT INTO kaigukast(kaigukast)
VALUES ('Semi-Automatic');

INSERT INTO kaigukast(kaigukast)
VALUES ('CVT');

INSERT INTO kaigukast(kaigukast)
VALUES ('Dual-Clutch');

SELECT * FROM kaigukast;

--t‰idame tabeli klient
INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus)
VALUES ('John Doe', '555-1234', '123 Main St', '5 years');

INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus)
VALUES ('Jane Smith', '555-5678', '456 Elm St', '10 years');

INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus)
VALUES ('Alice Brown', '555-8765', '789 Oak St', '3 years');

INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus)
VALUES ('Bob Johnson', '555-4321', '321 Pine St', '7 years');

INSERT INTO klient(kliendiNimi, telefon, aadress, soiduKogemus)
VALUES ('Charlie White', '555-9876', '654 Cedar St', '2 years');

SELECT * FROM klient;

--t‰idame tabeli amet
INSERT INTO amet(ametNimi)
VALUES ('Manager');

INSERT INTO amet(ametNimi)
VALUES ('Salesperson');

INSERT INTO amet(ametNimi)
VALUES ('Mechanic');

INSERT INTO amet(ametNimi)
VALUES ('Cleaner');

INSERT INTO amet(ametNimi)
VALUES ('Accountant');

SELECT * FROM amet;

--t‰idame tabeli tootaja
INSERT INTO tootaja(tootajaNimi, ametID)
VALUES ('Tom Hardy', 1);

INSERT INTO tootaja(tootajaNimi, ametID)
VALUES ('Emma Stone', 2);

INSERT INTO tootaja(tootajaNimi, ametID)
VALUES ('Chris Evans', 3);

INSERT INTO tootaja(tootajaNimi, ametID)
VALUES ('Natalie Portman', 4);

INSERT INTO tootaja(tootajaNimi, ametID)
VALUES ('Robert Downey', 5);

SELECT * FROM tootaja;

--t‰idame tabeli rendiLeping
INSERT INTO rendiLeping(rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
VALUES ('2024-08-01', '2024-08-05', 1, '123ABC', 4, 400.00, 1);

INSERT INTO rendiLeping(rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
VALUES ('2024-08-10', '2024-08-15', 2, '456DEF', 5, 750.00, 2);

INSERT INTO rendiLeping(rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
VALUES ('2024-08-20', '2024-08-22', 3, '789GHI', 2, 300.00, 3);

INSERT INTO rendiLeping(rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
VALUES ('2024-08-25', '2024-08-28', 4, '012JKL', 3, 450.00, 4);

INSERT INTO rendiLeping(rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
VALUES ('2024-09-01', '2024-09-03', 5, '345MNO', 2, 350.00, 5);

SELECT * FROM rendiLeping;

-- N‰ita kıiki autosid koos nende automarkide ja k‰igukastidega
SELECT * FROM auto
INNER JOIN mark ON mark.markID = auto.markID
INNER JOIN kaigukast ON kaigukast.kaigukastID = auto.kaigukastID;

-- N‰ita, milline k‰igukast on igal autol
SELECT auto.regNumber, auto.varv, auto.v_aasta, kaigukast.kaigukast 
FROM auto
INNER JOIN kaigukast ON auto.kaigukastID = kaigukast.kaigukastID;

-- N‰ita, milline automark on igal autol
SELECT auto.regNumber, auto.varv, auto.v_aasta, mark.autoMark 
FROM auto
INNER JOIN mark ON auto.markID = mark.markID;

-- Arvuta rendilepingute tabelis autode koguarv (COUNT) ja kogusumma (SUM)
SELECT tootaja.tootajaNimi, auto.regNumber, auto.varv, auto.v_aasta, rendiLeping.rentiAlgus, rendiLeping.rentiLopp 
FROM rendiLeping
INNER JOIN auto ON rendiLeping.regNumber = auto.regNumber
INNER JOIN tootaja ON rendiLeping.tootajaID = tootaja.tootajaID;

-- Arvuta rendilepingute koguarv ja kogutulu
SELECT COUNT(*) AS TotalRentedCars, SUM(hindKokku) AS TotalIncome 
FROM rendiLeping;

-- N‰ita, millised kliendid on rentinud, koos rendilepingute algus- ja lıppkuup‰evadega
SELECT klient.kliendiNimi, rendiLeping.regNumber, rendiLeping.rentiAlgus, rendiLeping.rentiLopp 
FROM rendiLeping
INNER JOIN klient ON rendiLeping.klientID = klient.klientID;

--loome kasutaja tootaja ja anname parool 123456
CREATE LOGIN tootaja WITH PASSWORD = '123456';

--anname tootajale ıigus vaadata tabeli rendiLeping
GRANT SELECT ON rendiLeping TO tootaja;

--anname tootajale ıigus lisada anmded tabeli rendiLeping
GRANT INSERT ON rendiLeping TO tootaja;

--protseduur andmete lisamiseks tabelisse rendileping
CREATE PROCEDURE sp_InsertRendiLeping
    @rentiAlgus DATE,
    @rentiLopp DATE,
    @klientID INT,
    @regNumber CHAR(6),
    @rendiKestvus INT,
    @hindKokku DECIMAL(5,2),
    @tootajaID INT
AS
BEGIN
    INSERT INTO rendiLeping (rentiAlgus, rentiLopp, klientID, regNumber, rendiKestvus, hindKokku, tootajaID)
    VALUES (@rentiAlgus, @rentiLopp, @klientID, @regNumber, @rendiKestvus, @hindKokku, @tootajaID);
END;
--kontroll
EXEC sp_InsertRendiLeping '2024-09-01', '2024-09-05', 1, '123ABC', 4, 400.00, 2;

--protseduur lepingu kustutamiseks  id j‰rgi
CREATE PROCEDURE sp_DeleteRendiLepingByID
    @lepingID INT
AS
BEGIN
    DELETE FROM rendiLeping WHERE lepingID = @lepingID;
END;
--kontroll
EXEC sp_DeleteRendiLepingByID 1;

--uuendab rendilepingute tabelis rendiLeping m‰‰ratud lepingu lıppkuup‰eva
CREATE PROCEDURE sp_UpdateRendiLoppByID
    @lepingID INT,
    @newRentiLopp DATE
AS
BEGIN
    UPDATE rendiLeping
    SET rentiLopp = @newRentiLopp
    WHERE lepingID = @lepingID;
END;
--kontroll
EXEC sp_UpdateRendiLoppByID 1, '2024-09-07';
