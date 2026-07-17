-- Problem: 620. Not Boring Movies
-- Difficulty: Easy
-- Table: Cinema(id, movie, description, rating)
-- Goal: Report movies with:
--       1. Odd-numbered IDs (id % 2 != 0)
--       2. Description not equal to 'boring'
--       Order results by rating in descending order
-- Approach:
--   Use WHERE clause with modulo condition for odd IDs,
--   filter description != 'boring',
--   then ORDER BY rating DESC

SELECT *
FROM Cinema
WHERE id % 2 != 0
  AND description != 'boring'
ORDER BY rating DESC;
