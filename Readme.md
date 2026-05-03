# SQL Server Database

## Pre-Requisites:-
1. Download & Install Microsoft SQL Server → DB engine
1. SSMS (SQL Server Management Studio) → UI tool


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



### Create the database
```sql
CREATE DATABASE <dbName>;

-- example
CREATE DATABASE TestDb;
```

### Drop the database
```sql
DROP DATABASE <dbName>;

-- ⚠️ Safe version (real world):
DROP DATABASE IF EXISTS TestDb;

-- example
DROP DATABASE IF EXISTS TestDb;
```