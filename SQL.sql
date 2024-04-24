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
(column_name1 datatype, ...) - поля таблицы

INSERT INTO table_name(column_name1, ...) - добавлениеи записей в поля column_name1 и т.д
VALUES (column_value1, ...) - записи
-----------------
INSERT INTO - добавление
table_name - название таблицы
(column_name1 datatype, ...) - поля для заполнения
VALUES (column_value1, ...) - записи

DROP TABLE table_name 
-----------------
DROP TABLE - удаление таблицы
table_name - таблица

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновление
table_name - названия таблицы
SET - сделать
column_name1=column_value1 - названия поля = запись
WHERE - условие (где)
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменение ТАБЛИЦнЫ
table_name - название таблицы
ADD - добавление 
column_name2 datatype - названия поля и его тип

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменение таблицы
table_name - названия таблицы
ADD - длобавления
FOREIGN KEY - вторичный ключ
(column_name) - имя поля
References - брать из
table_name2 - название таблицы
(column_name2) - имя поля
