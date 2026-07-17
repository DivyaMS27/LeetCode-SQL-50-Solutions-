-- Problem: 1193. Monthly Transactions I
-- Difficulty: Medium
-- Table: Transactions(id, country, state, amount, trans_date)
-- Goal: For each month and country, report:
--       1. Total number of transactions
--       2. Total transaction amount
--       3. Number of approved transactions
--       4. Total approved transaction amount
-- Approach:
--   1. Extract month from trans_date using LEFT(trans_date, 7)
--   2. Use COUNT(amount) for total transactions
--   3. Use SUM(amount) for total transaction amount
--   4. Use CASE WHEN state='approved' to count approved transactions
--   5. Use CASE WHEN state='approved' to sum approved amounts
--   6. GROUP BY month and country for final output

SELECT LEFT(trans_date, 7) AS month,
       country,
       COUNT(amount) AS trans_count,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
