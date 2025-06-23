-- STEP 1: Create the TestEmployees table
CREATE TABLE TestEmployees (
    id INT,
    salary INT
);
GO

-- STEP 2: Insert sample data
INSERT INTO TestEmployees (id, salary) VALUES
(1, 1000),
(2, 2500),
(3, 3000),
(4, 900),
(5, 2000);
GO

-- STEP 3: Calculate the difference between actual and miscalculated average salary
SELECT 
    CEILING(
        AVG(CAST(salary AS FLOAT)) - 
        AVG(CAST(REPLACE(CAST(salary AS VARCHAR), '0', '') AS FLOAT))
    ) AS salary_difference
FROM TestEmployees;
GO

INSERT INTO TestEmployees (id, salary) VALUES
(6, 2800),
(7, 255),
(8, 300),
(9, 9080),
(10, 2050);
GO
