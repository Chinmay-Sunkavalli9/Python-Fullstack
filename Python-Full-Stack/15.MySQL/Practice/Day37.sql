mysql> use mydb1;
Database changed
mysql> CREATE TABLE student (
    ->     id INT,
    ->     name VARCHAR(50),
    ->     age SMALLINT,
    ->     marks DECIMAL(5,2)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES;
+-----------------+
| Tables_in_mydb1 |
+-----------------+
| student         |
+-----------------+
1 row in set (0.04 sec)

mysql> DESC student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(50)  | YES  |     | NULL    |       |
| age   | smallint     | YES  |     | NULL    |       |
| marks | decimal(5,2) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> ALTER TABLE student
    -> ADD city VARCHAR(30);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student
    -> MODIFY city CHAR(50);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student
    -> CHANGE city student_city CHAR(50);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student
    -> ADD email VARCHAR(50),
    -> ADD phone BIGINT;
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student
    -> RENAME TO students;
Query OK, 0 rows affected (0.04 sec)

mysql> ALTER TABLE students
    -> DROP COLUMN student_city;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> RENAME TABLE students TO student;
Query OK, 0 rows affected (0.04 sec)

mysql> DESC student;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | YES  |     | NULL    |       |
| name  | varchar(50)  | YES  |     | NULL    |       |
| age   | smallint     | YES  |     | NULL    |       |
| marks | decimal(5,2) | YES  |     | NULL    |       |
| email | varchar(50)  | YES  |     | NULL    |       |
| phone | bigint       | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> TRUNCATE TABLE student;
Query OK, 0 rows affected (0.11 sec)

mysql> DROP TABLE student;
Query OK, 0 rows affected (0.07 sec)

mysql> notee;
