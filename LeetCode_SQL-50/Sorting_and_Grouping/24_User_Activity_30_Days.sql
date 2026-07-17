-- Problem: 1141. User Activity for the Past 30 Days I
-- Difficulty: Easy
-- Table: Activity(user_id, session_id, activity_date, activity_type)
-- Goal: Find the daily active user count for the 30-day period
--       ending on 2019-07-27 (inclusive).
--       A user is considered active if they performed
--       at least one activity on that day.
-- Approach:
--   1. Filter rows where activity_date is between '2019-06-28' and '2019-07-27'
--   2. Use COUNT(DISTINCT user_id) to count unique active users per day
--   3. GROUP BY activity_date to get daily counts
--   4. Alias activity_date as 'day' for clarity

SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
