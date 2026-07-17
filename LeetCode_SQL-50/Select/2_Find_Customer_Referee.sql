-- Problem: 584. Find Customer Referee
-- Difficulty: Easy
-- Table: Customer(id, name, referee_id)
-- Goal: Find names of customers who are either:
--       1. Not referred by anyone (referee_id IS NULL)
--       2. Referred by someone other than customer with id = 2
-- Approach: Use WHERE clause with OR condition to filter rows

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
