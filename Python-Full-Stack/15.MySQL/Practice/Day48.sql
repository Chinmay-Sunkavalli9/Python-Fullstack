mysql> use mydb1;
Database changed
mysql> CREATE TABLE accounts (
    ->     acc_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     balance INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO accounts VALUES
    -> (101, 'Ram', 5000),
    -> (102, 'Raj', 3000);
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    5000 |
|    102 | Raj  |    3000 |
+--------+------+---------+
2 rows in set (0.01 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> BEGIN;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance - 1000
    -> WHERE acc_id = 101;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE accounts
    -> SET balance = balance + 1000
    -> WHERE acc_id = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    4000 |
|    102 | Raj  |    4000 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    4000 |
|    102 | Raj  |    4000 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance - 500
    -> WHERE acc_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    3500 |
|    102 | Raj  |    4000 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    4000 |
|    102 | Raj  |    4000 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance - 500
    -> WHERE acc_id = 101;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT step1;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance + 500
    -> WHERE acc_id = 102;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT step2;
Query OK, 0 rows affected (0.00 sec)

mysql> ROLLBACK TO step1;
ERROR 1305 (42000): SAVEPOINT step1 does not exist
mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    3500 |
|    102 | Raj  |    4500 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance - 500
    -> WHERE acc_id = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT step1;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE accounts
    -> SET balance = balance + 500
    -> WHERE acc_id = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SAVEPOINT step2;
Query OK, 0 rows affected (0.00 sec)

mysql> ROLLBACK TO step1;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM accounts;
+--------+------+---------+
| acc_id | name | balance |
+--------+------+---------+
|    101 | Ram  |    3000 |
|    102 | Raj  |    4500 |
+--------+------+---------+
2 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.03 sec)

mysql> notee;
