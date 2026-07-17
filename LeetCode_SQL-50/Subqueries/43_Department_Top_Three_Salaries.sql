-- Problem: 185. Department Top Three Salaries
-- Difficulty: Hard
-- Tables:
--   Employee(id, name, salary, departmentId)
--   Department(id, name)
-- Definitions:
--   Employee.id       = primary key
--   Department.id     = primary key
--   Employee.departmentId = foreign key referencing Department.id
-- Goal: Find employees who are high earners in each department.
--       A high earner = employee whose salary is in the top 3 unique salaries of their department.
--       Return Department name, Employee name, and Salary.
-- Approach:
--   1. JOIN Employee with Department → get department names
--   2. Use DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC)
--      → ranks salaries within each department
--   3. Filter WHERE Ranked <= 3 → keep only top 3 unique salaries
--   4. Return Department, Employee, Salary

WITH CTE AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS Ranked
    FROM Employee AS e
    LEFT JOIN Department AS d
    ON d.id = e.departmentId
)
SELECT Department,
       Employee,
       Salary
FROM CTE
WHERE Ranked <= 3;
