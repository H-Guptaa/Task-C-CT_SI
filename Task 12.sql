CREATE TABLE JobCosts (
    job_family VARCHAR(100),
    location VARCHAR(50),  -- 'India' or 'International'
    cost FLOAT
);

INSERT INTO JobCosts (job_family, location, cost) VALUES
('HR', 'India', 120000),
('HR', 'International', 80000),
('Finance', 'India', 150000),
('Finance', 'International', 50000),
('IT', 'India', 300000),
('IT', 'International', 200000),
('Marketing', 'India', 70000),
('Marketing', 'International', 130000);

SELECT 
    job_family,
    ROUND(SUM(CASE WHEN location = 'India' THEN cost ELSE 0 END) * 100.0 / SUM(cost), 2) AS India_Percent,
    ROUND(SUM(CASE WHEN location = 'International' THEN cost ELSE 0 END) * 100.0 / SUM(cost), 2) AS International_Percent
FROM JobCosts
GROUP BY job_family;