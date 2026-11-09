-- Run this after connecting to the database on a SQL Server instance that can open it.
SELECT
    DB_NAME() AS DatabaseName,
    DATABASEPROPERTYEX(DB_NAME(), 'Version') AS DatabaseVersion,
    DATABASEPROPERTYEX(DB_NAME(), 'CompatibilityLevel') AS CompatibilityLevel;

SELECT @@VERSION AS SqlServerVersion;
