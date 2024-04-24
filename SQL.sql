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
(column_name1 datatype, ...) - название столбца, тип даты

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - вставить в 
table_name - название таблицы
(column_name1 datatype, ...) - название столбца, тип даты
VALUES (column_value1, ...) - Значения (значение столбца)

DROP TABLE table_name
-----------------
DROP TABLE - Удалить(уранить) таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - название таблицы
SET - установить(поставить) какое то условие
column_name1=column_value1 - название столбца, значение столбца
WHERE - где
condition - условие 

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменить таблицу
table_name - название таблицы
ADD - добавить
column_name2 datatype - название столбца, тип даты

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменить таблицу
table_name - название таблицы
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - название столбца
References - отссылка
table_name2 - название таблицы 2
(column_name2) - название столбца 2
