-- Problem: 197. Rising Temperature
-- Difficulty: Easy
-- Table: Weather(id, recordDate, temperature)
-- Goal: Find IDs of dates where the temperature is higher than the previous day
-- Approach:
--   1. Use LAG() window function to access previous day's date and temperature
--   2. Build a CTE to store current and previous values
--   3. Filter rows where the difference between recordDate and Previous_date = 1
--      AND current temperature > previous temperature

WITH CTE AS (
    SELECT id,
           recordDate,
           temperature,
           LAG(recordDate) OVER(ORDER BY recordDate) AS Previous_date,
           LAG(temperature) OVER(ORDER BY recordDate) AS Previous_temp
    FROM Weather
)
SELECT id AS Id
FROM CTE
WHERE DATEDIFF(recordDate, Previous_date) = 1
  AND temperature > Previous_temp;
