mysql> use mydb1;
Database changed
mysql> show tables;
+------------------------+
| Tables_in_mydb1        |
+------------------------+
| customers              |
| join_customers         |
| join_emp_manager       |
| join_employee_manager  |
| join_employees         |
| join_orders            |
| join_salary_grades     |
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
19 rows in set (0.02 sec)

mysql> CREATE TABLE emp (
    ->     eid INT,
    ->     ename VARCHAR(50),
    ->     salary INT,
    ->     dept VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO emp VALUES
    -> (1,'Raj',50000,'IT'),
    -> (2,'Bob',30000,'HR'),
    -> (3,'Alice',45000,'IT'),
    -> (4,'John',25000,'HR'),
    -> (5,'Ram',60000,'Finance'),
    -> (6,'Ravi',35000,'IT'),
    -> (7,'Priya',28000,'HR');
Query OK, 7 rows affected (0.04 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary = (
    ->     SELECT MAX(salary)
    ->     FROM emp
    ->     WHERE salary < (
    ->         SELECT MAX(salary)
    ->         FROM emp
    ->     )
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
+-------+--------+
1 row in set (0.02 sec)

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary > (
    ->     SELECT AVG(salary)
    ->     FROM emp
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
| Alice |  45000 |
| Ram   |  60000 |
+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT ename, dept
    -> FROM emp
    -> WHERE dept IN (
    ->     SELECT dept
    ->     FROM emp
    ->     WHERE ename = 'Bob'
    -> );
+-------+------+
| ename | dept |
+-------+------+
| Bob   | HR   |
| John  | HR   |
| Priya | HR   |
+-------+------+
3 rows in set (0.02 sec)

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary = ANY (
    ->     SELECT salary
    ->     FROM emp
    ->     WHERE dept = 'IT'
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
| Alice |  45000 |
| Ravi  |  35000 |
+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary > ANY (
    ->     SELECT salary
    ->     FROM emp
    ->     WHERE dept = 'HR'
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
| Bob   |  30000 |
| Alice |  45000 |
| Ram   |  60000 |
| Ravi  |  35000 |
| Priya |  28000 |
+-------+--------+
6 rows in set (0.00 sec)

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary > ALL (
    ->     SELECT salary
    ->     FROM emp
    ->     WHERE dept = 'HR'
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
| Alice |  45000 |
| Ram   |  60000 |
| Ravi  |  35000 |
+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT ename, salary
    -> FROM emp
    -> WHERE salary = (
    ->     SELECT MAX(salary)
    ->     FROM emp
    ->     WHERE salary < (
    ->         SELECT MAX(salary)
    ->         FROM emp
    ->     )
    -> );
+-------+--------+
| ename | salary |
+-------+--------+
| Raj   |  50000 |
+-------+--------+
1 row in set (0.00 sec)

mysql> SELECT e1.ename, e1.salary, e1.dept
    -> FROM emp e1
    -> WHERE e1.salary > (
    ->     SELECT AVG(e2.salary)
    ->     FROM emp e2
    ->     WHERE e2.dept = e1.dept
    -> );
+-------+--------+------+
| ename | salary | dept |
+-------+--------+------+
| Raj   |  50000 | IT   |
| Bob   |  30000 | HR   |
| Alice |  45000 | IT   |
| Priya |  28000 | HR   |
+-------+--------+------+
4 rows in set (0.00 sec)

mysql> notee;
mysql> exit;
