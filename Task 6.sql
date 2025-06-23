-- STEP 1: Create the STATION table
CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);

-- STEP 2: Insert sample data
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'CityA', 'AA', 34.05, 118.24),
(2, 'CityB', 'BB', 36.12, 115.17),
(3, 'CityC', 'CC', 40.71, 74.01),
(4, 'CityD', 'DD', 25.76, 80.19);

-- STEP 3: Query to calculate Manhattan Distance
SELECT 
    ROUND(
        ABS(MAX(LAT_N) - MIN(LAT_N)) + 
        ABS(MAX(LONG_W) - MIN(LONG_W)), 4
    ) AS Manhattan_Distance
FROM STATION;

