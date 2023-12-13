
-- UC-1
-- Create Address Book Service Database

mysql> Create Database AddressBookServiceDB;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW Databases
    -> ;
+----------------------+
| Database             |
+----------------------+
| addressbookservicedb |
| aluminidb            |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sys                  |
+----------------------+
7 rows in set (0.00 sec)

mysql> USE AddressBookServiceDB;
Database changed


-- UC-2
-- Create a table

mysql> Create table AddressBook(
    -> firstName Varchar(30) NOT NULL,
    -> lastName Varchar(30) NOT NULL,
    -> address Varchar(100) NOT NULL,
    -> city Varchar(50) NOT NULL,
    -> state Varchar(50) NOT NULL,
    -> phoneNumber Varchar(20) NOT NULL,
    -> email Varchar(50) NOT NULL);
Query OK, 0 rows affected (0.03 sec)

mysql> Describe AddressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(30)  | NO   |     | NULL    |       |
| lastName    | varchar(30)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| phoneNumber | varchar(20)  | NO   |     | NULL    |       |
| email       | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)


-- UC-3
-- Insert data into AddressBook

mysql> Insert into AddressBook (firstName,lastName,address,city,state,phoneNumber,email) Values
    -> ("Harsh","Rastogi","Mawana","Meerut","Uttar Pradesh","7455878221", "harsh@gmail.com");
Query OK, 1 row affected (0.01 sec)

mysql>  Insert into AddressBook (firstName,lastName,address,city,state,phoneNumber,email) Values
    -> ("Pranav","Kumar","Kira","Bijnor","Uttar Pradesh","7246778243", "pranav@gmail.com"),
    -> ("Chandan","Kumar","Kalibag","Patna","Bihar","3454561234", "ch.kumar@outlook.com");
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> Select * From AddressBook
    -> ;
+-----------+----------+---------+--------+---------------+-------------+----------------------+
| firstName | lastName | address | city   | state         | phoneNumber | email                |
+-----------+----------+---------+--------+---------------+-------------+----------------------+
| Harsh     | Rastogi  | Mawana  | Meerut | Uttar Pradesh | 7455878221  | harsh@gmail.com      |
| Pranav    | Kumar    | Kira    | Bijnor | Uttar Pradesh | 7246778243  | pranav@gmail.com     |
| Chandan   | Kumar    | Kalibag | Patna  | Bihar         | 3454561234  | ch.kumar@outlook.com |
+-----------+----------+---------+--------+---------------+-------------+----------------------+
3 rows in set (0.00 sec)

-- UC-4
-- Update table using first name

mysql> Update AddressBook
    -> Set phoneNumber='6325417852'
    -> Where firstName = 'Pranav';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> Select * From AddressBook;
+-----------+----------+---------+--------+---------------+-------------+----------------------+
| firstName | lastName | address | city   | state         | phoneNumber | email                |
+-----------+----------+---------+--------+---------------+-------------+----------------------+
| Harsh     | Rastogi  | Mawana  | Meerut | Uttar Pradesh | 7455878221  | harsh@gmail.com      |
| Pranav    | Kumar    | Kira    | Bijnor | Uttar Pradesh | 6325417852  | pranav@gmail.com     |
| Chandan   | Kumar    | Kalibag | Patna  | Bihar         | 3454561234  | ch.kumar@outlook.com |
+-----------+----------+---------+--------+---------------+-------------+----------------------+
3 rows in set (0.00 sec)

-- UC-5
-- Delete using name;

mysql> Delete from AddressBook Where firstName='Chandan';
Query OK, 1 row affected (0.01 sec)

mysql> Select * From AddressBook;
+-----------+----------+---------+--------+---------------+-------------+------------------+
| firstName | lastName | address | city   | state         | phoneNumber | email            |
+-----------+----------+---------+--------+---------------+-------------+------------------+
| Harsh     | Rastogi  | Mawana  | Meerut | Uttar Pradesh | 7455878221  | harsh@gmail.com  |
| Pranav    | Kumar    | Kira    | Bijnor | Uttar Pradesh | 6325417852  | pranav@gmail.com |
+-----------+----------+---------+--------+---------------+-------------+------------------+
2 rows in set (0.00 sec)

-- UC-6
-- Retrive person belonging to city

mysql> Select * From AddressBook Where city='Meerut';
+-----------+----------+---------+--------+---------------+-------------+-----------------+
| firstName | lastName | address | city   | state         | phoneNumber | email           |
+-----------+----------+---------+--------+---------------+-------------+-----------------+
| Harsh     | Rastogi  | Mawana  | Meerut | Uttar Pradesh | 7455878221  | harsh@gmail.com |
+-----------+----------+---------+--------+---------------+-------------+-----------------+
1 row in set (0.00 sec)

-- UC-7
-- Size of addressbook by city or state

mysql> Select COUNT(*) From AddressBook where state='Uttar Pradesh';
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.01 sec)

mysql> Select COUNT(*) From AddressBook where state='Bihar';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

-- UC-8
-- Sort the table based on Name;

mysql> Select * From AddressBook Order by firstName ASC;
+-----------+----------+---------+----------+---------------+-------------+----------------------+
| firstName | lastName | address | city     | state         | phoneNumber | email                |
+-----------+----------+---------+----------+---------------+-------------+----------------------+
| Chandan   | Kumar    | Kalibag | Patna    | Bihar         | 3454561234  | ch.kumar@outlook.com |
| Harsh     | Rastogi  | Mawana  | Meerut   | Uttar Pradesh | 7455878221  | harsh@gmail.com      |
| Nishant   | Kumar    | Kalyan  | Gurugram | Haryana       | 2445778243  | nishant@gmail.com    |
| Om        | Rai      | Saket   | Kolkatta | Bangal        | 3243548243  | nishant@gmail.com    |
| Pranav    | Kumar    | Kira    | Bijnor   | Uttar Pradesh | 6325417852  | pranav@gmail.com     |
+-----------+----------+---------+----------+---------------+-------------+----------------------+
5 rows in set (0.01 sec)

mysql> Select * From AddressBook Where city='Meerut' Order by firstName ASC;
+-----------+----------+---------+--------+---------------+-------------+-----------------+
| firstName | lastName | address | city   | state         | phoneNumber | email           |
+-----------+----------+---------+--------+---------------+-------------+-----------------+
| Harsh     | Rastogi  | Mawana  | Meerut | Uttar Pradesh | 7455878221  | harsh@gmail.com |
+-----------+----------+---------+--------+---------------+-------------+-----------------+
1 row in set (0.00 sec)

-- UC-9
-- Alter table to add type of address

mysql> Alter table AddressBook
    -> Add type Varchar(30) Default 'Personal';
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Describe AddressBook;
+-------------+--------------+------+-----+----------+-------+
| Field       | Type         | Null | Key | Default  | Extra |
+-------------+--------------+------+-----+----------+-------+
| firstName   | varchar(30)  | NO   |     | NULL     |       |
| lastName    | varchar(30)  | NO   |     | NULL     |       |
| address     | varchar(100) | NO   |     | NULL     |       |
| city        | varchar(50)  | NO   |     | NULL     |       |
| state       | varchar(50)  | NO   |     | NULL     |       |
| phoneNumber | varchar(20)  | NO   |     | NULL     |       |
| email       | varchar(50)  | NO   |     | NULL     |       |
| type        | varchar(30)  | YES  |     | Personal |       |
+-------------+--------------+------+-----+----------+-------+
8 rows in set (0.00 sec)


-- UC-10
-- count by type

mysql> Select COUNT(*) from AddressBook Where type='Personal';
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)


