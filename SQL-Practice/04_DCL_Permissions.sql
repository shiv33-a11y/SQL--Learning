/*
    File: 04_DCL_Permissions.sql
    Topic: Data Control Language (DCL)
    Platform: Microsoft SQL Server (T-SQL)

    Practice-only example. This creates a database user WITHOUT a login
    if needed, so the permissions commands can be demonstrated.
    It does not create a server login or production-ready account.
*/

USE SQLPracticeDB;
GO

-- Ensure the demo database principal exists.
IF DATABASE_PRINCIPAL_ID(N'JuniorUser') IS NULL
BEGIN
    CREATE USER [JuniorUser] WITHOUT LOGIN;
END;
GO

-- Allow the demo user to read employee records.
GRANT SELECT ON OBJECT::dbo.Employees TO [JuniorUser];
GO

-- Explicitly block updates to employee records.
DENY UPDATE ON OBJECT::dbo.Employees TO [JuniorUser];
GO

-- Remove the SELECT permission granted above.
REVOKE SELECT ON OBJECT::dbo.Employees FROM [JuniorUser];
GO

/*
    GRANT  = grants a permission.
    DENY   = explicitly denies a permission.
    REVOKE = removes a previously granted or denied permission.

    These statements require appropriate database permissions.
*/
