mysql> use mydb1;
Database changed
mysql> CREATE TABLE cust (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     city VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO cust VALUES
    -> (1, 'Raju', 'Hyderabad'),
    -> (2, 'Rajesh', 'Bengaluru'),
    -> (3, 'Ram', 'Chennai'),
    -> (4, 'Priya', 'Mumbai');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM cust;
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  1 | Raju   | Hyderabad |
|  2 | Rajesh | Bengaluru |
|  3 | Ram    | Chennai   |
|  4 | Priya  | Mumbai    |
+----+--------+-----------+
4 rows in set (0.00 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE GetAllCustomers()
    -> BEGIN
    ->     SELECT * FROM cust;
    -> END //
Query OK, 0 rows affected (0.05 sec)

mysql> DELIMITER ;
mysql> CALL GetAllCustomers();
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  1 | Raju   | Hyderabad |
|  2 | Rajesh | Bengaluru |
|  3 | Ram    | Chennai   |
|  4 | Priya  | Mumbai    |
+----+--------+-----------+
4 rows in set (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE GetCustomerById(IN cust_id INT)
    -> BEGIN
    ->     SELECT * FROM cust
    ->     WHERE id = cust_id;
    -> END //
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL GetCustomerById(2);
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  2 | Rajesh | Bengaluru |
+----+--------+-----------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE InsertCustomer(
    ->     IN cust_id INT,
    ->     IN cust_name VARCHAR(50),
    ->     IN cust_city VARCHAR(50)
    -> )
    -> BEGIN
    ->     INSERT INTO cust (id, name, city)
    ->     VALUES (cust_id, cust_name, cust_city);
    -> 
    ->     SELECT 'Customer Inserted Successfully!' AS message;
    -> END //
Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER ;
mysql> CALL InsertCustomer(5, 'Ravi', 'Delhi');
+---------------------------------+
| message                         |
+---------------------------------+
| Customer Inserted Successfully! |
+---------------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM cust;
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  1 | Raju   | Hyderabad |
|  2 | Rajesh | Bengaluru |
|  3 | Ram    | Chennai   |
|  4 | Priya  | Mumbai    |
|  5 | Ravi   | Delhi     |
+----+--------+-----------+
5 rows in set (0.00 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE InsertAndShow(
    ->     IN cust_id INT,
    ->     IN cust_name VARCHAR(50),
    ->     IN cust_city VARCHAR(50)
    -> )
    -> BEGIN
    ->     INSERT INTO cust (id, name, city)
    ->     VALUES (cust_id, cust_name, cust_city);
    -> 
    ->     SELECT * FROM cust;
    -> END //
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL InsertAndShow(6, 'Meena', 'Vizag');
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  1 | Raju   | Hyderabad |
|  2 | Rajesh | Bengaluru |
|  3 | Ram    | Chennai   |
|  4 | Priya  | Mumbai    |
|  5 | Ravi   | Delhi     |
|  6 | Meena  | Vizag     |
+----+--------+-----------+
6 rows in set (0.03 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE DeleteCustomer(IN cust_id INT)
    -> BEGIN
    ->     DELETE FROM cust
    ->     WHERE id = cust_id;
    -> 
    ->     SELECT 'Customer Deleted Successfully!' AS message;
    -> END //
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL DeleteCustomer(4);
+--------------------------------+
| message                        |
+--------------------------------+
| Customer Deleted Successfully! |
+--------------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM cust;
+----+--------+-----------+
| id | name   | city      |
+----+--------+-----------+
|  1 | Raju   | Hyderabad |
|  2 | Rajesh | Bengaluru |
|  3 | Ram    | Chennai   |
|  5 | Ravi   | Delhi     |
|  6 | Meena  | Vizag     |
+----+--------+-----------+
5 rows in set (0.00 sec)

mysql> notee;
