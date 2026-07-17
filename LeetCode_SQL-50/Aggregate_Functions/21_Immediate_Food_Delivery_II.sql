-- Problem: 1174. Immediate Food Delivery II
-- Difficulty: Medium
-- Table: Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
-- Definitions:
--   Immediate order = order_date = customer_pref_delivery_date
--   First order = earliest order_date for each customer
-- Goal: Find the percentage of immediate orders among first orders of all customers,
--       rounded to 2 decimal places.
-- Approach:
--   1. Identify first order per customer using MIN(order_date) grouped by customer_id
--   2. Filter Delivery table to only include those first orders
--   3. Use CASE WHEN to count immediate orders (order_date = pref_date)
--   4. Divide immediate orders by total first orders * 100
--   5. ROUND result to 2 decimals

SELECT ROUND(
           SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100
           / COUNT(*),
           2
       ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);
