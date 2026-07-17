-- Problem: 1517. Find Users With Valid E-Mails
-- Difficulty: Easy
-- Table: Users(user_id, name, mail)
-- Definitions:
--   user_id = primary key (unique ID for each user)
--   name    = user’s name
--   mail    = email address (may be valid or invalid)
-- Goal: Find users with valid emails.
--       Valid email rules:
--         1. Prefix must start with a letter
--         2. Prefix may contain letters, digits, underscore (_), period (.), or dash (-)
--         3. Domain must be exactly '@leetcode.com' in lowercase
-- Approach:
--   1. Use REGEXP to validate email format
--   2. Pattern explanation:
--        ^[a-zA-Z]           → prefix starts with a letter
--        [a-zA-Z0-9._-]*     → allowed characters in prefix
--        @leetcode\\.com$    → exact domain match
--   3. Return all columns for valid users

SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@(?-i)leetcode\\.com$';
