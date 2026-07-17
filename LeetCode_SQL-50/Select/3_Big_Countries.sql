-- Problem: 595. Big Countries
-- Difficulty: Easy
-- Table: World(name, continent, area, population, gdp)
-- Goal: Find countries that are considered "big":
--       1. Area >= 3,000,000 km²
--       2. OR Population >= 25,000,000
-- Approach: Use WHERE clause with OR condition to filter rows

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;
