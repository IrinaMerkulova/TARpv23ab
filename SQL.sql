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
INSERT INTO - вставка новых запесей
table_name - название таблицы
(column_name1 datatype, ...) - 
VALUES (column_value1, ...) - 

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
SET - какие имменно
column_name1=column_value1 - 
WHERE - фильтрации строк данных на основе заданных условий
condition - логическое вырожение

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменение структуры
table_name - название таблицы
ADD - ограничений к существующей таблице
column_name2 datatype - определения нового столбца в таблице

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменение структуры
table_name - название таблицы
ADD - ограничений к существующей таблице
FOREIGN KEY - вторичный ключ
(column_name) - какие столбцы в таблице будут связаны внешним ключом
References - указывающее на таблицу и столбец, на которые будет ссылаться вторичный ключ
table_name2 - назание таблицы
(column_name2) - какие столбцы в таблице будут связаны внешним ключом 
