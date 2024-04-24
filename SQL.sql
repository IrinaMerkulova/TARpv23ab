SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создание таблицы
table_name - имя таблтцы
(column_name1 datatype, ...) - datatype Определяет тип данных для каждого столбца, column_name1 имя столбца

INSERT INTO table_name(column_name1, ...) 
VALUES (column_value1, ...) 
----------------
INSERT INTO - добавления новой записи
table_name - имя таблицы
(column_name1 datatype, ...) - название колонок
VALUES (column_value1, ...) - значение

DROP TABLE table_name
-----------------
DROP TABLE - удаления таблицы из базы данных
table_name - имя таблица

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - имя таблицы
SET - для установки значений
column_name1=column_value1 - присвоение значения столбцу
WHERE - для фильтрации строк
condition - условие 

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - для добавления
table_name - названеи таблицы
ADD - добавление 
column_name2 datatype - Определяет тип данных для каждого столбца, column_name2 имя столбца

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - для добавления
table_name - название таблицы
ADD - добавление 
FOREIGN KEY - внешнего ключа 
(column_name) - имя столбца
References - куда определяется вторичный ключ
table_name2 - имя второй таблицы
(column_name2) - имя столбца 
