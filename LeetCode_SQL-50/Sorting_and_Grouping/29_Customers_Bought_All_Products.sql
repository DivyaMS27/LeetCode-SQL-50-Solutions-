-- Problem: 1045. Customers Who Bought All Products
-- Difficulty: Medium
-- Tables:
--   Customer(customer_id, product_key)
--   Product(product_key)
-- Goal: Find customer_id values of customers who bought ALL products
--       listed in the Product table.
-- Approach:
--   1. GROUP BY customer_id to aggregate purchases per customer
--   2. Use COUNT(DISTINCT product_key) to count unique products bought
--   3. Compare against total number of products (subquery: SELECT COUNT(*) FROM Product)
--   4. Return only those customers whose count matches total products

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
