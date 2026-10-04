mysql> use mydb1;
Database changed
mysql> CREATE TABLE students (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     age INT,
    ->     marks INT,
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO students VALUES
    -> (1, 'Amit', 18, 85, 'Delhi'),
    -> (2, 'Sara', 19, 72, 'Mumbai'),
    -> (3, 'John', 18, 90, 'Delhi'),
    -> (4, 'Ravi', 20, 60, 'Chennai'),
    -> (5, 'Meena', 21, NULL, 'Hyderabad');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM students;
+----+-------+------+-------+-----------+
| id | name  | age  | marks | city      |
+----+-------+------+-------+-----------+
|  1 | Amit  |   18 |    85 | Delhi     |
|  2 | Sara  |   19 |    72 | Mumbai    |
|  3 | John  |   18 |    90 | Delhi     |
|  4 | Ravi  |   20 |    60 | Chennai   |
|  5 | Meena |   21 |  NULL | Hyderabad |
+----+-------+------+-------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT name, marks + 5 AS bonus_marks
    -> FROM students;
+-------+-------------+
| name  | bonus_marks |
+-------+-------------+
| Amit  |          90 |
| Sara  |          77 |
| John  |          95 |
| Ravi  |          65 |
| Meena |        NULL |
+-------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT name, marks - 10 AS deducted_marks
    -> FROM students;
+-------+----------------+
| name  | deducted_marks |
+-------+----------------+
| Amit  |             75 |
| Sara  |             62 |
| John  |             80 |
| Ravi  |             50 |
| Meena |           NULL |
+-------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT name, marks * 2 AS double_marks
    -> FROM students;
+-------+--------------+
| name  | double_marks |
+-------+--------------+
| Amit  |          170 |
| Sara  |          144 |
| John  |          180 |
| Ravi  |          120 |
| Meena |         NULL |
+-------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT name, marks / 2 AS half_marks
    -> FROM students;
+-------+------------+
| name  | half_marks |
+-------+------------+
| Amit  |    42.5000 |
| Sara  |    36.0000 |
| John  |    45.0000 |
| Ravi  |    30.0000 |
| Meena |       NULL |
+-------+------------+
5 rows in set (0.00 sec)

mysql> SELECT name, marks % 7 AS remainder
    -> FROM students;
+-------+-----------+
| name  | remainder |
+-------+-----------+
| Amit  |         1 |
| Sara  |         2 |
| John  |         6 |
| Ravi  |         4 |
| Meena |      NULL |
+-------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE marks > 70;
+----+------+------+-------+--------+
| id | name | age  | marks | city   |
+----+------+------+-------+--------+
|  1 | Amit |   18 |    85 | Delhi  |
|  2 | Sara |   19 |    72 | Mumbai |
|  3 | John |   18 |    90 | Delhi  |
+----+------+------+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE age < 20;
+----+------+------+-------+--------+
| id | name | age  | marks | city   |
+----+------+------+-------+--------+
|  1 | Amit |   18 |    85 | Delhi  |
|  2 | Sara |   19 |    72 | Mumbai |
|  3 | John |   18 |    90 | Delhi  |
+----+------+------+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE marks = 90;
+----+------+------+-------+-------+
| id | name | age  | marks | city  |
+----+------+------+-------+-------+
|  3 | John |   18 |    90 | Delhi |
+----+------+------+-------+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE marks != 85;
+----+------+------+-------+---------+
| id | name | age  | marks | city    |
+----+------+------+-------+---------+
|  2 | Sara |   19 |    72 | Mumbai  |
|  3 | John |   18 |    90 | Delhi   |
|  4 | Ravi |   20 |    60 | Chennai |
+----+------+------+-------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE city = 'Delhi' AND marks > 80;
+----+------+------+-------+-------+
| id | name | age  | marks | city  |
+----+------+------+-------+-------+
|  1 | Amit |   18 |    85 | Delhi |
|  3 | John |   18 |    90 | Delhi |
+----+------+------+-------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE city = 'Delhi' OR city = 'Mumbai';
+----+------+------+-------+--------+
| id | name | age  | marks | city   |
+----+------+------+-------+--------+
|  1 | Amit |   18 |    85 | Delhi  |
|  2 | Sara |   19 |    72 | Mumbai |
|  3 | John |   18 |    90 | Delhi  |
+----+------+------+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE NOT city = 'Chennai';
+----+-------+------+-------+-----------+
| id | name  | age  | marks | city      |
+----+-------+------+-------+-----------+
|  1 | Amit  |   18 |    85 | Delhi     |
|  2 | Sara  |   19 |    72 | Mumbai    |
|  3 | John  |   18 |    90 | Delhi     |
|  5 | Meena |   21 |  NULL | Hyderabad |
+----+-------+------+-------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE age > 18 AND marks > 70;
+----+------+------+-------+--------+
| id | name | age  | marks | city   |
+----+------+------+-------+--------+
|  2 | Sara |   19 |    72 | Mumbai |
+----+------+------+-------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE city = 'Mumbai' OR marks < 70;
+----+------+------+-------+---------+
| id | name | age  | marks | city    |
+----+------+------+-------+---------+
|  2 | Sara |   19 |    72 | Mumbai  |
|  4 | Ravi |   20 |    60 | Chennai |
+----+------+------+-------+---------+
2 rows in set (0.00 sec)

mysql> SELECT 6 & 3;
+-------+
| 6 & 3 |
+-------+
|     2 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT 6 | 3;
+-------+
| 6 | 3 |
+-------+
|     7 |
+-------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT 6 << 1;
+--------+
| 6 << 1 |
+--------+
|     12 |
+--------+
1 row in set (0.00 sec)

mysql> SET @bonus = 10;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT name, marks + @bonus AS bonus_marks
    -> FROM students;
+-------+-------------+
| name  | bonus_marks |
+-------+-------------+
| Amit  |          95 |
| Sara  |          82 |
| John  |         100 |
| Ravi  |          70 |
| Meena |        NULL |
+-------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE age BETWEEN 18 AND 20;
+----+------+------+-------+---------+
| id | name | age  | marks | city    |
+----+------+------+-------+---------+
|  1 | Amit |   18 |    85 | Delhi   |
|  2 | Sara |   19 |    72 | Mumbai  |
|  3 | John |   18 |    90 | Delhi   |
|  4 | Ravi |   20 |    60 | Chennai |
+----+------+------+-------+---------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE city IN ('Delhi', 'Hyderabad');
+----+-------+------+-------+-----------+
| id | name  | age  | marks | city      |
+----+-------+------+-------+-----------+
|  1 | Amit  |   18 |    85 | Delhi     |
|  3 | John  |   18 |    90 | Delhi     |
|  5 | Meena |   21 |  NULL | Hyderabad |
+----+-------+------+-------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE city IN ('Delhi', 'Hyderabad');
+----+-------+------+-------+-----------+
| id | name  | age  | marks | city      |
+----+-------+------+-------+-----------+
|  1 | Amit  |   18 |    85 | Delhi     |
|  3 | John  |   18 |    90 | Delhi     |
|  5 | Meena |   21 |  NULL | Hyderabad |
+----+-------+------+-------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM students
    -> WHERE name LIKE '%ee%';
+----+-------+------+-------+-----------+
| id | name  | age  | marks | city      |
+----+-------+------+-------+-----------+
|  5 | Meena |   21 |  NULL | Hyderabad |
+----+-------+------+-------+-----------+
1 row in set (0.00 sec)

mysql> notee;
