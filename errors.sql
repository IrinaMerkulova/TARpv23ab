

-- Syntaksi viga
-- Puudub sulg lause l�pus
CREATE TABLE Tootajad (
    ID INT,
    Nimi VARCHAR(100
)

-- T��bi sobimatus
-- Yritatakse lisada string numbrilisele v�ljale
INSERT INTO Tootajad (ID, Nimi) VALUES ('�ks', 'Bog');



-- Ainulaadne v�tme rikkumine
-- P��takse sisestada sama ID kaht korda
INSERT INTO Tootajad  (ID, Nimi) VALUEs (1, 'Bog');
INSERT INTO Tootajad(ID, Nimi)  VALUES (1, 'Art');


-- Tabeli mitteolemasolu 
-- P��takse valida andmeid tabelist mis ei eksisteeri
SELECt * FROM Klient;