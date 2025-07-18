-- Contests
CREATE TABLE Contests (
    contest_id INT,
    hacker_id INT,
    name VARCHAR(100)
);

-- Colleges
CREATE TABLE Colleges (
    college_id INT,
    contest_id INT
);

-- Challenges
CREATE TABLE Challenges (
    challenge_id INT,
    college_id INT
);

-- View Stats
CREATE TABLE View_Stats (
    challenge_id INT,
    total_views INT,
    total_unique_views INT
);

-- Submission Stats
CREATE TABLE Submission_Stats (
    challenge_id INT,
    total_submissions INT,
    total_accepted_submissions INT
);

-- Contests
INSERT INTO Contests VALUES 
(66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');

-- Colleges
INSERT INTO Colleges VALUES 
(11219, 66406),
(32473, 66556),
(56685, 94828);

-- Challenges
INSERT INTO Challenges VALUES 
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);

-- View Stats
INSERT INTO View_Stats VALUES 
(47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

-- Submission Stats
INSERT INTO Submission_Stats VALUES 
(75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);

WITH submission_summary AS (
    SELECT 
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
),
view_summary AS (
    SELECT 
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
)

WITH submission_summary AS (
    SELECT 
        challenge_id,
        SUM(total_submissions) AS total_submissions,
        SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
),
view_summary AS (
    SELECT 
        challenge_id,
        SUM(total_views) AS total_views,
        SUM(total_unique_views) AS total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
)

SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    ISNULL(SUM(ss.total_submissions), 0) AS total_submissions,
    ISNULL(SUM(ss.total_accepted_submissions), 0) AS total_accepted_submissions,
    ISNULL(SUM(vs.total_views), 0) AS total_views,
    ISNULL(SUM(vs.total_unique_views), 0) AS total_unique_views
FROM Contests c
JOIN Colleges co ON c.contest_id = co.contest_id
JOIN Challenges ch ON co.college_id = ch.college_id
LEFT JOIN submission_summary ss ON ch.challenge_id = ss.challenge_id
LEFT JOIN view_summary vs ON ch.challenge_id = vs.challenge_id
GROUP BY c.contest_id, c.hacker_id, c.name
HAVING 
    ISNULL(SUM(ss.total_submissions), 0) +
    ISNULL(SUM(ss.total_accepted_submissions), 0) +
    ISNULL(SUM(vs.total_views), 0) +
    ISNULL(SUM(vs.total_unique_views), 0) > 0
ORDER BY c.contest_id;