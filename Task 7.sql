-- Step 1: Generate numbers from 2 to 1000 using a recursive CTE
WITH Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num + 1 <= 1000
),
-- Step 2: Filter only prime numbers
Primes AS (
    SELECT num
    FROM Numbers n
    WHERE NOT EXISTS (
        SELECT 1 FROM Numbers d
        WHERE d.num <= SQRT(n.num)
          AND n.num % d.num = 0
          AND d.num > 1
    )
)
-- Step 3: Concatenate prime numbers using '&'
SELECT STRING_AGG(CAST(num AS VARCHAR), '&') AS Prime_Numbers
FROM Primes
OPTION (MAXRECURSION 1000);