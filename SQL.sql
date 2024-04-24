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
(column_name1 datatype, ...) - столбик с этим именем

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - добавить в 
table_name - название таблицы
(column_name1 datatype, ...) - порядок того как надо записовать информацию для добовления
VALUES (column_value1, ...) - даные которые нужно добавить

DROP TABLE table_name
-----------------
DROP TABLE - удолить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - название таблицы
SET - какие столбцы и значения следует обновить в таблице.
column_name1=column_value1 - 
WHERE - используется для фильтрации записей.
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - используется для добавления, удаления или изменения столбцов в существующей таблице.
table_name - название таблицы
ADD - используется для добавления столбца в существующую таблицу.
column_name2 datatype - новый столбик с этим именем

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - используется для добавления, удаления или изменения столбцов в существующей таблице.
table_name - название таблицы (1)
ADD - используется для добавления столбца в существующую таблицу.
FOREIGN KEY - используется для предотвращения действий, которые могут разрушить связи между таблицами. 
(column_name) - имя столбика (1)
References - отсылка 
table_name2 - название таблицы (2)
(column_name2) - имя столбика (1)
