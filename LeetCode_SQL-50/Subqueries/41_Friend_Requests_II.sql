-- Problem: 602. Friend Requests II: Who Has the Most Friends
-- Difficulty: Medium
-- Table: RequestAccepted(requester_id, accepter_id, accept_date)
-- Definitions:
--   (requester_id, accepter_id) = primary key
--   requester_id = user who sent the request
--   accepter_id  = user who accepted the request
--   accept_date  = date when request was accepted
-- Goal: Find the user with the most friends and the number of friends.
--       Each accepted request creates a friendship between requester and accepter.
--       Only one person has the maximum number of friends in test cases.
-- Approach:
--   1. UNION ALL requester_id and accepter_id → treat both as "friend IDs"
--   2. COUNT occurrences of each ID → total number of friendships per user
--   3. GROUP BY ID → aggregate counts
--   4. ORDER BY num DESC → highest friend count first
--   5. LIMIT 1 → return only the top user

WITH CTE AS (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id,
       COUNT(id) AS num
FROM CTE
GROUP BY id
ORDER BY num DESC
LIMIT 1;
