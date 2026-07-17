-- Problem: 1378. Replace Employee ID With The Unique Identifier
-- Difficulty: Easy
-- Tables:
--   Employees(id, name)
--   EmployeeUNI(id, unique_id)
-- Goal: Show each employee's name with their unique_id.
--       If an employee does not have a unique_id, return NULL.
-- Approach: Use LEFT JOIN on id to include all employees,
--           even those without a matching unique_id.

SELECT EmployeeUNI.unique_id,
       Employees.name
FROM Employees
LEFT JOIN EmployeeUNI
ON EmployeeUNI.id = Employees.id;
