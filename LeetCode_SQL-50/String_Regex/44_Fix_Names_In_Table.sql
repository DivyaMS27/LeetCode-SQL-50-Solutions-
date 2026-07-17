-- Problem: 1667. Fix Names in a Table
-- Difficulty: Easy
-- Table: Users(user_id, name)
-- Definitions:
--   user_id = primary key (unique ID for each user)
--   name    = string containing only lowercase/uppercase characters
-- Goal: Normalize names so that:
--       - First character is uppercase
--       - Remaining characters are lowercase
--       Return results ordered by user_id ASC.
-- Approach:
--   1. Use LEFT(name,1) → extract first character
--   2. Apply UPPER() → capitalize first character
--   3. Use SUBSTRING(name,2) → extract remaining characters
--   4. Apply LOWER() → convert rest to lowercase
--   5. CONCAT both parts → fixed name
--   6. ORDER BY user_id → ensure ascending order

SELECT user_id,
       CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;
