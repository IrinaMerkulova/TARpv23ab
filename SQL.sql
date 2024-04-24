SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - Создать таблицу
table_name - Название таблицы
(column_name1 datatype, ...) - Имя столбца1 тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - Вставить в
table_name - Название таблицы
(column_name1 datatype, ...) - Имя столбца1 тип данных
VALUES (column_value1, ...)  - Значения (Значение столбца1) 

DROP TABLE table_name
-----------------
DROP TABLE - Удалить таблицу
table_name - Название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - Обновить
table_name - Название таблицы
SET - Установить
column_name1=column_value1 - Имя_столбца1=Значение_столбца1
WHERE - где
condition - условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменить таблицу
table_name - Название таблицы
ADD - Добавить
column_name datatype - Имя столбца тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменить таблицу
table_name - Название таблицы, которую вы хотите изменить
ADD FOREIGN KEY - Добавить внешний ключ
(column_name) - Имя столбца, для которого вы хотите добавить внешний ключ
References - Ссылается на
table_name2 - Название таблицы, на которую ссылается внешний ключ
(column_name2) - Столбец в таблице table_name2, на который ссылается внешний ключ
