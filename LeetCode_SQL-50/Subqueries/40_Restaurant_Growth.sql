-- Problem: 1321. Restaurant Growth
-- Difficulty: Medium
-- Table: Customer(customer_id, name, visited_on, amount)
-- Definitions:
--   (customer_id, visited_on) = primary key
--   visited_on = date of visit
--   amount = money spent by customer
-- Goal: Compute 7-day moving average of customer spending
--       (current day + 6 previous days), rounded to 2 decimals.
--       Return results ordered by visited_on ASC.
-- Approach:
--   1. Use window functions SUM and AVG with ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
--      → captures rolling 7-day window
--   2. ROUND values to 2 decimal places
--   3. Assign ROW_NUMBER() to track day order
--   4. Filter WHERE day_rank >= 7 to ensure full 7-day window
--   5. Return visited_on, total amount, and average_amount

WITH CTE AS (
    SELECT visited_on,
           ROW_NUMBER() OVER (ORDER BY visited_on) AS day_rank,
           ROUND(SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS amount,
           ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on,
       amount,
       average_amount
FROM CTE
WHERE day_rank >= 7
ORDER BY visited_on;
