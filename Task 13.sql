CREATE TABLE BU_Records (
    BU_Name VARCHAR(100),
    Month_Name VARCHAR(20),
    Cost FLOAT,
    Revenue FLOAT
);

INSERT INTO BU_Records (BU_Name, Month_Name, Cost, Revenue) VALUES
('Tech', 'Jan', 100000, 250000),
('Tech', 'Feb', 120000, 240000),
('Tech', 'Mar', 110000, 200000),
('Finance', 'Jan', 80000, 180000),
('Finance', 'Feb', 85000, 175000),
('Finance', 'Mar', 90000, 200000),
('HR', 'Jan', 40000, 60000),
('HR', 'Feb', 45000, 55000),
('HR', 'Mar', 47000, 58000);

SELECT 
    BU_Name,
    Month_Name,
    Cost,
    Revenue,
    ROUND(Cost / NULLIF(Revenue, 0), 2) AS Cost_Revenue_Ratio
FROM BU_Records
ORDER BY BU_Name, 
         CASE Month_Name 
            WHEN 'Jan' THEN 1 
            WHEN 'Feb' THEN 2 
            WHEN 'Mar' THEN 3 
            WHEN 'Apr' THEN 4 
            WHEN 'May' THEN 5 
            WHEN 'Jun' THEN 6 
            WHEN 'Jul' THEN 7 
            WHEN 'Aug' THEN 8 
            WHEN 'Sep' THEN 9 
            WHEN 'Oct' THEN 10 
            WHEN 'Nov' THEN 11 
            WHEN 'Dec' THEN 12 
         END;