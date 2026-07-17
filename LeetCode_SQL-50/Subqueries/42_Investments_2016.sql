-- Problem: 585. Investments in 2016
-- Difficulty: Medium
-- Table: Insurance(pid, tiv_2015, tiv_2016, lat, lon)
-- Definitions:
--   pid       = primary key (unique policyholder ID)
--   tiv_2015  = total investment value in 2015
--   tiv_2016  = total investment value in 2016
--   lat, lon  = latitude & longitude of policyholder’s city (not NULL)
-- Goal: Report the sum of tiv_2016 for policyholders who:
--       1. Share the same tiv_2015 value with at least one other policyholder
--       2. Are located in a unique city (distinct lat/lon pair)
--       Round the result to 2 decimal places.
-- Approach:
--   1. Identify tiv_2015 values that appear more than once → GROUP BY tiv_2015 HAVING COUNT(*) > 1
--   2. Identify unique city coordinates → GROUP BY lat, lon HAVING COUNT(*) = 1
--   3. Filter Insurance table using both conditions
--   4. SUM tiv_2016 of qualifying rows
--   5. ROUND result to 2 decimals

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
