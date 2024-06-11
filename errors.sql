

-- Syntaksi viga
-- Puudub sulg lause lõpus
CREATE TABLE Tootajad (
    ID INT,
    Nimi VARCHAR(100
)

-- Tüübi sobimatus
-- Yritatakse lisada string numbrilisele väljale
INSERT INTO Tootajad (ID, Nimi) VALUES ('üks', 'Bog');



-- Ainulaadne võtme rikkumine
-- Püütakse sisestada sama ID kaht korda
INSERT INTO Tootajad  (ID, Nimi) VALUEs (1, 'Bog');
INSERT INTO Tootajad(ID, Nimi)  VALUES (1, 'Art');


-- Tabeli mitteolemasolu 
-- Püütakse valida andmeid tabelist mis ei eksisteeri
SELECt * FROM Klient;