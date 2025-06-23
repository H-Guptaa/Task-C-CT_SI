CREATE TABLE Employee_Costs (
    EmpID INT,
    BU_Name VARCHAR(50),
    Month_Name VARCHAR(10),
    Cost FLOAT
);

INSERT INTO Employee_Costs (EmpID, BU_Name, Month_Name, Cost) VALUES
-- Tech BU
(1, 'Tech', 'Jan', 100000),
(2, 'Tech', 'Jan', 120000),
(3, 'Tech', 'Feb', 110000),
(4, 'Tech', 'Feb', 130000),
(5, 'Tech', 'Feb', 125000),

-- Finance BU
(6, 'Finance', 'Jan', 80000),
(7, 'Finance', 'Jan', 85000),
(8, 'Finance', 'Feb', 90000),

-- HR BU
(9,  'HR', 'Jan', 60000),
(10, 'HR', 'Feb', 62000),
(11, 'HR', 'Feb', 65000);

SELECT 
    BU_Name,
    Month_Name,
    COUNT(EmpID) AS Headcount,
    SUM(Cost) AS TotalCost,
    ROUND(SUM(Cost) * 1.0 / COUNT(EmpID), 2) AS WeightedAvgCost
FROM Employee_Costs
GROUP BY BU_Name, Month_Name
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
         END;sn