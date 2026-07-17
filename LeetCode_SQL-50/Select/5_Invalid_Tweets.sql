-- Problem: 1683. Invalid Tweets
-- Difficulty: Easy
-- Table: Tweets(tweet_id, content)
-- Goal: Find IDs of tweets where content length > 15 characters
-- Approach: Use LENGTH() function in WHERE clause to filter invalid tweets

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
