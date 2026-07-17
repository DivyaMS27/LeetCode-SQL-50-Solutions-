-- Problem: 570. Managers with at Least 5 Direct Reports
-- Difficulty: Medium
-- Table: Employee(id, name, department, managerId)
-- Goal: Find managers who have at least 5 direct reports
-- Approach:
--   1. Perform a self-join on Employee table (manager-employee relationship)
--   2. Group by managerId to count direct reports
--   3. Use HAVING clause to filter managers with count >= 5
--   4. Select manager names from the grouped result

SELECT e.name
FROM Employee AS e
JOIN Employee AS m
ON m.managerId = e.id
GROUP BY m.managerId
HAVING COUNT(m.managerId) >= 5;
