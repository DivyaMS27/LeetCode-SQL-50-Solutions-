-- Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
-- Difficulty: Easy
-- Tables:
--   Visits(visit_id, customer_id)
--   Transactions(transaction_id, visit_id, amount)
-- Goal: Find customer IDs who visited the mall but made no transactions,
--       and count how many such visits they had.
-- Approach: Use LEFT JOIN between Visits and Transactions on visit_id,
--           filter rows where Transactions.visit_id IS NULL,
--           then GROUP BY customer_id to count visits.

SELECT DISTINCT Visits.customer_id,
       COUNT(Visits.customer_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions
ON Transactions.visit_id = Visits.visit_id
WHERE Transactions.visit_id IS NULL
GROUP BY customer_id;
