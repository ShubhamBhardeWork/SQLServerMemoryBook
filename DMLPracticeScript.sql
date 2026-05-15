-- ** DML COMMANDS PRACTICE SCRIPT (SQL SERVER) **

-- =========================================
--  1. INSERT Command 🚀🚀🚀
-- =========================================

-- INSERT SINGLE ROW
INSERT INTO Employees
(FullName, Email, Salary, City)
VALUES
('Shubham Bharde', 'shubham@gmail.com', 45000, 'Pune');
GO


-- INSERT MULTIPLE ROWS
INSERT INTO Employees
(FullName, Email, Salary, City)
VALUES
('Pranav Patil', 'pranav@gmail.com', 35000, 'Mumbai'),

('Rohit Sharma', 'rohit@gmail.com', 55000, 'Delhi'),

('Sneha Patil', 'sneha@gmail.com', 40000, 'Pune');
GO


-- INSERT DATA USING SELECT
INSERT INTO Customers
(CustomerName, CustomerEmail)
SELECT
    FullName,
    Email
FROM Employees;
GO


-- =========================================
--  2. UPDATE Command 🚀🚀🚀
-- =========================================

-- UPDATE SINGLE COLUMN
UPDATE Employees
SET Salary = 50000
WHERE Id = 1;
GO


-- UPDATE MULTIPLE COLUMNS
UPDATE Employees
SET
    Salary = 60000,
    City = 'Bangalore'
WHERE Id = 2;
GO


-- UPDATE USING CONDITION
UPDATE Employees
SET Salary = Salary + 5000
WHERE City = 'Pune';
GO


-- UPDATE NULL VALUES
UPDATE Employees
SET City = 'Unknown'
WHERE City IS NULL;
GO


-- =========================================
--  3. DELETE Command 🚀🚀🚀
-- =========================================

-- DELETE SPECIFIC ROW
DELETE FROM Employees
WHERE Id = 4;
GO


-- DELETE USING CONDITION
DELETE FROM Employees
WHERE Salary < 40000;
GO


-- DELETE ALL ROWS
DELETE FROM Employees;
GO