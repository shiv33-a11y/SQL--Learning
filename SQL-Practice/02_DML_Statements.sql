/*
    File: 02_DML_Statements.sql
    Topic: Data Manipulation Language (DML)
    Platform: Microsoft SQL Server (T-SQL)
*/

USE SQLPracticeDB;
GO

-- Insert each product only if its ProductID does not already exist.
IF NOT EXISTS (SELECT 1 FROM dbo.ProductQ WHERE ProductID = 1)
BEGIN
    INSERT INTO dbo.ProductQ (ProductID, ProductName, Price, Stock, Category)
    VALUES (1, 'Laptop', 10000.00, 15, 'Electronics');
END;
GO

IF NOT EXISTS (SELECT 1 FROM dbo.ProductQ WHERE ProductID = 2)
BEGIN
    INSERT INTO dbo.ProductQ (ProductID, ProductName, Price, Stock, Category)
    VALUES (2, 'Powerbank', 1000.00, 10, 'Electronics');
END;
GO

-- Read the current records.
SELECT *
FROM dbo.ProductQ;
GO

-- Update the price of one selected product.
UPDATE dbo.ProductQ
SET Price = 20000.00
WHERE ProductID = 1;
GO

-- Optional: uncomment to delete one selected product.
-- DELETE FROM dbo.ProductQ
-- WHERE ProductID = 2;
-- GO

SELECT *
FROM dbo.ProductQ;
GO

/*
    MERGE can synchronize a target table with a source table.
    It is not demonstrated here because a meaningful example requires
    a separate source table and careful handling of matching conditions.
*/
