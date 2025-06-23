-- STEP 1: Create a SQL Server login at the server level
CREATE LOGIN NewUserLogin WITH PASSWORD = 'StrongPassword123!';
GO

-- STEP 2: Switch to your target database
USE Sample_Taskc;
GO

-- STEP 3: Create a database user for the login
CREATE USER NewDBUser FOR LOGIN NewUserLogin;
GO

-- STEP 4: Add the user to the db_owner role
EXEC sp_addrolemember 'db_owner', 'NewDBUser';
GO