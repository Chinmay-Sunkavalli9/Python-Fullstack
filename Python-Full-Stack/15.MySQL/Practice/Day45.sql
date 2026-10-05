mysql> use mydb1;
Database changed

mysql> select * from join_customers;
+-----+-------+--------+
| cid | cname | city   |
+-----+-------+--------+
|   1 | John  | London |
|   2 | Alice | Paris  |
|   3 | Raj   | Delhi  |
|   4 | Sara  | Mumbai |
+-----+-------+--------+
4 rows in set (0.00 sec)

mysql> show tables;
+------------------------+
| Tables_in_mydb1        |
+------------------------+
| customers              |
| join_customers         |
| join_employee_manager  |
| join_employees         |
| join_orders            |
| join_students          |
| join_subjects          |
| norm_branch            |
| norm_student_languages |
| norm_students          |
| salary_grades          |
| sales                  |
| student                |
| student_1nf            |
| student_data           |
| students               |
| suppliers              |
+------------------------+
17 rows in set (0.01 sec)

mysql> select * from join_orders;
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

mysql> SELECT c.cname, o.oid, o.amount
    -> FROM join_customers c
    -> LEFT JOIN join_orders o
    -> ON c.cid = o.cid;
+-------+------+--------+
| cname | oid  | amount |
+-------+------+--------+
| John  |  103 |    250 |
| John  |  101 |    200 |
| Alice |  102 |    300 |
| Raj   |  104 |    500 |
| Sara  | NULL |   NULL |
+-------+------+--------+
5 rows in set (0.00 sec)

mysql> SELECT c.cname, SUM(o.amount) AS total_amount
    -> FROM join_customers c
    -> LEFT JOIN join_orders o
    -> ON c.cid = o.cid
    -> GROUP BY c.cname;
+-------+--------------+
| cname | total_amount |
+-------+--------------+
| John  |          450 |
| Alice |          300 |
| Raj   |          500 |
| Sara  |         NULL |
+-------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT c.cname, o.oid, o.amount
    -> FROM join_customers c
    -> RIGHT JOIN join_orders o
    -> ON c.cid = o.cid;
+-------+-----+--------+
| cname | oid | amount |
+-------+-----+--------+
| John  | 101 |    200 |
| Alice | 102 |    300 |
| John  | 103 |    250 |
| Raj   | 104 |    500 |
| NULL  | 105 |    400 |
+-------+-----+--------+
5 rows in set (0.00 sec)

mysql> SELECT c.cname, o.oid, o.amount
    -> FROM join_customers c
    -> LEFT JOIN join_orders o
    -> ON c.cid = o.cid
    -> 
    -> UNION
    -> 
    -> SELECT c.cname, o.oid, o.amount
    -> FROM join_customers c
    -> RIGHT JOIN join_orders o
    -> ON c.cid = o.cid;
+-------+------+--------+
| cname | oid  | amount |
+-------+------+--------+
| John  |  103 |    250 |
| John  |  101 |    200 |
| Alice |  102 |    300 |
| Raj   |  104 |    500 |
| Sara  | NULL |   NULL |
| NULL  |  105 |    400 |
+-------+------+--------+
6 rows in set (0.00 sec)

mysql> CREATE TABLE join_salary_grades (
    ->     grade CHAR(1),
    ->     min_sal INT,
    ->     max_sal INT
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> INSERT INTO join_salary_grades VALUES
    -> ('A',0,10000),
    -> ('B',10001,20000),
    -> ('C',20001,40000);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT e.emp_name, e.salary, g.grade
    -> FROM join_employees e
    -> JOIN join_salary_grades g
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

mysql> SELECT e.emp_name, e.salary
    -> FROM join_employees e
    -> JOIN join_salary_grades g
    -> ON e.salary BETWEEN g.min_sal AND g.max_sal
    -> WHERE g.grade = 'B';
+----------+--------+
| emp_name | salary |
+----------+--------+
| Alice    |  12000 |
| Bob      |  20000 |
+----------+--------+
2 rows in set (0.00 sec)

mysql> SELECT e.emp_name, e.salary
    -> FROM join_employees e
    -> JOIN join_salary_grades g
    -> ON e.salary < g.min_sal
    -> WHERE g.grade = 'B';
+----------+--------+
| emp_name | salary |
+----------+--------+
| John     |   5000 |
+----------+--------+
1 row in set (0.00 sec)

mysql> CREATE TABLE join_emp_manager (
    ->     eid INT,
    ->     ename VARCHAR(50),
    ->     mid INT
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO join_emp_manager VALUES
    -> (1,'Rajesh',NULL),
    -> (2,'Harish',1),
    -> (3,'Ramya',2),
    -> (4,'Karim',1),
    -> (5,'Kavya',3);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT e.ename AS empname,
    ->        m.ename AS mname
    -> FROM join_emp_manager e
    -> LEFT JOIN join_emp_manager m
    -> ON e.mid = m.eid;
+---------+--------+
| empname | mname  |
+---------+--------+
| Rajesh  | NULL   |
| Harish  | Rajesh |
| Ramya   | Harish |
| Karim   | Rajesh |
| Kavya   | Ramya  |
+---------+--------+
5 rows in set (0.00 sec)

mysql> SELECT e.ename AS empname
    -> FROM join_emp_manager e
    -> JOIN join_emp_manager m
    -> ON e.mid = m.eid
    -> WHERE m.ename = 'Rajesh';
+---------+
| empname |
+---------+
| Harish  |
| Karim   |
+---------+
2 rows in set (0.00 sec)

mysql> SELECT e.ename
    -> FROM join_emp_manager e
    -> LEFT JOIN join_emp_manager m
    -> ON e.mid = m.eid
    -> WHERE e.mid IS NULL;
+--------+
| ename  |
+--------+
| Rajesh |
+--------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT m.ename AS manager
    -> FROM join_emp_manager e
    -> JOIN join_emp_manager m
    -> ON e.mid = m.eid;
+---------+
| manager |
+---------+
| Rajesh  |
| Harish  |
| Ramya   |
+---------+
3 rows in set (0.00 sec)

mysql> notee;
