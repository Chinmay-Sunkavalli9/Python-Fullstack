mysql> use mydb1;
Database changed
mysql> CREATE TABLE customers (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO customers VALUES
    -> (1, 'Ravi', 'Hyderabad'),
    -> (2, 'Priya', 'Bangalore'),
    -> (3, 'Amit', 'Chennai'),
    -> (4, 'Sneha', 'Hyderabad');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE suppliers (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO suppliers VALUES
    -> (1, 'Arun', 'Hyderabad'),
    -> (2, 'Meena', 'Mumbai'),
    -> (3, 'Kiran', 'Chennai'),
    -> (4, 'Rahul', 'Delhi');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers;
+----+-------+-----------+
| id | name  | city      |
+----+-------+-----------+
|  1 | Ravi  | Hyderabad |
|  2 | Priya | Bangalore |
|  3 | Amit  | Chennai   |
|  4 | Sneha | Hyderabad |
+----+-------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM suppliers;
+----+-------+-----------+
| id | name  | city      |
+----+-------+-----------+
|  1 | Arun  | Hyderabad |
|  2 | Meena | Mumbai    |
|  3 | Kiran | Chennai   |
|  4 | Rahul | Delhi     |
+----+-------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT city FROM customers
    -> UNION
    -> SELECT city FROM suppliers;
+-----------+
| city      |
+-----------+
| Hyderabad |
| Bangalore |
| Chennai   |
| Mumbai    |
| Delhi     |
+-----------+
5 rows in set (0.00 sec)

mysql> SELECT city FROM customers
    -> UNION ALL
    -> SELECT city FROM suppliers;
+-----------+
| city      |
+-----------+
| Hyderabad |
| Bangalore |
| Chennai   |
| Hyderabad |
| Hyderabad |
| Mumbai    |
| Chennai   |
| Delhi     |
+-----------+
8 rows in set (0.00 sec)

mysql> SELECT city FROM customers
    -> INTERSECT
    -> SELECT city FROM suppliers;
+-----------+
| city      |
+-----------+
| Hyderabad |
| Chennai   |
+-----------+
2 rows in set (0.00 sec)

mysql> SELECT city FROM customers
    -> EXCEPT
    -> SELECT city FROM suppliers;
+-----------+
| city      |
+-----------+
| Bangalore |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*)
    -> FROM (
    ->     SELECT city FROM customers
    ->     UNION
    ->     SELECT city FROM suppliers
    -> ) AS combined;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*)
    -> FROM (
    ->     SELECT city FROM customers
    ->     UNION
    ->     SELECT city FROM suppliers
    -> ) AS combined;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS total_count
    -> FROM customers
    -> GROUP BY city
    -> UNION
    -> SELECT city, COUNT(*) AS total_count
    -> FROM suppliers
    -> GROUP BY city;
+-----------+-------------+
| city      | total_count |
+-----------+-------------+
| Hyderabad |           2 |
| Bangalore |           1 |
| Chennai   |           1 |
| Hyderabad |           1 |
| Mumbai    |           1 |
| Delhi     |           1 |
+-----------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS total_count
    -> FROM customers
    -> GROUP BY city
    -> UNION
    -> SELECT city, COUNT(*) AS total_count
    -> FROM suppliers
    -> GROUP BY city;
+-----------+-------------+
| city      | total_count |
+-----------+-------------+
| Hyderabad |           2 |
| Bangalore |           1 |
| Chennai   |           1 |
| Hyderabad |           1 |
| Mumbai    |           1 |
| Delhi     |           1 |
+-----------+-------------+
6 rows in set (0.00 sec)

mysql> notee;
