-- Problem: 1729. Find Followers Count
-- Difficulty: Easy
-- Table: Followers(user_id, follower_id)
-- Goal: For each user, return the number of followers.
--       Order the result by user_id in ascending order.
-- Approach:
--   1. GROUP BY user_id to aggregate followers per user
--   2. Use COUNT(follower_id) to count followers
--   3. Alias result as followers_count
--   4. ORDER BY user_id ASC for final output

SELECT user_id,
       COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
