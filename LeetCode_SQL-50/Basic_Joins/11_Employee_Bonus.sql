-- Problem: 577. Employee Bonus
-- Difficulty: Easy
-- Tables:
--   Employee(empId, name, supervisor, salary)
--   Bonus(empId, bonus)
-- Goal: Report employee names with their bonus amounts
--       Only include employees who either:
--         1. Have a bonus less than 1000
--         2. OR did not receive any bonus (NULL)
-- Approach: Use LEFT JOIN on empId to combine Employee and Bonus tables,
--           then filter with WHERE clause for bonus < 1000 or IS NULL

SELECT Employee.name,
       Bonus.bonus
FROM Employee
LEFT JOIN Bonus
ON Employee.empId = Bonus.empId
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL;
