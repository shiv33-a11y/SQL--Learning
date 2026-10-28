/*
    File: 01_DDL_Statements.sql
    Topic: Data Definition Language (DDL)
    Platform: Microsoft SQL Server (T-SQL)
*/

-- Create the practice database if it does not exist.
IF DB_ID(N'SQLPracticeDB') IS NULL
BEGIN
    CREATE DATABASE SQLPracticeDB;
END;
GO

USE SQLPracticeDB;
GO

-- Create the products table if it does not exist.
IF OBJECT_ID(N'dbo.ProductQ', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ProductQ
    (
        ProductID   INT           NOT NULL PRIMARY KEY,
        ProductName VARCHAR(100)  NOT NULL,
        Price       DECIMAL(10,2) NULL,
        Stock       INT           NULL
    );
END;
GO

-- Add Category only if the column is not already present.
IF COL_LENGTH(N'dbo.ProductQ', N'Category') IS NULL
BEGIN
    ALTER TABLE dbo.ProductQ
    ADD Category VARCHAR(50) NULL;
END;
GO

-- Increase the product name column size if it is still VARCHAR(100).
IF EXISTS
(
    SELECT 1
    FROM sys.columns AS c
    JOIN sys.types AS t ON c.user_type_id = t.user_type_id
    WHERE c.object_id = OBJECT_ID(N'dbo.ProductQ')
      AND c.name = N'ProductName'
      AND t.name = N'varchar'
      AND c.max_length = 100
)
BEGIN
    ALTER TABLE dbo.ProductQ
    ALTER COLUMN ProductName VARCHAR(150) NOT NULL;
END;
GO

SELECT *
FROM dbo.ProductQ;
GO

/*
    Destructive examples — uncomment only when you intend to remove data.

    TRUNCATE TABLE dbo.ProductQ; -- Removes all rows; keeps the table.
    DROP TABLE dbo.ProductQ;     -- Removes the table and its data.
*/
