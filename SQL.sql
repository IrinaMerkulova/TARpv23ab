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
(column_name1 datatype, ...) - column_name1 - название столбца, datatype - тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - добавить в новые строкт
table_name - название таблицы
(column_name1 datatype, ...) - column_name1 - название столбца, datatype - тип данных
VALUES (column_value1, ...) - список значений

DROP TABLE table_name
-----------------
DROP TABLE - удалить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить/перезаписать
table_name - название таблицы
SET - назначить
column_name1=column_value1 - список столбцов и их новые значения
WHERE - где
condition - условия

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменить таблицу
table_name - название таблицы
ADD - добавить 
column_name2 datatype - название таблицы, тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменить таблицу
table_name - название таблицы
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - название столбца
References - показывает столбец
table_name2 - название таблицы
(column_name2) - название столбца
