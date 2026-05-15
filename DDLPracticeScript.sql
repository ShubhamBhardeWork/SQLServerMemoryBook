-- ** DDL COMMANDS PRACTICE SCRIPT (SQL SERVER) **

-- =========================================
--  1. CREATE Command 🚀🚀🚀 
-- =========================================


-- CREATE DATABASE
CREATE DATABASE CollegeDB;
GO


-- USE DATABASE
USE CollegeDB;
GO


-- CREATE TABLE
CREATE TABLE Students
(
    Id INT IDENTITY(1,1) NOT NULL,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18),
    City VARCHAR(30) DEFAULT 'Pune',

    CONSTRAINT pk_students PRIMARY KEY (Id)
);
GO


-- =========================================
--  2. ALTER Command 🚀🚀🚀 
-- =========================================

-- ADD NEW COLUMN
ALTER TABLE Students
ADD Phone VARCHAR(13);
GO


-- MODIFY COLUMN DATATYPE / CONSTRAINT
ALTER TABLE Students
ALTER COLUMN FullName VARCHAR(100) NOT NULL;
GO


-- DROP COLUMN
ALTER TABLE Students
DROP COLUMN Phone;
GO


-- =========================================
--  3. RENAME Command 🚀🚀🚀 
-- =========================================

-- RENAME TABLE
EXEC sp_rename 'Students', 'CollegeStudents';
GO


-- RENAME COLUMN
EXEC sp_rename 
    'CollegeStudents.FullName', 
    'StudentName', 
    'COLUMN';
GO


-- =========================================
--  4. TRUNCATE Command 🚀🚀🚀 
-- =========================================

-- DELETE ALL ROWS (QUICKLY)
TRUNCATE TABLE CollegeStudents;
GO


-- =========================================
--  5. DROP Command 🚀🚀🚀 
-- =========================================

-- DROP TABLE
DROP TABLE CollegeStudents;
GO


-- DROP DATABASE
USE master;
GO

DROP DATABASE CollegeDB;
GO