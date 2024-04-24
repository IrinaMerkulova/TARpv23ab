SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - Cоздать таблицу
table_name - Название таблицу
(column_name1 datatype, ...) - имя стобца и тип данных

INSERT INTO table_name(column_name1, ...) ввести в таблицу, название Столбца.
VALUES (column_value1, ...) - значения
-----------------
INSERT INTO - Вставить в / Внести в
table_name - Название таблицы
(column_name1 datatype, ...) - название столбца и тип данных
VALUES (column_value1, ...) - значения

DROP TABLE table_name
-----------------
DROP TABLE - Удалить таблицу
table_name - название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - Обновить
table_name - Название таблицы 
SET - Установить / Поставить
column_name1=column_value1 Имя столбца = Значения столбца
WHERE - Где
condition - Условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменить Таблицу
table_name - Название Таблицы
ADD - Добавить
column_name2 datatype - Имя столбца = Значения столбца

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменить таблицу
table_name -  Название Таблицы
ADD - Добавить
FOREIGN KEY - (Внешний / Вторичный) ключ
(column_name) - Имя столбца
References - Отсылка/ Ссылается
table_name2 - Название таблицы
(column_name2) - Название Столбца
