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

INSERT INTO table_name(column_name1, ...) вставить в таблицу 
VALUES (column_value1, ...) значения (column_value1, ...)
-----------------
INSERT INTO - вставить в
table_name - название таблицы
(column_name1 datatype, ...) - данные в таблице
VALUES (column_value1, ...) - значения

DROP TABLE table_name удаление таблицы table_name
-----------------
DROP TABLE - удалить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - обновить
table_name - название таблицы
SET - установить значения
column_name1=column_value1 -  изменение таблицы на другое название
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - чтобы изменять после создания таблицы
table_name - название
ADD - добавить
column_name2 datatype - добавить столбец datatype

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE -чтобы изменять после создания таблицы
table_name - название
ADD - добавить
FOREIGN KEY - вторичный ключ для соединения с другой датабазой
(column_name) - название столбца первй датабазы
References - отсылка
table_name2 - название 
(column_name2) - название столбца второй датабазы
