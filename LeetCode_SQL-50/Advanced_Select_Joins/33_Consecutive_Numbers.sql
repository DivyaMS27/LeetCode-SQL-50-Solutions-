-- Problem: 180. Consecutive Numbers
-- Difficulty: Medium
-- Table: Logs(id, num)
-- Goal: Find all numbers that appear at least three times consecutively.
-- Approach:
--   1. Use window functions LAG and LEAD to check previous and next values for each row
--   2. Compare current num with both prev_num and next_num
--   3. If num = prev_num AND num = next_num → it appears 3 times consecutively
--   4. Use DISTINCT to avoid duplicates in final output
--   5. Return column as ConsecutiveNums

WITH CTE AS (
    SELECT num,
           LAG(num) OVER (ORDER BY id) AS prev_num,
           LEAD(num) OVER (ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM CTE
WHERE num = prev_num
  AND num = next_num;
