MENTORHUB DATABASE VERSION FIX

IMPORTANT: No ASPX, C#, Web.config, MDF, LDF, or existing project content was changed.
The original database files are kept exactly as supplied.

WHY THE ERROR HAPPENS
---------------------
Your Mentorehubdb.mdf is SQL Server database version 998 (SQL Server 2025).
Your current LocalDB reports support only version 904 (SQL Server 2019).
SQL Server does not support opening/downgrading a newer MDF directly on an older engine.

TO KEEP ALL EXISTING DATA EXACTLY AS-IS
---------------------------------------
Use SQL Server 2025 / SQL Server 2025 LocalDB to open the supplied MDF.
Do NOT edit bytes inside the MDF and do NOT replace it with an older MDF, because that
can lose data and is not a real downgrade.

1. Close Visual Studio.
2. Install SQL Server 2025 LocalDB/Express (or use an existing SQL Server 2025 instance).
3. Verify LocalDB versions in Command Prompt:
      sqllocaldb versions
4. Check the current instance:
      sqllocaldb info MSSQLLocalDB
5. After the SQL 2025 LocalDB installation, restart/create the MSSQLLocalDB instance if
   necessary according to your installed LocalDB version. Do not delete an instance
   before backing up any databases attached to it.
6. Reopen MentorHub.sln and open SQL Server Object Explorer.
7. Connect to the SQL 2025 LocalDB instance and attach:
      MentorHub\App_Data\Mentorehubdb.mdf

The project already uses:
      Data Source=(LocalDB)\MSSQLLocalDB;
      AttachDbFilename=|DataDirectory|\Mentorehubdb.mdf;
      Integrated Security=True

Therefore no application-code/database-content change is required for this fix.

ALTERNATIVE MIGRATION
---------------------
If you must remain on SQL Server 2019/LocalDB 2019, first open the MDF on SQL Server
2025, then generate a SQL script with Schema and Data (or backup/restore through a
supported migration path), and import that script/data into a 2019 database.
A direct MDF downgrade is not supported.
