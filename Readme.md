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

