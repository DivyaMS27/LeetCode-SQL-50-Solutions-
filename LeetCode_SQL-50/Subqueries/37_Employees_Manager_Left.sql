-- Problem: 1978. Employees Whose Manager Left the Company
-- Difficulty: Easy
-- Table: Employees(employee_id, name, manager_id, salary)
-- Goal: Find employees whose salary < 30000 AND whose manager_id
--       does not exist in the Employees table (manager left company).
-- Approach:
--   1. Use a CTE to filter employees with salary < 30000
--   2. From those, check manager_id NOT IN (SELECT employee_id FROM Employees)
--      → ensures manager record is missing (manager left company)
--   3. Return employee_id values
--   4. ORDER BY employee_id for final output

WITH CTE AS (
    SELECT employee_id,
           name,
           manager_id,
           salary
    FROM Employees
    WHERE salary < 30000
)
SELECT employee_id
FROM CTE
WHERE manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
