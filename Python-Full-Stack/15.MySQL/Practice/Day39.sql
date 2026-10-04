mysql> use mydb1;
Database changed
mysql> CREATE TABLE Sales (
    ->     id INT PRIMARY KEY,
    ->     customer_name VARCHAR(50),
    ->     product VARCHAR(50),
    ->     quantity INT,
    ->     price DECIMAL(10,2),
    ->     city VARCHAR(50)
    -> );
ERROR 1050 (42S01): Table 'sales' already exists
mysql> SELECT * FROM Sales;
+----+---------------+---------+----------+----------+---------+
| id | customer_name | product | quantity | price    | city    |
+----+---------------+---------+----------+----------+---------+
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi   |
|  2 | Bob           | Mobile  |        2 | 15000.00 | Mumbai  |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi   |
|  4 | David         | Tablet  |        3 | 12000.00 | Chennai |
|  5 | Eve           | Mobile  |        1 | 15000.00 | Mumbai  |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi   |
|  7 | Grace         | Tablet  |        1 | 12000.00 | Chennai |
+----+---------------+---------+----------+----------+---------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> ORDER BY price ASC;
+----+---------------+---------+----------+----------+---------+
| id | customer_name | product | quantity | price    | city    |
+----+---------------+---------+----------+----------+---------+
|  4 | David         | Tablet  |        3 | 12000.00 | Chennai |
|  7 | Grace         | Tablet  |        1 | 12000.00 | Chennai |
|  2 | Bob           | Mobile  |        2 | 15000.00 | Mumbai  |
|  5 | Eve           | Mobile  |        1 | 15000.00 | Mumbai  |
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi   |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi   |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi   |
+----+---------------+---------+----------+----------+---------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> ORDER BY price DESC;
+----+---------------+---------+----------+----------+---------+
| id | customer_name | product | quantity | price    | city    |
+----+---------------+---------+----------+----------+---------+
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi   |
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi   |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi   |
|  2 | Bob           | Mobile  |        2 | 15000.00 | Mumbai  |
|  5 | Eve           | Mobile  |        1 | 15000.00 | Mumbai  |
|  4 | David         | Tablet  |        3 | 12000.00 | Chennai |
|  7 | Grace         | Tablet  |        1 | 12000.00 | Chennai |
+----+---------------+---------+----------+----------+---------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> ORDER BY city ASC, price DESC;
+----+---------------+---------+----------+----------+---------+
| id | customer_name | product | quantity | price    | city    |
+----+---------------+---------+----------+----------+---------+
|  4 | David         | Tablet  |        3 | 12000.00 | Chennai |
|  7 | Grace         | Tablet  |        1 | 12000.00 | Chennai |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi   |
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi   |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi   |
|  2 | Bob           | Mobile  |        2 | 15000.00 | Mumbai  |
|  5 | Eve           | Mobile  |        1 | 15000.00 | Mumbai  |
+----+---------------+---------+----------+----------+---------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> WHERE city = 'Delhi';
+----+---------------+---------+----------+----------+-------+
| id | customer_name | product | quantity | price    | city  |
+----+---------------+---------+----------+----------+-------+
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi |
+----+---------------+---------+----------+----------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> WHERE price > 20000;
+----+---------------+---------+----------+----------+-------+
| id | customer_name | product | quantity | price    | city  |
+----+---------------+---------+----------+----------+-------+
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi |
+----+---------------+---------+----------+----------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> WHERE city = 'Delhi' AND price > 20000;
+----+---------------+---------+----------+----------+-------+
| id | customer_name | product | quantity | price    | city  |
+----+---------------+---------+----------+----------+-------+
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi |
+----+---------------+---------+----------+----------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Sales
    -> WHERE city = 'Delhi' OR city = 'Mumbai';
+----+---------------+---------+----------+----------+--------+
| id | customer_name | product | quantity | price    | city   |
+----+---------------+---------+----------+----------+--------+
|  1 | Alice         | Laptop  |        1 | 50000.00 | Delhi  |
|  2 | Bob           | Mobile  |        2 | 15000.00 | Mumbai |
|  3 | Charlie       | Laptop  |        1 | 52000.00 | Delhi  |
|  5 | Eve           | Mobile  |        1 | 15000.00 | Mumbai |
|  6 | Frank         | Laptop  |        2 | 50000.00 | Delhi  |
+----+---------------+---------+----------+----------+--------+
5 rows in set (0.00 sec)

mysql> SELECT product, SUM(price * quantity) AS total_sales
    -> FROM Sales
    -> GROUP BY product;
+---------+-------------+
| product | total_sales |
+---------+-------------+
| Laptop  |   202000.00 |
| Mobile  |    45000.00 |
| Tablet  |    48000.00 |
+---------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS total_customers
    -> FROM Sales
    -> GROUP BY city;
+---------+-----------------+
| city    | total_customers |
+---------+-----------------+
| Delhi   |               3 |
| Mumbai  |               2 |
| Chennai |               2 |
+---------+-----------------+
3 rows in set (0.00 sec)

mysql> SELECT product, AVG(price) AS average_price
    -> FROM Sales
    -> GROUP BY product;
+---------+---------------+
| product | average_price |
+---------+---------------+
| Laptop  |  50666.666667 |
| Mobile  |  15000.000000 |
| Tablet  |  12000.000000 |
+---------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT city, COUNT(*) AS total_customers
    -> FROM Sales
    -> GROUP BY city
    -> HAVING total_customers > 2;
+-------+-----------------+
| city  | total_customers |
+-------+-----------------+
| Delhi |               3 |
+-------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) AS total_orders
    -> FROM Sales;
+--------------+
| total_orders |
+--------------+
|            7 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT city) AS total_cities
    -> FROM Sales;
+--------------+
| total_cities |
+--------------+
|            3 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(quantity) AS total_quantity
    -> FROM Sales;
+----------------+
| total_quantity |
+----------------+
|             11 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT product, SUM(price * quantity) AS total_sales
    -> FROM Sales
    -> GROUP BY product;
+---------+-------------+
| product | total_sales |
+---------+-------------+
| Laptop  |   202000.00 |
| Mobile  |    45000.00 |
| Tablet  |    48000.00 |
+---------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT SUM(price * quantity) AS total_sales
    -> FROM Sales
    -> WHERE city = 'Delhi';
+-------------+
| total_sales |
+-------------+
|   202000.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(price) AS average_price
    -> FROM Sales;
+---------------+
| average_price |
+---------------+
|  29428.571429 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT product, AVG(price) AS average_price
    -> FROM Sales
    -> GROUP BY product;
+---------+---------------+
| product | average_price |
+---------+---------------+
| Laptop  |  50666.666667 |
| Mobile  |  15000.000000 |
| Tablet  |  12000.000000 |
+---------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT MAX(price) AS highest_price
    -> FROM Sales;
+---------------+
| highest_price |
+---------------+
|      52000.00 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT MIN(price) AS lowest_price
    -> FROM Sales;
+--------------+
| lowest_price |
+--------------+
|     12000.00 |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT customer_name,
    ->        SUM(quantity * price) AS total_purchase
    -> FROM Sales
    -> GROUP BY customer_name
    -> ORDER BY total_purchase DESC;
+---------------+----------------+
| customer_name | total_purchase |
+---------------+----------------+
| Frank         |      100000.00 |
| Charlie       |       52000.00 |
| Alice         |       50000.00 |
| David         |       36000.00 |
| Bob           |       30000.00 |
| Eve           |       15000.00 |
| Grace         |       12000.00 |
+---------------+----------------+
7 rows in set (0.00 sec)

mysql> SELECT SUM(quantity) AS total_quantity
    -> FROM Sales
    -> WHERE product = 'Mobile' AND city = 'Mumbai';
+----------------+
| total_quantity |
+----------------+
|              3 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(quantity) AS total_quantity
    -> FROM Sales
    -> WHERE product = 'Tablet' AND city = 'Chennai'
    -> HAVING total_quantity > 2;
+----------------+
| total_quantity |
+----------------+
|              4 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT product, SUM(quantity) AS total_quantity
    -> FROM Sales
    -> GROUP BY product
    -> HAVING total_quantity > 2
    -> ORDER BY total_quantity DESC;
+---------+----------------+
| product | total_quantity |
+---------+----------------+
| Laptop  |              4 |
| Tablet  |              4 |
| Mobile  |              3 |
+---------+----------------+
3 rows in set (0.00 sec)

mysql> notee;
