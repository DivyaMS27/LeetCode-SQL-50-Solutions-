-- Problem: 1934. Confirmation Rate
-- Difficulty: Medium
-- Tables:
--   Signups(user_id, time_stamp)
--   Confirmations(user_id, time_stamp, action)
-- Goal: Calculate each user's confirmation rate:
--       (# of confirmed messages) / (total confirmation requests).
--       If a user has no requests, rate = 0.
--       Round the result to 2 decimal places.
-- Approach:
--   1. LEFT JOIN Signups with Confirmations on user_id
--   2. Use CASE to count confirmed actions
--   3. Divide confirmed count by total requests per user
--   4. ROUND result to 2 decimals
--   5. GROUP BY user_id for final output

SELECT s.user_id,
       ROUND(
         CAST(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) AS FLOAT)
         / COUNT(s.user_id),
         2
       ) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id;
