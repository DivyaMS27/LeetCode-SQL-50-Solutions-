-- Problem: 626. Exchange Seats
-- Difficulty: Medium
-- Table: Seat(id, student)
-- Definitions:
--   id = seat number (starts from 1, increments continuously)
--   student = student name
-- Goal: Swap the seat id of every two consecutive students.
--       If the number of students is odd, the last student keeps their seat.
-- Approach:
--   1. Use window functions (ROW_NUMBER, LAG, LEAD) to track seat positions
--   2. Identify odd/even positions:
--        - If rownum is odd → swap with next student
--        - If rownum is even → swap with previous student
--        - If last student and odd count → keep seat unchanged
--   3. Return id and swapped student values
--   4. ORDER BY id ASC for final output

WITH CTE AS (
    SELECT id,
           student,
           ROW_NUMBER() OVER (ORDER BY id) AS rownum,
           COUNT(*) OVER () AS total_count,
           LAG(student) OVER (ORDER BY id) AS prev,
           LEAD(student) OVER (ORDER BY id) AS next
    FROM Seat
)
SELECT id,
       CASE
           WHEN rownum = total_count AND rownum % 2 != 0 THEN student
           WHEN rownum % 2 != 0 THEN next
           ELSE prev
       END AS student
FROM CTE
ORDER BY id;
