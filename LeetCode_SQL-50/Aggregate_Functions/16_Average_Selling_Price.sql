-- Problem: 1251. Average Selling Price
-- Difficulty: Easy
-- Tables:
--   Prices(product_id, start_date, end_date, price)
--   UnitsSold(product_id, purchase_date, units)
-- Goal: Calculate the average selling price for each product.
--       Formula = (SUM(units * price) / SUM(units)), rounded to 2 decimals.
--       If no units sold, average_price = 0.
-- Approach:
--   1. LEFT JOIN Prices with UnitsSold on product_id
--   2. Match purchase_date within start_date and end_date range
--   3. Use SUM(units * price) / SUM(units) for average price
--   4. Apply IFNULL to handle products with no sales (set to 0)
--   5. ROUND result to 2 decimal places
--   6. GROUP BY product_id for final output

SELECT p.product_id,
       IFNULL(ROUND(SUM(u.units * p.price) / SUM(u.units), 2), 0) AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
ON u.product_id = p.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
