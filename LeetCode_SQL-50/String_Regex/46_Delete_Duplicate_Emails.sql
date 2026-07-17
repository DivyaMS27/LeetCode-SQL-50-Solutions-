-- Problem: 196. Delete Duplicate Emails
-- Difficulty: Easy
-- Table: Person(id, email)
-- Definitions:
--   id    = primary key (unique ID for each row)
--   email = lowercase email address (may have duplicates)
-- Goal: Delete duplicate emails, keeping only the row with the smallest id.
--       SQL solution must use DELETE (not SELECT).
-- Approach:
--   1. Identify duplicates by joining Person table on email
--   2. Compare ids → keep the smallest id, delete larger ones
--   3. DELETE rows where another row with same email has smaller id
--   4. Result: only one row per unique email remains

DELETE p1
FROM Person AS p1
JOIN Person AS p2
ON p1.email = p2.email
WHERE p2.id < p1.id;
