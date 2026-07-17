-- Problem: 596. Classes With at Least 5 Students
-- Difficulty: Easy
-- Table: Courses(student, class)
-- Goal: Find all classes that have at least 5 students enrolled.
-- Approach:
--   1. GROUP BY class to aggregate students per class
--   2. Use COUNT(class) to count number of students in each class
--   3. Apply HAVING COUNT(class) >= 5 to filter classes with 5 or more students
--   4. Return class names in any order

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;
