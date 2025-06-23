IF OBJECT_ID('dbo.SwapDemo') IS NOT NULL
    DROP TABLE SwapDemo;

-- 2. Create fresh table
CREATE TABLE SwapDemo (
    ID INT,
    ColumnA INT,
    ColumnB INT
);

-- 3. Insert original values
INSERT INTO SwapDemo (ID, ColumnA, ColumnB) VALUES
(1, 100, 200),
(2, 300, 400),
(3, 500, 600);


UPDATE SwapDemo
SET 
    ColumnA = CASE ID 
                WHEN 1 THEN 100
                WHEN 2 THEN 300
                WHEN 3 THEN 500
              END,
    ColumnB = CASE ID 
                WHEN 1 THEN 200
                WHEN 2 THEN 400
                WHEN 3 THEN 600
              END;

PRINT '--- ORIGINAL TABLE ---';
SELECT * FROM SwapDemo;


UPDATE SwapDemo
SET ColumnA = ColumnA + ColumnB;


UPDATE SwapDemo
SET ColumnB = ColumnA - ColumnB;


UPDATE SwapDemo
SET ColumnA = ColumnA - ColumnB;


PRINT '--- SWAPPED TABLE ---';
SELECT * FROM SwapDemo;