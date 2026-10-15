mysql> use mydb2;
Database changed
mysql> CREATE TABLE users (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE user_log (
    ->     log_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     user_id INT,
    ->     action VARCHAR(50),
    ->     log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> DELIMITER $$
mysql> CREATE TRIGGER after_user_insert
    -> AFTER INSERT ON users
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO user_log(user_id, action)
    ->     VALUES (NEW.id, 'User Added');
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER ;
mysql> INSERT INTO users (name) VALUES ('Ravi');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM users;
+----+------+
| id | name |
+----+------+
|  1 | Ravi |
+----+------+
1 row in set (0.00 sec)

mysql> SELECT * FROM user_log;
+--------+---------+------------+---------------------+
| log_id | user_id | action     | log_time            |
+--------+---------+------------+---------------------+
|      1 |       1 | User Added | 2026-10-16 00:08:18 |
+--------+---------+------------+---------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE employee_salary (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER before_employee_insert
    -> BEFORE INSERT ON employee_salary
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.salary < 5000 THEN
    ->         SET NEW.salary = 5000;
    ->     END IF;
    -> END $$
Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER ;
mysql> INSERT INTO employee_salary VALUES (1, 'Ravi', 3000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO employee_salary VALUES (2, 'Priya', 10000);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM employee_salary;
+----+-------+----------+
| id | name  | salary   |
+----+-------+----------+
|  1 | Ravi  |  5000.00 |
|  2 | Priya | 10000.00 |
+----+-------+----------+
2 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER before_salary_update
    -> BEFORE UPDATE ON employee_salary
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.salary < 5000 THEN
    ->         SET NEW.salary = 5000;
    ->     END IF;
    -> END $$
Query OK, 0 rows affected (0.05 sec)

mysql> DELIMITER ;
mysql> UPDATE employee_salary
    -> SET salary = 3000
    -> WHERE id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM employee_salary;
+----+-------+---------+
| id | name  | salary  |
+----+-------+---------+
|  1 | Ravi  | 5000.00 |
|  2 | Priya | 5000.00 |
+----+-------+---------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE salary_log (
    ->     log_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     emp_id INT,
    ->     old_salary DECIMAL(10,2),
    ->     new_salary DECIMAL(10,2),
    ->     changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_salary_update
    -> AFTER UPDATE ON employee_salary
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.salary <> OLD.salary THEN
    ->         INSERT INTO salary_log(emp_id, old_salary, new_salary)
    ->         VALUES (OLD.id, OLD.salary, NEW.salary);
    ->     END IF;
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER ;
mysql> UPDATE employee_salary
    -> SET salary = 12000
    -> WHERE id = 1;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> 
mysql> SELECT * FROM employee_salary;
+----+-------+----------+
| id | name  | salary   |
+----+-------+----------+
|  1 | Ravi  | 12000.00 |
|  2 | Priya |  5000.00 |
+----+-------+----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM salary_log;
+--------+--------+------------+------------+---------------------+
| log_id | emp_id | old_salary | new_salary | changed_at          |
+--------+--------+------------+------------+---------------------+
|      1 |      1 |    5000.00 |   12000.00 | 2026-10-16 00:10:28 |
+--------+--------+------------+------------+---------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> CREATE TABLE order_audit (
    ->     audit_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_id INT,
    ->     deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO orders VALUES
    -> (101, 'Ravi'),
    -> (102, 'Priya'),
    -> (103, 'Kiran');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_order_delete
    -> AFTER DELETE ON orders
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO order_audit(order_id)
    ->     VALUES (OLD.order_id);
    -> END $$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> DELETE FROM orders WHERE order_id = 101;
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM orders;
+----------+---------------+
| order_id | customer_name |
+----------+---------------+
|      102 | Priya         |
|      103 | Kiran         |
+----------+---------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM order_audit;
+----------+----------+---------------------+
| audit_id | order_id | deleted_at          |
+----------+----------+---------------------+
|        1 |      101 | 2026-10-16 00:11:45 |
+----------+----------+---------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE employee_protect (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO employee_protect VALUES
    -> (1, 'Manager'),
    -> (2, 'Ravi');
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER before_employee_delete
    -> BEFORE DELETE ON employee_protect
    -> FOR EACH ROW
    -> BEGIN
    ->     IF OLD.name = 'Manager' THEN
    ->         SIGNAL SQLSTATE '45000'
    ->         SET MESSAGE_TEXT = 'Manager record cannot be deleted!';
    ->     END IF;
    -> END $$
Query OK, 0 rows affected (0.04 sec)

mysql> DELIMITER ;
mysql> DELETE FROM employee_protect WHERE id = 1;
ERROR 1644 (45000): Manager record cannot be deleted!
mysql> DELETE FROM employee_protect WHERE id = 2;
Query OK, 1 row affected (0.03 sec)

mysql> DELETE FROM employee_protect WHERE id = 1;
ERROR 1644 (45000): Manager record cannot be deleted!
mysql> SELECT * FROM employee_protect;
+----+---------+
| id | name    |
+----+---------+
|  1 | Manager |
+----+---------+
1 row in set (0.00 sec)

mysql> SHOW TRIGGERS;
+------------------------+--------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                | Event  | Table            | Statement                                                                                                                                                                  | Timing | Created                | sql_mode                                                                                                              | Definer        | character_set_client | collation_connection | Database Collation |
+------------------------+--------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| before_employee_delete | DELETE | employee_protect | BEGIN
    IF OLD.name = 'Manager' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Manager record cannot be deleted!';
    END IF;
END                     | BEFORE | 2026-10-16 00:12:26.85 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| before_employee_insert | INSERT | employee_salary  | BEGIN
    IF NEW.salary < 5000 THEN
        SET NEW.salary = 5000;
    END IF;
END                                                                                         | BEFORE | 2026-10-16 00:08:51.10 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| before_salary_update   | UPDATE | employee_salary  | BEGIN
    IF NEW.salary < 5000 THEN
        SET NEW.salary = 5000;
    END IF;
END                                                                                         | BEFORE | 2026-10-16 00:09:35.84 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_salary_update    | UPDATE | employee_salary  | BEGIN
    IF NEW.salary <> OLD.salary THEN
        INSERT INTO salary_log(emp_id, old_salary, new_salary)
        VALUES (OLD.id, OLD.salary, NEW.salary);
    END IF;
END | AFTER  | 2026-10-16 00:10:14.64 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_order_delete     | DELETE | orders           | BEGIN
    INSERT INTO order_audit(order_id)
    VALUES (OLD.order_id);
END                                                                                                 | AFTER  | 2026-10-16 00:11:27.99 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_user_insert      | INSERT | users            | BEGIN
    INSERT INTO user_log(user_id, action)
    VALUES (NEW.id, 'User Added');
END                                                                                     | AFTER  | 2026-10-16 00:08:02.44 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------------------------+--------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
6 rows in set (0.03 sec)

mysql> SHOW CREATE TRIGGER after_user_insert;
+-------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+------------------------+
| Trigger           | sql_mode                                                                                                              | SQL Original Statement                                                                                                                                                                    | character_set_client | collation_connection | Database Collation | Created                |
+-------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+------------------------+
| after_user_insert | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | CREATE DEFINER=`root`@`localhost` TRIGGER `after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO user_log(user_id, action)
    VALUES (NEW.id, 'User Added');
END | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci | 2026-10-16 00:08:02.44 |
+-------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+------------------------+
1 row in set (0.00 sec)

mysql> SELECT TRIGGER_NAME
    -> FROM information_schema.TRIGGERS
    -> WHERE TRIGGER_SCHEMA = DATABASE();
+------------------------+
| TRIGGER_NAME           |
+------------------------+
| after_user_insert      |
| before_employee_insert |
| before_salary_update   |
| after_salary_update    |
| after_order_delete     |
| before_employee_delete |
+------------------------+
6 rows in set (0.01 sec)

mysql> SELECT TRIGGER_NAME
    -> FROM information_schema.TRIGGERS
    -> WHERE TRIGGER_SCHEMA = DATABASE();
+------------------------+
| TRIGGER_NAME           |
+------------------------+
| after_user_insert      |
| before_employee_insert |
| before_salary_update   |
| after_salary_update    |
| after_order_delete     |
| before_employee_delete |
+------------------------+
6 rows in set (0.00 sec)

mysql> SELECT COUNT(*) AS total_triggers
    -> FROM information_schema.TRIGGERS
    -> WHERE TRIGGER_SCHEMA = DATABASE();
+----------------+
| total_triggers |
+----------------+
|              6 |
+----------------+
1 row in set (0.02 sec)

mysql> SELECT TRIGGER_NAME, EVENT_MANIPULATION
    -> FROM information_schema.TRIGGERS
    -> WHERE TRIGGER_SCHEMA = DATABASE();
+------------------------+--------------------+
| TRIGGER_NAME           | EVENT_MANIPULATION |
+------------------------+--------------------+
| after_user_insert      | INSERT             |
| before_employee_insert | INSERT             |
| before_salary_update   | UPDATE             |
| after_salary_update    | UPDATE             |
| after_order_delete     | DELETE             |
| before_employee_delete | DELETE             |
+------------------------+--------------------+
6 rows in set (0.00 sec)

mysql> SELECT TRIGGER_NAME, ACTION_TIMING
    -> FROM information_schema.TRIGGERS
    -> WHERE TRIGGER_SCHEMA = DATABASE();
+------------------------+---------------+
| TRIGGER_NAME           | ACTION_TIMING |
+------------------------+---------------+
| after_user_insert      | AFTER         |
| before_employee_insert | BEFORE        |
| before_salary_update   | BEFORE        |
| after_salary_update    | AFTER         |
| after_order_delete     | AFTER         |
| before_employee_delete | BEFORE        |
+------------------------+---------------+
6 rows in set (0.00 sec)

mysql> SHOW TRIGGERS LIKE 'employee_salary';
+------------------------+--------+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                | Event  | Table           | Statement                                                                                                                                                                  | Timing | Created                | sql_mode                                                                                                              | Definer        | character_set_client | collation_connection | Database Collation |
+------------------------+--------+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| before_employee_insert | INSERT | employee_salary | BEGIN
    IF NEW.salary < 5000 THEN
        SET NEW.salary = 5000;
    END IF;
END                                                                                         | BEFORE | 2026-10-16 00:08:51.10 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| before_salary_update   | UPDATE | employee_salary | BEGIN
    IF NEW.salary < 5000 THEN
        SET NEW.salary = 5000;
    END IF;
END                                                                                         | BEFORE | 2026-10-16 00:09:35.84 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| after_salary_update    | UPDATE | employee_salary | BEGIN
    IF NEW.salary <> OLD.salary THEN
        INSERT INTO salary_log(emp_id, old_salary, new_salary)
        VALUES (OLD.id, OLD.salary, NEW.salary);
    END IF;
END | AFTER  | 2026-10-16 00:10:14.64 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------------------------+--------+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------+----------------------+----------------------+--------------------+
3 rows in set (0.02 sec)

mysql> notee;
