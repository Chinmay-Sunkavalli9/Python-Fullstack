mysql> use mydb1;
Database changed
mysql> SELECT ASCII('A');
+------------+
| ASCII('A') |
+------------+
|         65 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT LOCATE('SQL','MySQL Database');
+--------------------------------+
| LOCATE('SQL','MySQL Database') |
+--------------------------------+
|                              3 |
+--------------------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('My','SQL');
+--------------------+
| CONCAT('My','SQL') |
+--------------------+
| MySQL              |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT_WS('-', '2025','08','27');
+----------------------------------+
| CONCAT_WS('-', '2025','08','27') |
+----------------------------------+
| 2025-08-27                       |
+----------------------------------+
1 row in set (0.00 sec)

mysql> SELECT LENGTH('Hello');
+-----------------+
| LENGTH('Hello') |
+-----------------+
|               5 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT CHAR_LENGTH('My SQL');
+-----------------------+
| CHAR_LENGTH('My SQL') |
+-----------------------+
|                     6 |
+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT FORMAT(12345.6789,2);
+----------------------+
| FORMAT(12345.6789,2) |
+----------------------+
| 12,345.68            |
+----------------------+
1 row in set (0.00 sec)

mysql> SELECT LEFT('Database',4);
+--------------------+
| LEFT('Database',4) |
+--------------------+
| Data               |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT LOWER('MySQL');
+----------------+
| LOWER('MySQL') |
+----------------+
| mysql          |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT LTRIM(' SQL');
+---------------+
| LTRIM(' SQL') |
+---------------+
| SQL           |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT REPLACE('I like Java','Java','SQL');
+-------------------------------------+
| REPLACE('I like Java','Java','SQL') |
+-------------------------------------+
| I like SQL                          |
+-------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT REPEAT('SQL',3);
+-----------------+
| REPEAT('SQL',3) |
+-----------------+
| SQLSQLSQL       |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT REVERSE('MySQL');
+------------------+
| REVERSE('MySQL') |
+------------------+
| LQSyM            |
+------------------+
1 row in set (0.00 sec)

mysql> SELECT RIGHT('Database',4);
+---------------------+
| RIGHT('Database',4) |
+---------------------+
| base                |
+---------------------+
1 row in set (0.00 sec)

mysql> SELECT RTRIM('SQL ');
+---------------+
| RTRIM('SQL ') |
+---------------+
| SQL           |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('My', SPACE(3), 'SQL');
+-------------------------------+
| CONCAT('My', SPACE(3), 'SQL') |
+-------------------------------+
| My   SQL                      |
+-------------------------------+
1 row in set (0.00 sec)

mysql> SELECT INSERT('Database',2,3,'XX');
+-----------------------------+
| INSERT('Database',2,3,'XX') |
+-----------------------------+
| DXXbase                     |
+-----------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('Database',1,4);
+---------------------------+
| SUBSTRING('Database',1,4) |
+---------------------------+
| Data                      |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT ORD('A');
+----------+
| ORD('A') |
+----------+
|       65 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT UPPER('mysql');
+----------------+
| UPPER('mysql') |
+----------------+
| MYSQL          |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| mydb1      |
+------------+
1 row in set (0.00 sec)

mysql> SELECT USER();
+----------------+
| USER()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 8.4.7     |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT LOWER('CodeGNAN');
+-------------------+
| LOWER('CodeGNAN') |
+-------------------+
| codegnan          |
+-------------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT UPPER('CodeGNAN');
+-------------------+
| UPPER('CodeGNAN') |
+-------------------+
| CODEGNAN          |
+-------------------+
1 row in set (0.00 sec)

mysql> SELECT LENGTH('codegnan');
+--------------------+
| LENGTH('codegnan') |
+--------------------+
|                  8 |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT('raju',' ','ramya');
+----------------------------+
| CONCAT('raju',' ','ramya') |
+----------------------------+
| raju ramya                 |
+----------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('codegnan',2,5);
+---------------------------+
| SUBSTRING('codegnan',2,5) |
+---------------------------+
| odegn                     |
+---------------------------+
1 row in set (0.00 sec)

mysql> SELECT REPLACE('i love mysql','mysql','sql');
+---------------------------------------+
| REPLACE('i love mysql','mysql','sql') |
+---------------------------------------+
| i love sql                            |
+---------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT FORMAT('12000.676',2);
+-----------------------+
| FORMAT('12000.676',2) |
+-----------------------+
| 12,000.68             |
+-----------------------+
1 row in set (0.00 sec)

mysql> notee;
