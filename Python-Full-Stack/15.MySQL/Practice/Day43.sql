mysql> use mydb1;
Database changed
mysql> CREATE TABLE student_data (
    ->     roll_no INT,
    ->     sname VARCHAR(50),
    ->     branch VARCHAR(20),
    ->     languages VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO student_data VALUES
    -> (101, 'Alice', 'CSE', 'Java, Python'),
    -> (102, 'Bob', 'ECE', 'C, C++'),
    -> (103, 'Charlie', 'CSE', 'Java, C, Python'),
    -> (104, 'David', 'MECH', 'C++');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student_data;
+---------+---------+--------+-----------------+
| roll_no | sname   | branch | languages       |
+---------+---------+--------+-----------------+
|     101 | Alice   | CSE    | Java, Python    |
|     102 | Bob     | ECE    | C, C++          |
|     103 | Charlie | CSE    | Java, C, Python |
|     104 | David   | MECH   | C++             |
+---------+---------+--------+-----------------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE student_1nf (
    ->     roll_no INT,
    ->     sname VARCHAR(50),
    ->     branch VARCHAR(20),
    ->     language VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO student_1nf VALUES
    -> (101, 'Alice', 'CSE', 'Java'),
    -> (101, 'Alice', 'CSE', 'Python'),
    -> (102, 'Bob', 'ECE', 'C'),
    -> (102, 'Bob', 'ECE', 'C++'),
    -> (103, 'Charlie', 'CSE', 'Java'),
    -> (103, 'Charlie', 'CSE', 'C'),
    -> (103, 'Charlie', 'CSE', 'Python'),
    -> (104, 'David', 'MECH', 'C++');
Query OK, 8 rows affected (0.03 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student_1nf;
+---------+---------+--------+----------+
| roll_no | sname   | branch | language |
+---------+---------+--------+----------+
|     101 | Alice   | CSE    | Java     |
|     101 | Alice   | CSE    | Python   |
|     102 | Bob     | ECE    | C        |
|     102 | Bob     | ECE    | C++      |
|     103 | Charlie | CSE    | Java     |
|     103 | Charlie | CSE    | C        |
|     103 | Charlie | CSE    | Python   |
|     104 | David   | MECH   | C++      |
+---------+---------+--------+----------+
8 rows in set (0.00 sec)

mysql> CREATE TABLE students (
    ->     roll_no INT PRIMARY KEY,
    ->     sname VARCHAR(50),
    ->     branch VARCHAR(20)
    -> );
ERROR 1050 (42S01): Table 'students' already exists
mysql> CREATE TABLE norm_students (
    ->     roll_no INT PRIMARY KEY,
    ->     sname VARCHAR(50),
    ->     branch VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO norm_students VALUES
    -> (101, 'Alice', 'CSE'),
    -> (102, 'Bob', 'ECE'),
    -> (103, 'Charlie', 'CSE'),
    -> (104, 'David', 'MECH');
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM norm_students;
+---------+---------+--------+
| roll_no | sname   | branch |
+---------+---------+--------+
|     101 | Alice   | CSE    |
|     102 | Bob     | ECE    |
|     103 | Charlie | CSE    |
|     104 | David   | MECH   |
+---------+---------+--------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE norm_student_languages (
    ->     roll_no INT,
    ->     language VARCHAR(30),
    ->     PRIMARY KEY (roll_no, language)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO norm_student_languages VALUES
    -> (101, 'Java'),
    -> (101, 'Python'),
    -> (102, 'C'),
    -> (102, 'C++'),
    -> (103, 'Java'),
    -> (103, 'C'),
    -> (103, 'Python'),
    -> (104, 'C++');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM norm_student_languages;
+---------+----------+
| roll_no | language |
+---------+----------+
|     101 | Java     |
|     101 | Python   |
|     102 | C        |
|     102 | C++      |
|     103 | C        |
|     103 | Java     |
|     103 | Python   |
|     104 | C++      |
+---------+----------+
8 rows in set (0.00 sec)

mysql> CREATE TABLE norm_branch (
    ->     branch VARCHAR(20) PRIMARY KEY,
    ->     hod_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO norm_branch VALUES
    -> ('CSE', 'Dr. Rao'),
    -> ('ECE', 'Dr. Mehta'),
    -> ('MECH', 'Dr. Roy');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM norm_branch;
+--------+-----------+
| branch | hod_name  |
+--------+-----------+
| CSE    | Dr. Rao   |
| ECE    | Dr. Mehta |
| MECH   | Dr. Roy   |
+--------+-----------+
3 rows in set (0.00 sec)

mysql> notee;
