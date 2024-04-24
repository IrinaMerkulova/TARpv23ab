SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создание таблицы
table_name - имя таблицы
(column_name1 datatype, ...) - столбики в таблице

INSERT INTO table_name(column_name1, ...) 
VALUES (column_value1, ...) 
-----------------
INSERT INTO -  - добавить данные в таблицу
table_name - имя таблицы
(column_name1 datatype, ...) - в какие столбики
VALUES (column_value1, ...) - какие даннык будут 

DROP TABLE table_name 
-----------------
DROP TABLE -  Удалить таблицу
table_name - имя таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - имя таблицы
SET - Установить 
column_name1=column_value1 - где одно равно другому
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменить таблицу 
table_name - имя таблицы
ADD - добавить 
column_name2 datatype - тип Данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменить таблицу
table_name - имя таблицы
ADD - добавить
FOREIGN KEY - внешний ключ 
(column_name) - имя столбика
References - определения внешних ключей 
table_name2 - имя таблицы
(column_name2) - имя столбика 2
