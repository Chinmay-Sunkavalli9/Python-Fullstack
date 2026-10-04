mysql> use mydb1;
Database changed
mysql> CREATE TABLE student (
    ->     id INT,
    ->     name VARCHAR(40),
    ->     age SMALLINT,
    ->     marks SMALLINT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO student (id, name, age, marks)
    -> VALUES (1, 'Raju', 23, 76);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO student (id, name, age, marks)
    -> VALUES (3, 'Janu', 18, 56);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO student (id, name, age, marks)
    -> VALUES
    -> (4, 'Kalyani', 25, 87),
    -> (5, 'Anjali', 22, 86);
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student;
+------+---------+------+-------+
| id   | name    | age  | marks |
+------+---------+------+-------+
|    1 | Raju    |   23 |    76 |
|    3 | Janu    |   18 |    56 |
|    4 | Kalyani |   25 |    87 |
|    5 | Anjali  |   22 |    86 |
+------+---------+------+-------+
4 rows in set (0.00 sec)

mysql> SELECT id, name FROM student;
+------+---------+
| id   | name    |
+------+---------+
|    1 | Raju    |
|    3 | Janu    |
|    4 | Kalyani |
|    5 | Anjali  |
+------+---------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM student
    -> WHERE marks > 80;
+------+---------+------+-------+
| id   | name    | age  | marks |
+------+---------+------+-------+
|    4 | Kalyani |   25 |    87 |
|    5 | Anjali  |   22 |    86 |
+------+---------+------+-------+
2 rows in set (0.00 sec)

mysql> UPDATE student
    -> SET marks = 91
    -> WHERE id = 2;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> UPDATE student
    -> SET marks = 64
    -> WHERE id IN (1, 3);
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM student;
+------+---------+------+-------+
| id   | name    | age  | marks |
+------+---------+------+-------+
|    1 | Raju    |   23 |    64 |
|    3 | Janu    |   18 |    64 |
|    4 | Kalyani |   25 |    87 |
|    5 | Anjali  |   22 |    86 |
+------+---------+------+-------+
4 rows in set (0.00 sec)

mysql> DELETE FROM student
    -> WHERE id = 5;
Query OK, 1 row affected (0.03 sec)

mysql> DELETE FROM student
    -> WHERE id IN (3, 4);
Query OK, 2 rows affected (0.03 sec)

mysql> SELECT * FROM student;
+------+------+------+-------+
| id   | name | age  | marks |
+------+------+------+-------+
|    1 | Raju |   23 |    64 |
+------+------+------+-------+
1 row in set (0.00 sec)

mysql> TRUNCATE TABLE student;
Query OK, 0 rows affected (0.09 sec)

mysql> SELECT * FROM student;
Empty set (0.00 sec)

mysql> notee;
