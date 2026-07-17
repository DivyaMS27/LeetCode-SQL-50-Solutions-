-- Problem: 1661. Average Time of Process per Machine
-- Difficulty: Easy
-- Table: Activity(machine_id, process_id, activity_type, timestamp)
-- Goal: Calculate the average time each machine takes to complete a process
--       (end timestamp - start timestamp), rounded to 3 decimal places.
-- Approach:
--   1. Use conditional aggregation with CASE to compute duration per process
--   2. Build a CTE to store duration for each (machine_id, process_id)
--   3. Take AVG(duration) per machine_id and ROUND to 3 decimals

WITH CTE AS (
    SELECT machine_id,
           process_id,
           MAX(CASE WHEN activity_type = 'end' THEN timestamp END) -
           MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS duration
    FROM Activity
    GROUP BY machine_id, process_id
)
SELECT machine_id,
       ROUND(AVG(duration), 3) AS processing_time
FROM CTE
GROUP BY machine_id;
