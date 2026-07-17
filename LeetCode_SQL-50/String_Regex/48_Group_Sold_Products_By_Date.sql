-- Problem: 1484. Group Sold Products By The Date
-- Difficulty: Easy
-- Table: Activities(sell_date, product)
-- Definitions:
--   sell_date = date when product was sold
--   product   = name of product sold (may contain duplicates)
-- Goal: For each sell_date, report:
--       1. Number of distinct products sold
--       2. Names of distinct products (sorted lexicographically)
--       Return results ordered by sell_date ASC.
-- Approach:
--   1. GROUP BY sell_date → aggregate per day
--   2. COUNT(DISTINCT product) → number of unique products sold
--   3. GROUP_CONCAT(DISTINCT product ORDER BY product ASC)
--      → concatenates product names in sorted order
--   4. ORDER BY sell_date → final output sorted by date

SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
