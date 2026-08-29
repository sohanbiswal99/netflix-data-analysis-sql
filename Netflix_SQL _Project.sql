create database Netflix ;
-- .1) Count the number of Movies vs TV Shows

SELECT 
    type,
    COUNT(*) AS total_count
FROM netflix.netflix_titles
GROUP BY type;
-- 2)  Find the most common rating for movies and TV shows ?

SELECT 
    type,
    rating,
    COUNT(*) AS rating_count
FROM netflix.netflix_titles
WHERE rating IS NOT NULL
GROUP BY type, rating
ORDER BY type, rating_count DESC;

-- 3)  List all movies released in a specific year (e.g., 2020) ?
SELECT title
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND release_year = 2020;
  -- 4)Find the top 5 countries with the most content on Netflix ?
  SELECT
    TRIM(j.country) AS country,
    COUNT(*) AS total_content
FROM netflix.netflix_titles AS n
JOIN JSON_TABLE(
    CONCAT('["', REPLACE(n.country, ',', '","'), '"]'),
    '$[*]' COLUMNS (
        country VARCHAR(100) PATH '$'
    )
) AS j
WHERE n.country IS NOT NULL
  AND TRIM(j.country) <> ''
GROUP BY TRIM(j.country)
ORDER BY total_content DESC
LIMIT 5;

-- 5) Identify the longest movie ?
SELECT 
    title,
    duration
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND duration IS NOT NULL
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC
LIMIT 1;

-- 6) Find content added in the last 5 years ?
SELECT *
FROM netflix.netflix_titles
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= 
      DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- 7) Find all the movies/TV shows by director 'Rajiv Chilaka'?
SELECT 
    title,
    type,
    director,
    release_year
FROM netflix.netflix_titles
WHERE director = 'Rajiv Chilaka';

-- 8)  List all TV shows with more than 5 seasons ?

SELECT 
    title,
    duration
FROM netflix.netflix_titles
WHERE type = 'TV Show'
  AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC;

-- 9) Count the number of content items in each genre ?
SELECT 
    listed_in AS genre,
    COUNT(*) AS total_content
FROM netflix.netflix_titles
WHERE listed_in IS NOT NULL
GROUP BY listed_in
ORDER BY total_content DESC;

-- 10) Find each year and the average numbers of content release in India on netflix. 
-- return top 5 year with highest avg content release ?
SELECT 
    release_year,
    COUNT(*) AS total_content,
    AVG(COUNT(*)) OVER () AS avg_content
FROM netflix.netflix_titles
WHERE country LIKE '%India%'
GROUP BY release_year
ORDER BY total_content DESC
LIMIT 5;

-- 11 )  List all movies that are documentaries ?
SELECT 
    title,
    type,
    listed_in,
    release_year
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND listed_in LIKE '%Documentaries%';
  
  -- 12 )  Find all content without a director ?
  SELECT 
    title,
    type,
    director,
    release_year
FROM netflix.netflix_titles
WHERE director IS NULL;

-- 13)  Find how many movies actor 'Salman Khan' appeared in last 10 years ?
SELECT COUNT(*) AS total_movies
FROM netflix.netflix_titles
WHERE type = 'Movie'
  AND `cast` LIKE '%Salman Khan%'
  AND release_year >= YEAR(CURDATE()) - 10;
  
  -- 14 )  Find the top 10 actors who have appeared in the highest number of movies produced in India ?
  SELECT
    TRIM(j.actor) AS actor,
    COUNT(*) AS movie_count
FROM netflix.netflix_titles AS n
JOIN JSON_TABLE(
    CONCAT('["', REPLACE(n.`cast`, ',', '","'), '"]'),
    '$[*]' COLUMNS (
        actor VARCHAR(100) PATH '$'
    )
) AS j
WHERE n.type = 'Movie'
  AND n.country LIKE '%India%'
  AND n.`cast` IS NOT NULL
GROUP BY TRIM(j.actor)
ORDER BY movie_count DESC
LIMIT 10;

-- 15 ) Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category. ?
SELECT
    CASE
        WHEN LOWER(description) LIKE '%kill%'
          OR LOWER(description) LIKE '%violence%'
        THEN 'Bad'
        ELSE 'Good'
    END AS category,
    COUNT(*) AS total_content
FROM netflix.netflix_titles
GROUP BY category;
      

