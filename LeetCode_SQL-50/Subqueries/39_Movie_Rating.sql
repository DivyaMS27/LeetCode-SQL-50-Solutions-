-- Problem: 1341. Movie Rating
-- Difficulty: Medium
-- Tables:
--   Movies(movie_id, title)
--   Users(user_id, name)
--   MovieRating(movie_id, user_id, rating, created_at)
-- Goals:
--   1. Find the user who rated the greatest number of movies.
--      - In case of tie, return lexicographically smaller user name.
--   2. Find the movie with the highest average rating in February 2020.
--      - In case of tie, return lexicographically smaller movie title.
-- Approach:
--   Part 1 (UserCTE):
--     - Join MovieRating with Users
--     - Count ratings per user_id
--     - ORDER BY total ratings DESC, name ASC
--     - LIMIT 1 → ensures tie-breaking by lexicographic order
--   Part 2 (MovieCTE):
--     - Join MovieRating with Movies
--     - Filter created_at between '2020-02-01' and '2020-02-29'
--     - Calculate AVG(rating) per movie
--     - ORDER BY avg_rating DESC, title ASC
--     - LIMIT 1 → ensures tie-breaking by lexicographic order
--   Final:
--     - UNION results from both CTEs to return user name and movie title

# Write your MySQL query statement below
WITH USERCTE AS(
    SELECT 
    mr.user_id,
    u.name,
    COUNT(mr.user_id) AS total_users
    FROM MovieRating as mr
    JOIN Users as u
    On mr.user_id = u.user_id
    GROUP BY mr.user_id 
    ORDER BY total_users DESC ,name ASC
    LIMIT 1
)
,MOVIECTE AS(
    SELECT
    m.title,
    AVG(mr.rating) AS avg_rating
    FROM MovieRating as mr
    JOIN Movies as m
    ON mr.movie_id = m.movie_id
    WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
    GROUP BY mr.movie_id
    ORDER BY avg_rating DESC ,m.title ASC
    LIMIT 1
)
SELECT name AS results FROM USERCTE 
UNION ALL
SELECT title AS results FROM MOVIECTE 
    
    
