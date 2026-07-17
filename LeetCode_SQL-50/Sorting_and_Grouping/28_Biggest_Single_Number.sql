-- Problem: 619. Biggest Single Number
-- Difficulty: Easy
-- Table: MyNumbers(num)
-- Definitions:
--   Single number = a number that appears only once in the table
-- Goal: Find the largest single number.
--       If no single number exists, return NULL.
-- Approach:
--   1. GROUP BY num to aggregate occurrences
--   2. Use HAVING COUNT(num) = 1 to filter numbers that appear only once
--   3. Wrap result in a CTE for clarity
--   4. Use MAX(num) to select the largest single number
--   5. Return NULL automatically if no single number exists

WITH CTE AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
)
SELECT MAX(num) AS num
FROM CTE;
