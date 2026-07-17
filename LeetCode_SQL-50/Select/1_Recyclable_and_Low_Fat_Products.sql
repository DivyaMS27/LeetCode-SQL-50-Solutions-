-- Problem: 1757. Recyclable and Low Fat Products
-- Difficulty: Easy
-- Table: Products(product_id, low_fats, recyclable)
-- Goal: Find product IDs that are both low fat and recyclable
-- Approach: Use WHERE clause with AND condition

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
