SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создать таблицу
table_name - название таблицы
(column_name1 datatype, ...) - 

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...) 
-----------------
INSERT INTO - добавляет запись в таблицу
table_name - название таблицы
(column_name1 datatype, ...) - 
VALUES (column_value1, ...) - вычисляет строковое значение 

DROP TABLE table_name
-----------------
DROP TABLE -  удалить таблицу 
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - 
table_name - название таблицы
SET - создать значение 
column_name1=column_value1 - название столбца1 равноется названию столбца2
WHERE - где
condition - условие 

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменияет тип таблица 
table_name - название таблицы
ADD - добавляет 
column_name2 datatype - название столбца 2  тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE -изменияет тип таблица 
table_name - название таблицы
ADD - добавляет 
FOREIGN KEY - вторичный ключ
(column_name) - название столбца
References - 
table_name2 - название таблицы 2
(column_name2) - название столбца 2
