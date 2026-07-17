-- Problem: 1633. Percentage of Users Attended a Contest
-- Difficulty: Easy
-- Tables:
--   Users(user_id, user_name)
--   Register(contest_id, user_id)
-- Goal: Find the percentage of users registered in each contest.
--       Round to 2 decimal places.
--       Order results by percentage DESC, then contest_id ASC.
-- Approach:
--   1. RIGHT JOIN Register with Users to include all contest registrations.
--   2. COUNT users registered per contest.
--   3. Divide by total number of users (subquery).
--   4. Multiply by 100 to get percentage.
--   5. ROUND result to 2 decimals.
--   6. GROUP BY contest_id and ORDER BY percentage DESC, contest_id ASC.

SELECT r.contest_id,
       ROUND((COUNT(r.contest_id) / (SELECT COUNT(*) FROM Users)) * 100, 2) AS percentage
FROM Users AS u
RIGHT JOIN Register AS r
ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;
