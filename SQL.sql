SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создать таблицу
table_name - названик таблицы
(column_name1 datatype, ...) - тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - добавить в
table_name - название таблицы
(column_name1 datatype, ...) - тип данных
VALUES (column_value1, ...) - значения

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
SET - назначить\установить 
column_name1=column_value1 - название колонки/значение колонки
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изминить таблицу
table_name - название таблицы
ADD - добавить
column_name2 datatype - название колонки_тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изминить таблицу
table_name - название таблицы
ADD - добавить
FOREIGN KEY - Вторичный ключ
(column_name) - назввание колонки
References - ссылка 
table_name2 - название таблицы
(column_name2) - назввание колонки 2
