CREATE TABLE Projects (
    Task_ID INT PRIMARY KEY,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL
);


INSERT INTO Projects (Task_ID, Start_Date, End_Date)
VALUES 
(1, '2015-10-01', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10-30', '2015-10-31');

SELECT * FROM Projects ORDER BY Start_Date;

WITH ProjectWithRow AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Start_Date) AS rn
    FROM Projects
),
GroupedProjects AS (
    SELECT *,
           DATEADD(DAY, -rn, Start_Date) AS grp
    FROM ProjectWithRow
),
FinalProjects AS (
    SELECT 
        MIN(Start_Date) AS ProjectStart,
        MAX(End_Date) AS ProjectEnd,
        DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)) + 1 AS Duration
    FROM GroupedProjects
    GROUP BY grp
)
SELECT ProjectStart, ProjectEnd
FROM FinalProjects
ORDER BY Duration ASC, ProjectStart ASC;