mysql> use mydb1;
Database changed
mysql> CREATE TABLE Person (
    ->     person_id INT PRIMARY KEY,
    ->     name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Passport (
    ->     passport_id INT PRIMARY KEY,
    ->     issue_date DATE,
    ->     person_id INT UNIQUE,
    ->     FOREIGN KEY (person_id)
    ->     REFERENCES Person(person_id)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> CREATE TABLE Department (
    ->     dept_id INT PRIMARY KEY,
    ->     dept_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Employee (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     dept_id INT,
    ->     FOREIGN KEY (dept_id)
    ->     REFERENCES Department(dept_id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> Terminal close -- exit!
