mysql> use mydb1;
Database changed
mysql> CREATE TABLE employco (
    ->     eid INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     address VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO employco VALUES
    -> (1, 'John', 'London'),
    -> (2, 'Alice', 'Paris'),
    -> (3, 'Raj', 'Delhi'),
    -> (4, 'Nani', 'UK');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE deptco (
    ->     did INT PRIMARY KEY,
    ->     dname VARCHAR(50),
    ->     eid INT,
    ->     FOREIGN KEY (eid) REFERENCES employco(eid)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO deptco VALUES
    -> (101, 'HR', 1),
    -> (102, 'Finance', 2),
    -> (103, 'IT', 3);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW emp_basic_info AS
    -> SELECT eid, name
    -> FROM employco;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM emp_basic_info;
+-----+-------+
| eid | name  |
+-----+-------+
|   1 | John  |
|   2 | Alice |
|   3 | Raj   |
|   4 | Nani  |
+-----+-------+
4 rows in set (0.02 sec)

mysql> ALTER VIEW emp_basic_info AS
    -> SELECT eid, name, address
    -> FROM employco;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM emp_basic_info;
+-----+-------+---------+
| eid | name  | address |
+-----+-------+---------+
|   1 | John  | London  |
|   2 | Alice | Paris   |
|   3 | Raj   | Delhi   |
|   4 | Nani  | UK      |
+-----+-------+---------+
4 rows in set (0.00 sec)

mysql> CREATE VIEW emp_dept_info AS
    -> SELECT e.name, d.dname
    -> FROM employco e
    -> JOIN deptco d
    -> ON e.eid = d.eid;
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT * FROM emp_dept_info;
+-------+---------+
| name  | dname   |
+-------+---------+
| John  | HR      |
| Alice | Finance |
| Raj   | IT      |
+-------+---------+
3 rows in set (0.00 sec)

mysql> DROP VIEW emp_basic_info;
Query OK, 0 rows affected (0.04 sec)

mysql> SHOW FULL TABLES
    -> WHERE Table_type = 'VIEW';
+-----------------+------------+
| Tables_in_mydb1 | Table_type |
+-----------------+------------+
| emp_dept_info   | VIEW       |
+-----------------+------------+
1 row in set (0.01 sec)

mysql> CREATE TABLE student8 (
    ->     sid INT PRIMARY KEY,
    ->     sname VARCHAR(50),
    ->     course VARCHAR(50),
    ->     phone VARCHAR(15),
    ->     marks INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO student8 VALUES
    -> (1, 'John', 'Maths', '9876543210', 85),
    -> (2, 'Alice', 'Science', '9998887776', 90),
    -> (3, 'Raj', 'English', '8887776665', 78),
    -> (4, 'Jani', 'Maths', '7776665554', 92),
    -> (5, 'Sara', 'Science', '6665554443', 70);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW student_basic AS
    -> SELECT sid, sname
    -> FROM student8;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM student_basic;
+-----+-------+
| sid | sname |
+-----+-------+
|   1 | John  |
|   2 | Alice |
|   3 | Raj   |
|   4 | Jani  |
|   5 | Sara  |
+-----+-------+
5 rows in set (0.00 sec)

mysql> CREATE VIEW maths_students AS
    -> SELECT sname, marks
    -> FROM student8
    -> WHERE course = 'Maths';
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM maths_students;
+-------+-------+
| sname | marks |
+-------+-------+
| John  |    85 |
| Jani  |    92 |
+-------+-------+
2 rows in set (0.00 sec)

mysql> CREATE VIEW high_scorers AS
    -> SELECT sid, sname, marks
    -> FROM student8
    -> WHERE marks > 80;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM high_scorers;
+-----+-------+-------+
| sid | sname | marks |
+-----+-------+-------+
|   1 | John  |    85 |
|   2 | Alice |    90 |
|   4 | Jani  |    92 |
+-----+-------+-------+
3 rows in set (0.00 sec)

mysql> CREATE VIEW science_students AS
    -> SELECT sname, marks
    -> FROM student8
    -> WHERE course = 'Science';
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM science_students;
+-------+-------+
| sname | marks |
+-------+-------+
| Alice |    90 |
| Sara  |    70 |
+-------+-------+
2 rows in set (0.00 sec)

mysql> ALTER VIEW student_basic AS
    -> SELECT sid, sname, phone
    -> FROM student8;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM student_basic;
+-----+-------+------------+
| sid | sname | phone      |
+-----+-------+------------+
|   1 | John  | 9876543210 |
|   2 | Alice | 9998887776 |
|   3 | Raj   | 8887776665 |
|   4 | Jani  | 7776665554 |
|   5 | Sara  | 6665554443 |
+-----+-------+------------+
5 rows in set (0.00 sec)

mysql> DROP VIEW maths_students;
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT ON student_public TO 'faculty'@'localhost';
ERROR 1146 (42S02): Table 'mydb1.student_public' doesn't exist
mysql> CREATE VIEW student_public AS
    -> SELECT sid, sname, course, marks
    -> FROM student8;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT * FROM student_public;
+-----+-------+---------+-------+
| sid | sname | course  | marks |
+-----+-------+---------+-------+
|   1 | John  | Maths   |    85 |
|   2 | Alice | Science |    90 |
|   3 | Raj   | English |    78 |
|   4 | Jani  | Maths   |    92 |
|   5 | Sara  | Science |    70 |
+-----+-------+---------+-------+
5 rows in set (0.00 sec)

mysql> GRANT SELECT ON student_public TO 'faculty'@'localhost';
ERROR 1410 (42000): You are not allowed to create a user with GRANT
mysql> SELECT User, Host
    -> FROM mysql.user
    -> WHERE User = 'faculty';
Empty set (0.00 sec)

mysql> CREATE USER 'faculty'@'localhost'
    -> IDENTIFIED BY 'faculty123';
Query OK, 0 rows affected (0.03 sec)

mysql> GRANT SELECT
    -> ON student_public
    -> TO 'faculty'@'localhost';
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW GRANTS FOR 'faculty'@'localhost';
+-------------------------------------------------------------------+
| Grants for faculty@localhost                                      |
+-------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `faculty`@`localhost`                       |
| GRANT SELECT ON `mydb1`.`student_public` TO `faculty`@`localhost` |
+-------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> REVOKE SELECT
    -> ON student_public
    -> FROM 'faculty'@'localhost';
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW GRANTS FOR 'faculty'@'localhost';
+---------------------------------------------+
| Grants for faculty@localhost                |
+---------------------------------------------+
| GRANT USAGE ON *.* TO `faculty`@`localhost` |
+---------------------------------------------+
1 row in set (0.00 sec)

mysql> notee;
