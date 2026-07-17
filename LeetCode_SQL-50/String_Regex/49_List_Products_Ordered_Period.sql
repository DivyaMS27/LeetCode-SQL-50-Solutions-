-- Problem: 1327. List the Products Ordered in a Period
-- Difficulty: Easy
-- Tables:
--   Products(product_id, product_name, product_category)
--   Orders(product_id, order_date, unit)
-- Definitions:
--   Products.product_id = primary key
--   Orders.product_id   = foreign key referencing Products.product_id
--   order_date          = date when product was ordered
--   unit                = number of units ordered
-- Goal: Find products with at least 100 units ordered in February 2020.
--       Return product_name and total units ordered.
-- Approach:
--   1. JOIN Products with Orders → link product details to orders
--   2. Filter Orders by February 2020 → DATE_FORMAT(order_date, '%Y-%m') = '2020-02'
--   3. GROUP BY product_id → aggregate units per product
--   4. SUM(unit) → total units ordered in the period
--   5. HAVING unit >= 100 → keep only products with 100+ units
--   6. Return product_name and unit

SELECT p.product_name AS product_name,
       SUM(o.unit) AS unit
FROM Products AS p
JOIN Orders AS o
ON o.product_id = p.product_id
WHERE DATE_FORMAT(o.order_date, '%Y-%m') = '2020-02'
GROUP BY o.product_id
HAVING unit >= 100;
