# SQL Practice — SQL Server (T-SQL)

A beginner-friendly collection of SQL Server scripts covering database structure, data manipulation, queries, permissions, and transactions.

## Topics

- **DDL:** `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
- **DML:** `INSERT`, `UPDATE`, `DELETE`
- **DQL:** `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, aggregate functions
- **DCL:** `GRANT`, `DENY`, `REVOKE`
- **TCL:** `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`, `SAVE TRANSACTION`

## Files

```text
SQL-Practice/
├── README.md
├── 01_DDL_Statements.sql
├── 02_DML_Statements.sql
├── 03_DQL_Statements.sql
├── 04_DCL_Permissions.sql
└── 05_TCL_Transactions.sql
```

## Requirements

- Microsoft SQL Server
- SQL Server Management Studio (SSMS) or another T-SQL-compatible client
- Sufficient permissions to create a database and database user

## Run order

Run scripts in numerical order. Each script selects `SQLPracticeDB`; the first script creates it if needed.

## Important notes

- `DROP TABLE` removes a table and its data.
- `TRUNCATE TABLE` removes all rows but preserves the table structure.
- Check `WHERE` clauses before running `UPDATE` or `DELETE`.
- The DCL script creates a demo database user **without a login** if it does not already exist. This is useful for practicing permissions, but it is not a production authentication setup.
- Run these examples in a practice database, never against production data.
