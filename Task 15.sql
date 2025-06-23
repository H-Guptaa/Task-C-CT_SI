CREATE TABLE Employees_Salary (
    EmpID INT,
    Name VARCHAR(100),
    Salary FLOAT
);

INSERT INTO Employees_Salary (EmpID, Name, Salary) VALUES
(1, 'Alice', 70000),
(2, 'Bob', 85000),
(3, 'Charlie', 76000),
(4, 'David', 92000),
(5, 'Eve', 98000),
(6, 'Frank', 65000),
(7, 'Grace', 99000),
(8, 'Hannah', 60000),
(9, 'Ian', 72000),
(10, 'Jack', 93000);

SELECT EmpID, Name, Salary
FROM (
    SELECT *, RANK() OVER (PARTITION BY 1 ORDER BY Salary DESC) AS rnk
    FROM Employees_Salary
) AS Ranked
WHERE rnk <= 5;