-- Problem: 1211. Queries Quality and Percentage
-- Difficulty: Easy
-- Table: Queries(query_name, result, position, rating)
-- Definitions:
--   quality = average of (rating / position)
--   poor_query_percentage = percentage of queries with rating < 3
-- Goal: For each query_name, calculate quality and poor_query_percentage,
--       both rounded to 2 decimal places.
-- Approach:
--   1. Use SUM(rating/position)/COUNT(query_name) for quality
--   2. Use CASE WHEN rating < 3 to count poor queries
--   3. Divide poor queries by total queries * 100 for percentage
--   4. ROUND both values to 2 decimals
--   5. GROUP BY query_name for final output

SELECT query_name,
       ROUND(SUM(rating/position)/COUNT(query_name), 2) AS quality,
       ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(query_name), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
