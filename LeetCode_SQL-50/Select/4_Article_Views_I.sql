-- Problem: 1148. Article Views I
-- Difficulty: Easy
-- Table: Views(article_id, author_id, viewer_id, view_date)
-- Goal: Find authors who viewed at least one of their own articles
--       Return distinct author IDs sorted in ascending order
-- Approach: Filter rows where author_id = viewer_id,
--           then select DISTINCT viewer_id as id and ORDER BY id

SELECT DISTINCT viewer_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
