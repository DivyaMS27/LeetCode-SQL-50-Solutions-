-- Problem: 1070. Product Sales Analysis III
-- Difficulty: Medium
-- Table: Sales(sale_id, product_id, year, quantity, price)
-- Goal: Find all sales that occurred in the first year each product was sold.
--       Output columns: product_id, first_year, quantity, price.
-- Approach:
--   1. Use window function RANK() partitioned by product_id, ordered by year
--      to identify the earliest year of sales for each product.
--   2. Assign rownum = 1 for the first year entries.
--   3. Select product_id, year (alias as first_year), quantity, and price
--      only for rows where rownum = 1.

WITH CTE AS (
    SELECT product_id,
           year,
           quantity,
           price,
           RANK() OVER(PARTITION BY product_id ORDER BY year) AS rownum
    FROM Sales
)
SELECT product_id,
       year AS first_year,
       quantity,
       price
FROM CTE
WHERE rownum = 1;
