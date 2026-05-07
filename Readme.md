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

## Aggregate Functions:-
1. SUM()
1. COUNT()
1. AVG()
1. MAX()
1. MIN()

### Create the database
```sql
CREATE DATABASE <dbName>;

-- example
CREATE DATABASE TestDb;
```

### Drop the database
```sql
DROP DATABASE <dbName>;

-- Safe version ✅
DROP DATABASE IF EXISTS <dbName>;

-- example
DROP DATABASE IF EXISTS TestDb;
```

### Create the table
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

### Drop the table
```sql
DROP TABLE <tableName>;

--example
DROP TABLE Employees;
DROP TABLE IF EXISTS Employees; -- safe version
```

### Insert data into the table
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

### Insert Multiple data into the table
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