/*
    File: 05_TCL_Transactions.sql
    Topic: Transaction Control Language (TCL)
    Platform: Microsoft SQL Server (T-SQL)

    Uses dbo.Employees from 03_DQL_Statements.sql.
*/

USE SQLPracticeDB;
GO

-- Example 1: update a salary, then undo the change.
BEGIN TRANSACTION;

UPDATE dbo.Employees
SET Salary = 90000.00
WHERE EmployeeID = 101;

SELECT *
FROM dbo.Employees
WHERE EmployeeID = 101;

ROLLBACK TRANSACTION;

-- Verify that the salary returned to its original value.
SELECT *
FROM dbo.Employees
WHERE EmployeeID = 101;
GO

-- Example 2: savepoint and partial rollback.
BEGIN TRANSACTION;

UPDATE dbo.Employees
SET Salary = 45000.00
WHERE EmployeeID = 101;

SAVE TRANSACTION SalarySavepoint;

UPDATE dbo.Employees
SET Salary = 60000.00
WHERE EmployeeID = 102;

-- Undo only the update performed after the savepoint.
ROLLBACK TRANSACTION SalarySavepoint;

-- Commit the first update.
COMMIT TRANSACTION;

SELECT *
FROM dbo.Employees
WHERE EmployeeID IN (101, 102);
GO

/*
    BEGIN TRANSACTION = starts a transaction.
    COMMIT             = makes transaction changes permanent.
    ROLLBACK           = undoes uncommitted changes.
    SAVE TRANSACTION   = creates a savepoint in the current transaction.
*/
