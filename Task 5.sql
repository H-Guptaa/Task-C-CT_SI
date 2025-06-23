-- Hackers Table
CREATE TABLE Hackers (
    hacker_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Submissions Table
CREATE TABLE Submissions (
    submission_date DATE,
    submission_id INT PRIMARY KEY,
    hacker_id INT,
    score INT
);

-- Insert into Hackers
INSERT INTO Hackers (hacker_id, name) VALUES
(15758, 'Rose'), (20703, 'Angela'), (36396, 'Frank'),
(38289, 'Patrick'), (44065, 'Lisa'), (53473, 'Kimberly'),
(62529, 'Bonnie'), (79722, 'Michael');

-- Insert into Submissions
INSERT INTO Submissions (submission_date, submission_id, hacker_id, score) VALUES
('2016-03-01', 8494, 20703, 0), ('2016-03-01', 22403, 53473, 15),
('2016-03-01', 23965, 79722, 60), ('2016-03-01', 30173, 36396, 70),
('2016-03-02', 34928, 20703, 0), ('2016-03-02', 38740, 15758, 60),
('2016-03-02', 42769, 79722, 25), ('2016-03-02', 44364, 79722, 60),
('2016-03-03', 45440, 20703, 0), ('2016-03-03', 49050, 36396, 70),
('2016-03-03', 50273, 79722, 5), ('2016-03-04', 50344, 20703, 0),
('2016-03-04', 51360, 44065, 90), ('2016-03-04', 54404, 53473, 65),
('2016-03-04', 61533, 79722, 45), ('2016-03-05', 72852, 20703, 0),
('2016-03-05', 74546, 38289, 0), ('2016-03-05', 76487, 62529, 65),
('2016-03-05', 82439, 36396, 10), ('2016-03-05', 90006, 36396, 40),
('2016-03-06', 90404, 20703, 0);

-- CTE: Count of submissions per hacker per day
WITH HackerDailySubmissions AS (
    SELECT submission_date, hacker_id, COUNT(*) AS submission_count
    FROM Submissions
    GROUP BY submission_date, hacker_id
),

-- CTE: Max submission count per day
MaxDailySubmissions AS (
    SELECT submission_date, MAX(submission_count) AS max_count
    FROM HackerDailySubmissions
    GROUP BY submission_date
),

-- CTE: Hacker(s) with max submissions per day
TopHackerEachDay AS (
    SELECT hds.submission_date, hds.hacker_id
    FROM HackerDailySubmissions hds
    JOIN MaxDailySubmissions mds
      ON hds.submission_date = mds.submission_date
     AND hds.submission_count = mds.max_count
),

-- CTE: Select only the lowest hacker_id per day
LowestTopHacker AS (
    SELECT submission_date, MIN(hacker_id) AS hacker_id
    FROM TopHackerEachDay
    GROUP BY submission_date
),

-- Final output with name and total hackers count
FinalResult AS (
    SELECT 
        s.submission_date,
        COUNT(DISTINCT s.hacker_id) AS total_hackers
    FROM Submissions s
    GROUP BY s.submission_date
)

SELECT 
    fr.submission_date,
    fr.total_hackers,
    lth.hacker_id,
    h.name
FROM FinalResult fr
JOIN LowestTopHacker lth ON fr.submission_date = lth.submission_date
JOIN Hackers h ON lth.hacker_id = h.hacker_id
ORDER BY fr.submission_date;