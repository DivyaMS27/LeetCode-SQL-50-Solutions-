-- Problem: 1280. Students and Examinations
-- Difficulty: Easy
-- Tables:
--   Students(student_id, student_name)
--   Subjects(subject_name)
--   Examinations(student_id, subject_name)
-- Goal: Find the number of times each student attended each exam.
--       Return results ordered by student_id and subject_name.
-- Approach:
--   1. Use CROSS JOIN between Students and Subjects to ensure all combinations.
--   2. LEFT JOIN with Examinations to count attendance per student per subject.
--   3. Use COUNT() to calculate attended exams.
--   4. GROUP BY student_id, student_name, subject_name.
--   5. ORDER BY student_id, subject_name for final output.

SELECT st.student_id,
       st.student_name,
       su.subject_name,
       COUNT(ex.subject_name) AS attended_exams
FROM Students AS st
CROSS JOIN Subjects AS su
LEFT JOIN Examinations AS ex
ON ex.student_id = st.student_id AND ex.subject_name = su.subject_name
GROUP BY su.subject_name, st.student_id, st.student_name
ORDER BY st.student_id, su.subject_name;
