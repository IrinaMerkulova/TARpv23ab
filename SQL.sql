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
(column_name1 datatype, ...) - 

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - вставить в
table_name - имятаблицы
(column_name1 datatype, ...) - имя столбца, тип данных
VALUES (column_value1, ...) - значения столбца

DROP TABLE table_name
-----------------
DROP TABLE - удалить таблицу
table_name - 

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить данные
table_name - 
SET - установить
column_name1=column_value1 - имястолбца=значение 
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменить таблицу
table_name - имя таблицы
ADD - добавить
column_name2 datatype - имяколонки типданных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменить таблицу
table_name - имя таблицы
ADD - добавить
FOREIGN KEY - вторичный ключ
(column_name) - имя колонки
References - ссылка ключа
table_name2 - 
(column_name2) - 
