-- Problem: 2356. Number of Unique Subjects Taught by Each Teacher
-- Difficulty: Easy
-- Table: Teacher(teacher_id, subject_id, dept_id)
-- Goal: Find the number of unique subjects each teacher teaches.
-- Approach:
--   1. Use COUNT(DISTINCT subject_id) to ensure uniqueness.
--   2. GROUP BY teacher_id to calculate per teacher.
--   3. Return teacher_id with subject count (alias as cnt).

SELECT teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
