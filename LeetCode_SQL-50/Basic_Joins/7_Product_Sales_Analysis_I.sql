-- Problem: 1068. Product Sales Analysis I
-- Difficulty: Easy
-- Tables:
--   Sales(sale_id, product_id, year, quantity, price)
--   Product(product_id, product_name)
-- Goal: Report product_name, year, and price for each sale_id
-- Approach: Use LEFT JOIN on product_id to combine Sales and Product tables,
--           ensuring all sales are included even if product info is missing

SELECT Product.product_name,
       Sales.year,
       Sales.price
FROM Sales
LEFT JOIN Product
ON Product.product_id = Sales.product_id;
