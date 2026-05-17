# SQL Server Database

## Pre-Requisites:-
1. Download & Install Microsoft SQL Server → DB engine
1. SSMS (SQL Server Management Studio) → GUI (Graphical User Interface) tool


### List of All Databases
```sql
SELECT name
FROM sys.databases;

-- (MySQL)
-- SHOW DATABASES;
```

### List of All Tables
```sql
SELECT name
FROM sys.tables;

-- (MySQL)
-- SHOW TABLES;
```

### Switch to Another Database:-
```sql
USE <dbName>;

-- example
USE TestDb;
```
## Data types 
1. INT
1. BIGINT
1. FLOAT
1. VARCHAR( n ) & NVARCHAR( n )
1. DECIMAL
1. DATE
1. TIME
1. DATETIME
1. BIT
1. UNIQUEIDENTIFIER (GUID)

## Constraints
1. NOT NULL
1. DEFAULT
1. CHECK
1. UNIQUE
1. PRIMARY KEY
1. FOREIGN KEY  


## Identity Property:-
- Auto increment property.
- Not a constraint.

```sql
IDENTITY(seed, increment)

-- example
Id INT IDENTITY(1,1)
```


## SQL Commands:-
1. DDL (Data Definition Language)
    - [CREATE, ALTER, DROP, TRUNCATE]

1. DML (Data Manipulation Language)
    - [INSERT, UPDATE, DELETE]

1. DQL (Data Query Language)
    - [SELECT]

1. DCL (Data Control Language)
    - [GRANT, REVOKE]

1. TCL (Transaction Control Language)
    - [COMMIT, ROLLBACK, BEGIN TRANSACTION]


## Clauses:-
1. SELECT
1. DISTINCT 
1. FROM
1. JOIN
1. WHERE
1. GROUP BY
1. HAVING
1. ORDER BY
1. TOP / LIMIT 

## Execution Order
1. FROM
1. JOIN
1. WHERE
1. GROUP BY
1. HAVING
1. SELECT
1. DISTINCT
1. ORDER BY
1. TOP / LIMIT

## Operators:-
```sh
1] Arithmetic Operator:- 
    [+, -, *, /, %]

2] Comparison / Relational Operators:-
    [=, !=, <, <=, >, >=]

3] Logical Operators:-
    1. AND :- must all conditions true then true.
    2. OR:- atleast one condition true then true.
    3. NOT:- reverse the condition.

4] Special Operators:-
    1. IN (Membership operator):- Matches multiple values 
    2. BETWEEN:- Range check & inclusive boundry values.
    3. LIKE:- Pattern matching
    4. IS NULL:- Check NULL
    5. EXISTS:- Checks subquery existence
    6. ANY:- Compare with any value
    7. ALL:- Compare with all values

5] Bitwise Operators:-
    [&, `, ^]
```

## Comment:-
```sql
-- this is single line comment

/* 
    this is
        multiple line
    comment.
            Thanks!
*/
```

## Aggregate Functions:-
1. SUM()
1. COUNT()
1. AVG()
1. MAX()
1. MIN()

## String Functions:-
1. LEN()
1. UPPER()
1. LOWER()
1. TRIM()
1. SUBSTRING()
1. REPLACE()

## Date Functions:-
1. GETDATE()
1. DATEDIFF()
1. DATEADD()
1. YEAR()
1. MONTH()
1. DAY()

## What is Index:-
- Index is a database object used to improve the speed of data retrieval operations in a table.

- It works like a book index → helps SQL Server find data faster.

- Without index, SQL Server performs full table scan.

- Instead of scanning the entire table, SQL Server uses the index to quickly locate required rows.

### Why Index:-
- To increase query performance.
- To fetch records faster.
- To reduce data search time.

### Advantages Index:-
- Faster `SELECT` queries
- Improves `WHERE`, `JOIN`, `ORDER BY`
- Reduces table scan
- Better query performance

### Limitations Index:-
- Takes extra storage space
- `INSERT`, `UPDATE`, `DELETE` become slower
- Too many indexes reduce performance

### When to Create Indexes?
- Frequently searched columns
- `WHERE` clause columns
- `JOIN` columns
- `ORDER BY` columns
- Frequently used foreign keys

### When NOT to Use Indexes?
- Small tables
- Frequently updated columns
- Columns with many duplicate values

## Index Types:-
1. Clustered Index 
1. Nonclustered Index 
1. Composite Index
1. Unique Index

### Clustered Index:-
- Stores data physically in sorted order.
- One table can have only ONE clustered index.
- ⚠️ **Primary Key creates Clustered Index by default.**

```sql
CREATE CLUSTERED INDEX idx_tableName_columnName
ON tableName( columnName );

-- example
CREATE CLUSTERED INDEX idx_employees_id
ON Employees(id);
```

### Nonclustered Index:-
- Stores index separately from actual table data.
- One table can have multiple nonclustered indexes.

```sql
CREATE NONCLUSTERED INDEX idx_tableName_columnName
ON tableName( columnName );

-- example
CREATE NONCLUSTERED INDEX idx_employees_name
ON Employees(name);
```


### Composite Index:-
- Index created on multiple columns.
- Used when query searches using multiple columns together.

```sql
CREATE INDEX idx_emp_name_city
ON Employees(name, city);
```

### Unique Index:-
- Does not allow duplicate values.
```sql
CREATE UNIQUE INDEX idx_emp_email
ON Employees(email);
```


### Create the Database
```sql
CREATE DATABASE <dbName>;

-- example
CREATE DATABASE TestDb;
```

### Create the Table
```sql
CREATE TABLE <tableName>
(<columnName> <type> <constraint>);

-- example
CREATE TABLE Employees
(
    Id INT IDENTITY(1,1) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')), -- optional
    Salary DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY(Id) 
)
```

### Retrieve/Read All Data
```sql
SELECT * 
FROM <tableName>;

-- example
SELECT *
FROM Employees;
```

### Insert Data into the Table (Manually)
```sql
INSERT INTO <tableName>
(<col1>, <col2>, <col3>)
VALUES
(<value1>, <value2>, <value3>);

-- example
INSERT INTO Employees
(Name, Email, Salary)
VALUES
('Shubham', 'shubhambharde98@gmail.com', 36000);
```

### Insert Multiple Data into the Table (Manually)
```sql
INSERT INTO <tableName>
(<col1>, <col2>, <col3>)
VALUES
(<value1>, <value2>, <value3>),
(<value1>, <value2>, <value3>),
(<value1>, <value2>, <value3>);

-- example
INSERT INTO Employees
(Name, Email, Salary)
VALUES
('Shubham', 'shubham@gmail.com', 23000),
('Pranav', 'pb@gmail.com', 17000),
('Rohit', 'rohit@gmail.com', 28000);
```

### Update the Data/Row
```sql
UPDATE <tableName>
SET <columnName> = <value>, 
    <columnName2> = <value>
WHERE <condition>;

-- example
UPDATE Employees
SET 
    Name = 'Updated Name', 
    Salary = 72000
WHERE Id = 6;

-- NOTE:- Without WHERE clause, all rows will be updated/deleted.
```

### Delete the Specific Data/Row
```sql
DELETE FROM <tableName>
WHERE <condition>; 

-- example
DELETE FROM Employees
WHERE Id = 6;

-- NOTE:- Without WHERE clause, all rows will be updated/deleted.
```

### Delete All Data/Rows
```sql
TRUNCATE TABLE <tableName>;

-- example
TRUNCATE TABLE Employees;

/* NOTE:-   
    1] Deletes all rows quickly/Fast
    2] Cannot use WHERE
    3] Resets IDENTITY counter
    4] Cannot truncate table referenced by FOREIGN KEY
*/
```

### Add New Column:- 
```sql
ALTER TABLE <tableName>
ADD <columnName> <type> <constraint>;

-- example
ALTER TABLE Employees
ADD City VARCHAR(20) DEFAULT 'NotMention';
```

### Drop Column :- 
```sql
ALTER TABLE <tableName>
DROP COLUMN <columnName>;

-- example
ALTER TABLE Employees
DROP COLUMN City;
```

### Modify Column Type or Constraint:-
```sql
ALTER TABLE <tableName>
ALTER COLUMN <columnName> <type> <constraint>;

-- example
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(50) NOT NULL;


/* NOTE:-
    1]  While altering a column, some changes may require redefining related constraints separately.

    2] while altering constraints using ALTER COLUMN, you usually need to specify the datatype again.
*/
```

### Rename the Table 
```sql
EXEC sp_rename '<oldTableName>', '<newTableName>';

-- example
EXEC sp_rename 'Employees', 'EmployeesTable';
```

### Rename the Column Name 
```sql
EXEC sp_rename '<tableName.oldColumnName>', '<newColumnName>', 'COLUMN';

-- example
EXEC sp_rename 'Employees.Name', 'FullName', 'COLUMN'; 
```

### Drop the Table
```sql
DROP TABLE <tableName>;

--example
DROP TABLE Employees;
DROP TABLE IF EXISTS Employees; -- safe version
```

### Drop the Database
```sql
DROP DATABASE <dbName>;

-- Safe version ✅
DROP DATABASE IF EXISTS <dbName>;

-- example
DROP DATABASE IF EXISTS TestDb;
```

## Select Static/Constant Values:-
- Static/Constant values are fixed values written directly inside the SELECT statement.
- These values are not fetched from any table.
- 'AS' keyword is used to give an alias/custom column name to the output. 
- Returning custom messages

```sql
SELECT 'Shubham' AS my_name;
SELECT 18 AS age;
SELECT 'New Customer' AS type_of_customer;

SELECT 
    Name,
    'Active Employee' AS status
FROM Employees;
```



## Hands-On Practice
```sql
-- 1] Create a TestDB database
CREATE DATABASE TestDB;


-- 2] switch to TestDB database
USE TestDB;


/*
3] Create a new table called Persons with columns:-
id, person_name, birth_date & phone
*/
CREATE TABLE Persons
(
    id BIGINT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(13) NOT NULL,

    CONSTRAINT pk_persons PRIMARY KEY (id)
)


-- 4] In existing Persons table add a new column called 'email'.
ALTER TABLE Persons
ADD email VARCHAR(50) NOT NULL UNIQUE;


-- 5] Remove the column phone from Persons table
ALTER TABLE Persons
DROP COLUMN phone;


-- 6] Delete the table Persons from database
DROP TABLE Persons;


-- 7] Delete all rows/data from Persons table.
TRUNCATE TABLE Persons;


-- 8] Insert multiple data in Persons table. (Manual way)
INSERT INTO Persons
(id, person_name, birth_date, phone)
VALUES
(1, 'Shubham', NULL, '9130287682') ,
(2, 'Pranav', NULL, '7234867954'),
(3, 'Rohit', NULL, '9004236526');


-- 9] Copy data from 'Persons' table into 'Customers'
-- OR Insert data from 'Persons' table into 'Customers'.
INSERT INTO Customers
(id, customer_name, mob_number, customer_type)
SELECT 
    id, 
    person_name,
    phone, 
    'New'
FROM Persons;


-- 10] Change the score of customer with ID 4 to 0.
UPDATE Customers
SET score = 0
WHERE id = 4;


-- 11] Change the score of customer with ID 10 to 0 & update the country to 'UK'
UPDATE Customers
SET 
    score = 0,
    country = 'UK'
WHERE id = 10;


-- 12] Update all customers with a Null score by setting their score to 0
UPDATE Customers
SET score = 0
WHERE score IS NULL;


-- 13] Delete all customers with an Id > 5
DELETE FROM Customers
WHERE id > 5;


-- 14] Delete all data/rows from the Persons table
TRUNCATE TABLE Persons -- faster ✅

DELETE FROM Persons; -- slower ❌ 


-- 15] Delete the TestDB database
DROP DATABASE TestDB;


-- 16] Retrieve all customers data
SELECT *
FROM Customers;


-- 17] Retrieve each customers name, country & score
SELECT 
    name,
    country,
    score
FROM Customers;


-- 18] Retrieve customers with a score not equal to 0.
SELECT *
FROM Customers
WHERE score != 0;


-- 19] Retrieve customers from Germany & Sort by score.
SELECT *
FROM Customers
WHERE country = 'Germany'
ORDER BY score ASC; 


-- 20] Retrieve all customers & sort results by the highest score first.
SELECT *
FROM Customers
ORDER BY score DESC; 


-- 21] Retrieve customers & sort results by the country & then by the highest score.
SELECT *
FROM Customers
ORDER BY 
    country ASC, 
    score DESC;


-- 22] Find the total_score for each country
SELECT
    country,
    SUM(score) AS total_score
FROM Customers
GROUP BY country;


-- 23] Find the total_score & total_number of customers for each country.
SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(*) AS total_number_of_customers
FROM Customers
GROUP BY country;


-- 24] Find the average score for each country considering only customers with a score not eqal to 0.
-- And return only those countries with an average score greater than 430.
SELECT 
    country,
    AVG(score) AS average_score
FROM Customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;


-- 25] Return unique list of all countries from Customers.
SELECT DISTINCT country
FROM Customers;


-- 26] Retrieve only 3 customers
SELECT TOP 3 *
FROM Customers;


-- 27] Retrieve top 3 customers with highest score.
SELECT TOP 3 *
FROM Customers
ORDER BY score DESC;


-- 28] Retrieve lowest 2 customers based on the score.
SELECT TOP 2 *
FROM Customers
ORDER BY score ASC;


-- 29] get the 2 most recent orders from orders.
SELECT TOP 2 *
FROM Orders
ORDER BY order_date DESC;


-- 30] Retrieve all customers who are not from Germany.
SELECT *
FROM Customers
WHERE country != 'Germany';

-- another way
SELECT *
FROM Customers
WHERE NOT country = 'Germany';
```