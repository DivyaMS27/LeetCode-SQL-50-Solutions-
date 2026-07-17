-- Problem: 1075. Project Employees I
-- Difficulty: Easy
-- Tables:
--   Project(project_id, employee_id)
--   Employee(employee_id, name, experience_years)
-- Goal: Report the average experience years of employees for each project,
--       rounded to 2 decimal places.
-- Approach:
--   1. LEFT JOIN Project with Employee on employee_id
--   2. Use AVG(experience_years) to calculate average per project
--   3. Apply ROUND to 2 decimal places
--   4. GROUP BY project_id for final output

SELECT project_id,
       ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
LEFT JOIN Employee AS e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;
