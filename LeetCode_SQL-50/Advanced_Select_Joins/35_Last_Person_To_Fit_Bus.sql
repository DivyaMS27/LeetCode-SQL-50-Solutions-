-- Problem: 1204. Last Person to Fit in the Bus
-- Difficulty: Medium
-- Table: Queue(person_id, person_name, weight, turn)
-- Definitions:
--   Bus weight limit = 1000 kg
--   turn = boarding order (1 = first, n = last)
-- Goal: Find the person_name of the last person who can board
--       without exceeding the bus weight limit.
-- Approach:
--   1. Use SUM(weight) OVER(ORDER BY turn) to calculate cumulative weight
--      as people board in order.
--   2. Include all rows where cumulative weight <= 1000.
--   3. From those valid rows, select the last person (highest turn).
--   4. ORDER BY turn DESC and LIMIT 1 ensures we capture the last valid person.

WITH CTE AS (
    SELECT person_id,
           person_name,
           weight,
           turn,
           SUM(weight) OVER (ORDER BY turn) AS lastperson
    FROM Queue
)
SELECT person_name
FROM CTE
WHERE lastperson <= 1000
ORDER BY turn DESC
LIMIT 1;
