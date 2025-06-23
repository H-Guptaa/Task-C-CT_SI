-- Step 1: Create OriginalTable
CREATE TABLE OriginalTable (
    ID INT,
    Name VARCHAR(50),
    Age INT
);

-- Step 2: Insert initial data
INSERT INTO OriginalTable (ID, Name, Age) VALUES
(1, 'Alice', 25),
(2, 'Bob', 30);

-- Step 3: Create NewTable (initially empty)
CREATE TABLE NewTable (
    ID INT,
    Name VARCHAR(50),
    Age INT
);

-- Step 4: Create Trigger to copy new inserts to NewTable
CREATE TRIGGER trg_AfterInsert
ON OriginalTable
AFTER INSERT
AS
BEGIN
    INSERT INTO NewTable (ID, Name, Age)
    SELECT ID, Name, Age FROM inserted;
END;

-- Step 5: Insert new rows into OriginalTable
INSERT INTO OriginalTable (ID, Name, Age) VALUES
(3, 'Charlie', 35),
(4, 'Diana', 28);

-- Step 6: View the updated OriginalTable
SELECT * FROM OriginalTable;

-- Step 7: View NewTable which now automatically contains the new data
SELECT * FROM NewTable;