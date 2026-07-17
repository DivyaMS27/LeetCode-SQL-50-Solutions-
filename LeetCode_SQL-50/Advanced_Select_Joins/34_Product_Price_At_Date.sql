-- Problem: 1164. Product Price at a Given Date
-- Difficulty: Medium
-- Table: Products(product_id, new_price, change_date)
-- Definitions:
--   Initial price for all products = 10
--   Each row records a price change for a product on a given date
-- Goal: Find the price of each product on 2019-08-16.
-- Approach:
--   1. Use a CTE to filter price changes up to 2019-08-16
--   2. Apply ROW_NUMBER() partitioned by product_id, ordered by change_date DESC
--      → ensures we capture the latest price before or on 2019-08-16
--   3. Select rownum = 1 for each product (latest valid price)
--   4. Use COALESCE to return 10 if no price change exists before the given date
--   5. LEFT JOIN with distinct product_id list to ensure all products are included

WITH CTE AS (
    SELECT product_id,
           new_price,
           change_date,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rownum
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT p.product_id,
       COALESCE(c.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p
LEFT JOIN CTE AS c
ON c.product_id = p.product_id AND rownum = 1;
