/*
    File: 03_DQL_Statements.sql
    Topic: Data Query Language (DQL)
    Platform: Microsoft SQL Server (T-SQL)
*/

USE SQLPracticeDB;
GO

-- Create the employee table if it does not exist.
IF OBJECT_ID(N'dbo.Employees', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Employees
    (
        EmployeeID   INT           NOT NULL PRIMARY KEY,
        EmployeeName VARCHAR(50)   NOT NULL,
        Department   VARCHAR(50)   NOT NULL,
        Salary       DECIMAL(10,2) NOT NULL
    );
END;
GO

-- Insert sample records only when each EmployeeID is absent.
IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 101)
    INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary)
    VALUES (101, 'Rahul', 'IT', 40000.00);
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 102)
    INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary)
    VALUES (102, 'Priya', 'HR', 35000.00);
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 103)
    INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary)
    VALUES (103, 'Amit', 'Finance', 40000.00);
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 104)
    INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary)
    VALUES (104, 'Neha', 'IT', 55000.00);
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 105)
    INSERT INTO dbo.Employees (EmployeeID, EmployeeName, Department, Salary)
    VALUES (105, 'Rohit', 'Sales', 30000.00);
GO

-- 1. Display all employees.
SELECT *
FROM dbo.Employees;
GO

-- 2. Employees earning more than 40,000.
SELECT EmployeeName, Salary
FROM dbo.Employees
WHERE Salary > 40000;
GO

-- 3. Employees in the IT department.
SELECT *
FROM dbo.Employees
WHERE Department = 'IT';
GO

-- 4. Average salary across all employees.
SELECT AVG(Salary) AS AverageSalary
FROM dbo.Employees;
GO

-- 5. One highest-paid employee.
SELECT TOP (1) *
FROM dbo.Employees
ORDER BY Salary DESC, EmployeeID ASC;
GO

-- 6. Count employees by department.
SELECT Department, COUNT(*) AS EmployeeCount
FROM dbo.Employees
GROUP BY Department
ORDER BY Department;
GO

-- 7. Departments whose average salary exceeds 35,000.
SELECT Department, AVG(Salary) AS AverageSalary
FROM dbo.Employees
GROUP BY Department
HAVING AVG(Salary) > 35000
ORDER BY AverageSalary DESC;
GO
