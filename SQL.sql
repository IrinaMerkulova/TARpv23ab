SELECT * FROM table_name
----------------
SELECT - Выбрать
* - Всё
FROM - Из
table_name - Название таблицы

CREATE TABLE (column_name1 datatype, ...)
-----------------
CREATE TABLE - создать таблицу
table_name - Название таблицы
(column_name1 datatype, ...) - column_name1 - название столбца datatype - тип данных

INSERT INTO table_name(column_name1, ...)
VALUES (column_value1, ...)
-----------------
INSERT INTO - добавления новых строк
table_name - Название таблицы
(column_name1 datatype, ...) -  column_name1 - название столбца datatype - тип данных
VALUES (column_value1, ...) - список значений

DROP TABLE table_name
-----------------
DROP TABLE - сбросить таблицу
table_name - Название таблицы

------------------------------------

UPDATE table_name SET column_name1=column_value1
WHERE condition
-----------------
UPDATE - изменения или обновления данных
table_name - Название таблицы
SET - обновить
column_name1=column_value1 - column_name1 - название столбца/определяет столбец и новое значение
WHERE - где/какие строки
condition - критерии/ условие

ALTER TABLE table_name ADD column_name datatype
-----------------
ALTER TABLE - изменения структуры существующей таблицы
table_name - Название таблицы
ADD - указывает, что вы хотите добавить новый столбец
column_name2 datatype - тип данных для нового столбца

-------------------------------

ALTER TABLE table_name 
ADD FOREIGN KEY (column_name) References table_name2(column_name2)
-----------------
ALTER TABLE - изменения структуры существующей таблицы
table_name -  имя таблицы
ADD - указывает, что вы добавляете новый столбец
FOREIGN KEY - устанавливает отношения между таблицами
(column_name) - имя столбца, который будет внешним ключом
References - указывает на таблицу и столбец, на который будет ссылаться внешний ключ.
table_name2 - мя таблицы, на которую будет ссылается внешний ключ.
(column_name2) - имя столбца в целевой таблице, на который будет ссылается внешний ключ.
