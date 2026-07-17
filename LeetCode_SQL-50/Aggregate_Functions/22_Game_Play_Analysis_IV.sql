-- Problem: 550. Game Play Analysis IV
-- Difficulty: Medium
-- Table: Activity(player_id, device_id, event_date, games_played)
-- Goal: Report the fraction of players who logged in again
--       on the day immediately after their first login,
--       rounded to 2 decimal places.
-- Approach:
--   1. Use window functions (LAG, ROW_NUMBER) to track each player's login sequence
--   2. Identify the first login (rownum = 1) and check if the next login (rownum = 2)
--      occurred exactly one day later (event_date = previous_date + 1 day)
--   3. Count players who satisfy this condition
--   4. Divide by total distinct players to get fraction
--   5. ROUND result to 2 decimals

WITH CTE AS (
    SELECT player_id,
           event_date,
           LAG(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS previous_date,
           ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rownum
    FROM Activity
)
SELECT ROUND(
           SUM(CASE WHEN event_date = previous_date + INTERVAL 1 DAY AND rownum = 2 THEN 1 ELSE 0 END)
           / (SELECT COUNT(DISTINCT player_id) FROM Activity),
           2
       ) AS fraction
FROM CTE;
