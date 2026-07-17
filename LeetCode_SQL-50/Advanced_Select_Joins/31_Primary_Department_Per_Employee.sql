-- Problem: 1789. Primary Department for Each Employee
-- Difficulty: Easy
-- Table: Employee(employee_id, department_id, primary_flag)
-- Definitions:
--   primary_flag = 'Y' → department is primary
--   primary_flag = 'N' → department is not primary
--   If employee belongs to only one department, that department is considered primary even if flag = 'N'
-- Goal: Report each employee with their primary department.
-- Approach:
--   1. Select rows where primary_flag = 'Y' (explicit primary department)
--   2. Include employees who belong to only one department (COUNT(employee_id) = 1)
--   3. Use GROUP BY in subquery to identify single-department employees
--   4. Combine both conditions with OR for final result

SELECT employee_id,
       department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
       SELECT employee_id
       FROM Employee
       GROUP BY employee_id
       HAVING COUNT(employee_id) = 1
   );
