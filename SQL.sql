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
(column_name1 datatype, ...) - Название столбца и его тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO -  вставляет новые записи в таблицу
table_name - Название таблицы
(column_name1 datatype, ...) -  Название столбца и его тип данных
VALUES (column_value1, ...) -  Значения и название столбца

DROP TABLE table_name
-----------------
DROP TABLE - Удаляет таблицу
table_name - Название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE -  Обновить
table_name - Название таблицы
SET - установливает новые значение
column_name1=column_value1 - Указывает, какой столбец обновить и на какое значение
WHERE - позволяет задавать дополнительные условия для выборки, редактирования, удаления и другие операции
condition - Условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменения структуры существующей таблицы,  изменить таблицу
table_name - Название таблицы
ADD - Добавляет новый столбец в таблицу
column_name2 datatype - Название второго столбца и его тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменения структуры существующей таблицы,  изменить таблицу
table_name - Название таблицы
ADD - Добавляет новый столбец в таблицу
FOREIGN KEY - Вторичный ключ
(column_name) - Название столбца
References - указывается имя связанной таблицы
table_name2 - Название 2 таблицы
(column_name2) - имя связанного столбца, на который будет указывать вторичный ключ
