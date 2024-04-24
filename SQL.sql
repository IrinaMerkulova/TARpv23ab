SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - Созать таблицу
table_name - Название таблицы
(column_name1 datatype, ...) - Название столбца и его тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - Вставить в
table_name - Название таблицы
(column_name1 datatype, ...) - Название столбца и его тип данных
VALUES (column_value1, ...) - Значения и название столбца

DROP TABLE table_name
-----------------
DROP TABLE - Удалить (бросить) таблицу
table_name - Название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - Обновить
table_name - Название таблицы
SET - Поставить / Установить
column_name1=column_value1 - Прировнять первый столбец к первому значению 
WHERE - Где
condition - Условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменить таблицу
table_name - Называние таблицы
ADD - Добавить
column_name2 datatype - Название второго столбца и его тип данных

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменить таблицу
table_name - Называние таблицы
ADD - Добавить
FOREIGN KEY - Вторичный ключ
(column_name) - Название колонки
References - Отсылки
table_name2 - Название второй таблицы
(column_name2) - Название колонки во второй таблице
