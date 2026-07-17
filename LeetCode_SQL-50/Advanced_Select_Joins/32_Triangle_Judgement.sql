-- Problem: 610. Triangle Judgement
-- Difficulty: Easy
-- Table: Triangle(x, y, z)
-- Goal: For each set of three line segments (x, y, z),
--       determine if they can form a valid triangle.
-- Approach:
--   1. Apply triangle inequality rules:
--        - x + y > z
--        - y + z > x
--        - x + z > y
--   2. Use CASE WHEN to check conditions
--   3. Return 'Yes' if all conditions are satisfied, else 'No'
--   4. Output columns: x, y, z, and triangle status

SELECT x,
       y,
       z,
       CASE 
           WHEN (x + y > z) AND (y + z > x) AND (x + z > y) 
           THEN 'Yes' 
           ELSE 'No' 
       END AS triangle
FROM Triangle;
