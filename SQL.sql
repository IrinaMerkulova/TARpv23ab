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
(column_name1 datatype, ...) - Название столбца и тип данных для него

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - Добавить в 
table_name - Таблица 
(column_name1 datatype, ...) - Столбцы таблицы 
VALUES (column_value1, ...) - В качестве(данные для заполнения столбцов)

DROP TABLE table_name
-----------------
DROP TABLE - Сбросить таблицу
table_name - Название таблицы 

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - Обновить 
table_name - Название таблицы 
SET - Установить
column_name1=column_value1 - Значения первого столбца равны второму 
WHERE - Там где
condition - Условие 

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменить таблицу
table_name - Название таблицы 
ADD - Добавить 
column_name2 datatype - Столбец и тип данных 

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменить таблицу
table_name - Название таблицы 
ADD - Добавить 
FOREIGN KEY - Вторичный ключ 
(column_name) - Название столбца 
References - Ссылаясь на
table_name2 - Название таблицы 
(column_name2) - Название столбца 
