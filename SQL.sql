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
(column_name1 datatype, ...) - Указанные столбцы

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - Начало операции для добавления данных в таблицу
table_name - Название таблицы
(column_name1 datatype, ...) - Указанные столбцы
VALUES (column_value1, ...) - Список значений которые вставятся в указанную таблицу

DROP TABLE table_name
-----------------
DROP TABLE - Удаляет таблицу
table_name - Название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - Обнавление сущ. записей в таблице
table_name - Название таблицы
SET - Для установки новых значений
column_name1=column_value1 - Указывает, какой столбец обновить и на какое значение
WHERE - Определяет условие, при котором будет производиться обновление
condition - Определяет условие, при котором будет производиться обновление

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - Изменяет структуру существующей таблицы
table_name - Название таблицы
ADD - Добавит новый столбец в таблицу
column_name2 datatype - Новый столбец, который надо добавить

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - Изменяет структуру существующей таблицы
table_name - Название таблицы
ADD - Добавит новый столбец в таблицу
FOREIGN KEY - Вторичный ключ
(column_name) - Столбец в таблице, который будет использоваться в качестве внешнего ключа
References - Указывает, что будет производиться ссылка на другую таблицу
table_name2 - Название второй таблицы
(column_name2) - Название столбца в таблице, где будет указывать внешний ключ
