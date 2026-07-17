-- Problem: 176. Second Highest Salary
-- Difficulty: Easy
-- Table: Employee(id, salary)
-- Definitions:
--   id     = primary key (unique ID for each employee)
--   salary = integer value representing employee salary
-- Goal: Find the second highest distinct salary.
--       If no second highest salary exists, return NULL.
-- Approach:
--   1. Use subquery → find MAX(salary) overall
--   2. In outer query → filter salaries less than global MAX
--   3. Apply MAX() again → highest among remaining salaries
--   4. Result = second highest distinct salary
--   5. If only one salary exists → query returns NULL

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
