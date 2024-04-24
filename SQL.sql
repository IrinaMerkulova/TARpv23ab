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
(column_name1 datatype, ...) - название столбца и его тип данных 

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - доюавить в 
table_name - название таблицы
(column_name1 datatype, ...) - название столбца и его тип данных 
VALUES (column_value1, ...) - значения которые добавляют

DROP TABLE table_name
-----------------
DROP TABLE - удалить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - название таблицы
SET - поставить 
column_name1=column_value1 - название столбца и его значени
WHERE - где
condition - условие 

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменить таблтцу 
table_name - название таблицы
ADD - добавить
column_name2 datatype - название столбца и его значени

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE -изменить табицу
table_name - название таблицы
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - название столбца
References - ссылка 
table_name2 - название таблицы 2
(column_name2) - название столбца 2
