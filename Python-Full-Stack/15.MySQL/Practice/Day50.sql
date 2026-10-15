mysql> use mydb1;
Database changed
mysql> CREATE TABLE Employeeco (
    ->     eid INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     address VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE Deptco (
    ->     did INT PRIMARY KEY,
    ->     dname VARCHAR(50),
    ->     eid INT,
    ->     FOREIGN KEY (eid) REFERENCES Employeeco(eid)
    -> );
ERROR 1050 (42S01): Table 'deptco' already exists
mysql> select * from Deptco;
+-----+---------+------+
| did | dname   | eid  |
+-----+---------+------+
| 101 | HR      |    1 |
| 102 | Finance |    2 |
| 103 | IT      |    3 |
+-----+---------+------+
3 rows in set (0.02 sec)

mysql> SELECT e.name
    -> FROM Employeeco e
    -> WHERE EXISTS (
    ->     SELECT 1
    ->     FROM Deptco d
    ->     WHERE d.eid = e.eid
    -> );
Empty set (0.02 sec)

mysql> select * from Employeeco;
Empty set (0.00 sec)

mysql> select * from Employco;
+-----+-------+---------+
| eid | name  | address |
+-----+-------+---------+
|   1 | John  | London  |
|   2 | Alice | Paris   |
|   3 | Raj   | Delhi   |
|   4 | Nani  | UK      |
+-----+-------+---------+
4 rows in set (0.03 sec)

mysql> select * from Deptco;
+-----+---------+------+
| did | dname   | eid  |
+-----+---------+------+
| 101 | HR      |    1 |
| 102 | Finance |    2 |
| 103 | IT      |    3 |
+-----+---------+------+
3 rows in set (0.00 sec)

mysql> SELECT e.name
    -> FROM Employeeco e
    -> WHERE EXISTS (
    ->     SELECT 1
    ->     FROM Deptco d
    ->     WHERE d.eid = e.eid
    -> );
Empty set (0.00 sec)

mysql> select * from Employco;
+-----+-------+---------+
| eid | name  | address |
+-----+-------+---------+
|   1 | John  | London  |
|   2 | Alice | Paris   |
|   3 | Raj   | Delhi   |
|   4 | Nani  | UK      |
+-----+-------+---------+
4 rows in set (0.00 sec)

mysql> select * from Deptco;
+-----+---------+------+
| did | dname   | eid  |
+-----+---------+------+
| 101 | HR      |    1 |
| 102 | Finance |    2 |
| 103 | IT      |    3 |
+-----+---------+------+
3 rows in set (0.00 sec)

mysql> SELECT e.name
    -> FROM Employco e
    -> WHERE EXISTS (
    ->     SELECT 1
    ->     FROM Deptco d
    ->     WHERE d.eid = e.eid
    -> );
+-------+
| name  |
+-------+
| John  |
| Alice |
| Raj   |
+-------+
3 rows in set (0.00 sec)

mysql> SELECT e.name
    -> FROM Employco e
    -> WHERE NOT EXISTS (
    ->     SELECT 1
    ->     FROM Deptco d
    ->     WHERE d.eid = e.eid
    -> );
+------+
| name |
+------+
| Nani |
+------+
1 row in set (0.00 sec)

mysql> CREATE TABLE Employees1 (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     salary INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO Employees1 VALUES
    -> (1, 'John', 5000),
    -> (2, 'Alice', 12000),
    -> (3, 'Bob', 20000),
    -> (4, 'Raj', 15000);
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Employees1;
+--------+----------+--------+
| emp_id | emp_name | salary |
+--------+----------+--------+
|      1 | John     |   5000 |
|      2 | Alice    |  12000 |
|      3 | Bob      |  20000 |
|      4 | Raj      |  15000 |
+--------+----------+--------+
4 rows in set (0.00 sec)

mysql> SELECT e1.emp_name, e1.salary
    -> FROM Employees1 e1
    -> WHERE e1.salary > (
    ->     SELECT MIN(e2.salary)
    ->     FROM Employees1 e2
    ->     WHERE e2.emp_id <> e1.emp_id
    -> );
+----------+--------+
| emp_name | salary |
+----------+--------+
| Alice    |  12000 |
| Bob      |  20000 |
| Raj      |  15000 |
+----------+--------+
3 rows in set (0.02 sec)

mysql> SELECT *
    -> FROM Employees1 e1
    -> WHERE e1.salary > ALL (
    ->     SELECT e2.salary
    ->     FROM Employees1 e2
    ->     WHERE e2.emp_id <> e1.emp_id
    -> );
+--------+----------+--------+
| emp_id | emp_name | salary |
+--------+----------+--------+
|      3 | Bob      |  20000 |
+--------+----------+--------+
1 row in set (0.02 sec)

mysql> SELECT *
    -> FROM Employees1 e1
    -> WHERE e1.salary < ALL (
    ->     SELECT e2.salary
    ->     FROM Employees1 e2
    ->     WHERE e2.emp_id <> e1.emp_id
    -> );
+--------+----------+--------+
| emp_id | emp_name | salary |
+--------+----------+--------+
|      1 | John     |   5000 |
+--------+----------+--------+
1 row in set (0.00 sec)

mysql> SELECT e1.emp_name, e1.salary
    -> FROM Employees1 e1
    -> WHERE e1.salary < (
    ->     SELECT MAX(e2.salary)
    ->     FROM Employees1 e2
    ->     WHERE e2.emp_id <> e1.emp_id
    -> );
+----------+--------+
| emp_name | salary |
+----------+--------+
| John     |   5000 |
| Alice    |  12000 |
| Raj      |  15000 |
+----------+--------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Employees1 e1
    -> WHERE e1.salary > (
    ->     SELECT AVG(e2.salary)
    ->     FROM Employees1 e2
    ->     WHERE e2.emp_id > e1.emp_id
    -> );
+--------+----------+--------+
| emp_id | emp_name | salary |
+--------+----------+--------+
|      3 | Bob      |  20000 |
+--------+----------+--------+
1 row in set (0.01 sec)

mysql> notee;
