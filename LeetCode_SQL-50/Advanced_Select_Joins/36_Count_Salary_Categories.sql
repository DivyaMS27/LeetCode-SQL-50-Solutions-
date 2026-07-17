-- Problem: 1907. Count Salary Categories
-- Difficulty: Easy
-- Table: Accounts(account_id, income)
-- Definitions:
--   Low Salary    → income < 20000
--   Average Salary→ 20000 <= income <= 50000
--   High Salary   → income > 50000
-- Goal: Count number of accounts in each salary category.
--       Must return all three categories, even if count = 0.
-- Approach:
--   1. Use three SELECT queries, each filtering by category condition
--   2. Label category with fixed string ('Low Salary', 'Average Salary', 'High Salary')
--   3. Use COUNT(*) to count accounts in each category
--   4. Combine results with UNION to ensure all categories appear

SELECT 'Low Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION
SELECT 'Average Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
UNION
SELECT 'High Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;
