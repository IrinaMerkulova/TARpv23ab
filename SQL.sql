SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создать таблицу
table_name - имя таблицы
(column_name1 datatype, ...) - имя и тип колонны 

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - вставить в
table_name - имя таблицы
(column_name1 datatype, ...) - имя и тип колонны
VALUES (column_value1, ...) - что именно окажется в колонне

DROP TABLE table_name
-----------------
DROP TABLE - удалить
table_name - имя таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - имя таблицы
SET - назначить
column_name1=column_value1 - 1 столбец меняется на 2
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменить
table_name - имя таблицы
ADD - добавить
column_name2 datatype - имя и тип колонны 

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE -изменить
table_name - имя таблицы
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - имя колонны
References - присвоить
table_name2 - имя таблицы
(column_name2) - имя колонны
