CREATE TABLE Functions (
    X INT,
    Y INT
);

INSERT INTO Functions (X, Y)
VALUES 
(20, 20),
(20, 20),
(20, 21),
(23, 22),
(22, 23),
(21, 20);

SELECT DISTINCT
    LEAST(f1.X, f1.Y) AS X,
    GREATEST(f1.X, f1.Y) AS Y
FROM Functions f1
JOIN Functions f2 
    ON f1.X = f2.Y AND f1.Y = f2.X
WHERE f1.X <= f1.Y
ORDER BY X;

Select * from Functions;