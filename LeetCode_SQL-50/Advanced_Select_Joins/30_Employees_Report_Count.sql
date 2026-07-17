-- Problem: 1731. The Number of Employees Which Report to Each Employee
-- Difficulty: Easy
-- Table: Employees(employee_id, name, reports_to, age)
-- Goal: Report for each manager:
--       1. employee_id and name
--       2. number of direct reports (reports_count)
--       3. average age of reports (rounded to nearest integer)
-- Approach:
--   1. Perform a self-join on Employees:
--        - e = manager
--        - r = employee reporting to e
--   2. Use COUNT(r.reports_to) to count direct reports
--   3. Use AVG(r.age) to calculate average age of reports
--   4. Apply ROUND() to average age for integer result
--   5. GROUP BY manager (reports_to) to aggregate per manager
--   6. ORDER BY e.employee_id for final output

SELECT e.employee_id,
       e.name,
       COUNT(r.reports_to) AS reports_count,
       ROUND(AVG(r.age)) AS average_age
FROM Employees e
JOIN Employees r
ON e.employee_id = r.reports_to
GROUP BY r.reports_to
ORDER BY e.employee_id;
