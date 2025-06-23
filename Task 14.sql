CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(100),
    Sub_Band VARCHAR(10)
);

INSERT INTO Employees (EmpID, Name, Sub_Band) VALUES
(1, 'Alice', 'B1'),
(2, 'Bob', 'B1'),
(3, 'Charlie', 'B2'),
(4, 'David', 'B1'),
(5, 'Eve', 'B2'),
(6, 'Frank', 'B3'),
(7, 'Grace', 'B3'),
(8, 'Hannah', 'B2'),
(9, 'Ian', 'B1'),
(10, 'Jack', 'B2');

SELECT 
    Sub_Band,
    COUNT(*) AS Headcount,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS Percentage
FROM Employees
GROUP BY Sub_Band;