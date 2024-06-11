

-- Syntaksi viga
-- Puudub sulg lause l�pus
CREATE TABLE Tootajad (
    ID INT PRIMARY KEY  identity(1,1),
    Nimi VARCHAR(100)
)
--Msg 102, Level 15, State 1, Line 8
--Incorrect syntax near ')'.



-- T��bi sobimatus
-- Yritatakse lisada string numbrilisele v�ljale
INSERT INTO Tootajad (ID, Nimi) VALUES ('�ks', 'Bog');

--Msg 245, Level 16, State 1, Line 16
--Conversion failed when converting the varchar value '�ks' to data type int.


-- Ainulaadne v�tme rikkumine
-- P��takse sisestada sama ID kaht korda
INSERT INTO Tootajad  (ID, Nimi) VALUEs (1, 'Bog');
INSERT INTO Tootajad(ID, Nimi)  VALUES (1, 'Art');

--Msg 544, Level 16, State 1, Line 24
--Cannot insert explicit value for identity column in table 'Tootajad' when IDENTITY_INSERT is set to OFF.
--Msg 544, Level 16, State 1, Line 25
--Cannot insert explicit value for identity column in table 'Tootajad' when IDENTITY_INSERT is set to OFF.




-- Tabeli mitteolemasolu 
-- P��takse valida andmeid tabelist mis ei eksisteeri
SELECt * FROM Klient;
--Msg 208, Level 16, State 1, Line 37
--Invalid object name 'Klient'.




-- V�li ei ole olemas
-- P��takse valida v�li, mida ei ole olemas tabelis
SELECT Vanus FROM Tootajad;
--Msg 207, Level 16, State 1, Line 46
--Invalid column name 'Vanus'.
