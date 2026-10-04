mysql> use mydb1;
Database changed
mysql> CREATE TABLE join_customers (
    ->     cid INT PRIMARY KEY,
    ->     cname VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO join_customers (cid, cname, city) VALUES
    -> (1, 'John', 'London'),
    -> (2, 'Alice', 'Paris'),
    -> (3, 'Raj', 'Delhi'),
    -> (4, 'Sara', 'Mumbai');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE join_orders (
    ->     oid INT PRIMARY KEY,
    ->     cid INT,
    ->     city VARCHAR(50),
    ->     amount INT
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO join_orders (oid, cid, city, amount) VALUES
    -> (101, 1, 'London', 200),
    -> (102, 2, 'Paris', 300),
    -> (103, 1, 'Delhi', 250),
    -> (104, 3, 'Delhi', 500),
    -> (105, 5, 'Chennai', 400);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM join_customers;
+-----+-------+--------+
| cid | cname | city   |
+-----+-------+--------+
|   1 | John  | London |
|   2 | Alice | Paris  |
|   3 | Raj   | Delhi  |
|   4 | Sara  | Mumbai |
+-----+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM join_orders;
+-----+------+---------+--------+
| oid | cid  | city    | amount |
+-----+------+---------+--------+
| 101 |    1 | London  |    200 |
| 102 |    2 | Paris   |    300 |
| 103 |    1 | Delhi   |    250 |
| 104 |    3 | Delhi   |    500 |
| 105 |    5 | Chennai |    400 |
+-----+------+---------+--------+
5 rows in set (0.00 sec)

mysql> SELECT c.cname, o.amount
    -> FROM join_customers c, join_orders o
    -> WHERE c.cid = o.cid;
+-------+--------+
| cname | amount |
+-------+--------+
| John  |    200 |
| Alice |    300 |
| John  |    250 |
| Raj   |    500 |
+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT c.cname, o.amount
    -> FROM join_customers c, join_orders o
    -> WHERE c.cid = o.cid;
+-------+--------+
| cname | amount |
+-------+--------+
| John  |    200 |
| Alice |    300 |
| John  |    250 |
| Raj   |    500 |
+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT c.cname, o.amount
    -> FROM join_customers c
    -> INNER JOIN join_orders o
    -> ON c.cid = o.cid;
+-------+--------+
| cname | amount |
+-------+--------+
| John  |    200 |
| Alice |    300 |
| John  |    250 |
| Raj   |    500 |
+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT o.oid, c.cname, o.city
    -> FROM join_customers c
    -> INNER JOIN join_orders o
    -> ON c.cid = o.cid;
+-----+-------+--------+
| oid | cname | city   |
+-----+-------+--------+
| 101 | John  | London |
| 102 | Alice | Paris  |
| 103 | John  | Delhi  |
| 104 | Raj   | Delhi  |
+-----+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT cname, amount
    -> FROM join_customers
    -> NATURAL JOIN join_orders;
+-------+--------+
| cname | amount |
+-------+--------+
| John  |    200 |
| Alice |    300 |
| Raj   |    500 |
+-------+--------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE join_employees (
    ->     emp_id INT,
    ->     emp_name VARCHAR(50),
    ->     salary INT
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO join_employees VALUES
    -> (1, 'John', 5000),
    -> (2, 'Alice', 12000),
    -> (3, 'Bob', 20000),
    -> (4, 'David', 35000);
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE salary_grades (
    ->     grade CHAR(1),
    ->     min_sal INT,
    ->     max_sal INT
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO salary_grades VALUES
    -> ('A', 0, 10000),
    -> ('B', 10001, 20000),
    -> ('C', 20001, 40000);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT e.emp_name, e.salary, g.grade
    -> FROM join_employees e
    -> JOIN salary_grades g
    -> ON e.salary BETWEEN g.min_sal AND g.max_sal;
+----------+--------+-------+
| emp_name | salary | grade |
+----------+--------+-------+
| John     |   5000 | A     |
| Alice    |  12000 | B     |
| Bob      |  20000 | B     |
| David    |  35000 | C     |
+----------+--------+-------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE join_employee_manager (
    ->     emp_id INT,
    ->     emp_name VARCHAR(50),
    ->     manager_id INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE join_employee_manager (
    ->     emp_id INT,
    ->     emp_name VARCHAR(50),
    ->     manager_id INT
    -> );
ERROR 1050 (42S01): Table 'join_employee_manager' already exists
mysql> SELECT e.emp_name AS Employee,
    ->        m.emp_name AS Manager
    -> FROM join_employee_manager e
    -> LEFT JOIN join_employee_manager m
    -> ON e.manager_id = m.emp_id;
Empty set (0.00 sec)

mysql> CREATE TABLE join_students (
    ->     sid INT,
    ->     sname VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO join_students VALUES
    -> (1, 'Rahul'),
    -> (2, 'Priya');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE join_subjects (
    ->     subid INT,
    ->     subname VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO join_subjects VALUES
    -> (101, 'Math'),
    -> (102, 'Science'),
    -> (103, 'English');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT s.sname, sub.subname
    -> FROM join_students s
    -> CROSS JOIN join_subjects sub;
+-------+---------+
| sname | subname |
+-------+---------+
| Priya | Math    |
| Rahul | Math    |
| Priya | Science |
| Rahul | Science |
| Priya | English |
| Rahul | English |
+-------+---------+
6 rows in set (0.00 sec)

mysql> notee;
