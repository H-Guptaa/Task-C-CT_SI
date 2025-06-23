CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Friends (
    ID INT,
    Friend_ID INT
);

CREATE TABLE Packages (
    ID INT,
    Salary FLOAT
);

-- Enter Data into Tables
-- Students
INSERT INTO Students (ID, Name)
VALUES 
(1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');

-- Friends
INSERT INTO Friends (ID, Friend_ID)
VALUES 
(1, 2),
(2, 3),
(3, 4),
(4, 1);

-- Packages
INSERT INTO Packages (ID, Salary)
VALUES 
(1, 15.20),
(2, 16.06),
(3, 11.55),
(4, 12.12);

UPDATE Packages
SET Salary = 10.06
WHERE ID = 2;

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages p1 ON s.ID = p1.ID
JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p2.Salary > p1.Salary
ORDER BY p2.Salary;
