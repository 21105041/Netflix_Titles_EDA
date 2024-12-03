SELECT *
FROM netflix_title2;

-- Total number of titles available on netflix----------------
SELECT COUNT(*)
FROM netflix_title2;

-- Number of movies vs Tv shows---------------
SELECT `type`, COUNT(*)
FROM netflix_title2
GROUP BY `type`
ORDER BY 1;

-- Trend in Number of titles released each year------------------------
SELECT release_year, COUNT(*)
FROM netflix_title2
GROUP BY release_year
ORDER BY 1;

-- Number of titles produced in each country------------------
SELECT country, COUNT(*)
FROM netflix_title2
GROUP BY country
ORDER BY 2 DESC;

-- Genre popularity in different countries-------------------
SELECT country, listed_in, COUNT(*)
FROM netflix_title2
GROUP BY country, listed_in
ORDER BY 2 DESC;

-- determing most common genres----------------
SELECT listed_in, COUNT(*)
FROM netflix_title2
GROUP BY listed_in
ORDER BY 2 DESC
LIMIT 5;

-- genre popularity over years-------------------------
SELECT release_year, listed_in, COUNT(*)
FROM netflix_title2
GROUP BY release_year, listed_in
ORDER BY 3 DESC;

-- release_year trends-------------
SELECT release_year, COUNT(*)
FROM netflix_title2
GROUP BY release_year
ORDER BY 2 DESC;

-- ratings distribution-----------------
SELECT rating, COUNT(*)
FROM netflix_title2
GROUP BY rating
ORDER BY 2 DESC;

-- change in distribution of ratings over years----------------
SELECT rating, release_year, COUNT(*)
FROM netflix_title2
GROUP BY rating, release_year
ORDER BY 3 DESC;

-- average duration of each type of netflix titles -------------------
SELECT `type`, AVG(duration) as avg_duration_in_minutes
FROM netflix_title2
WHERE `type` = "Movie";

SELECT `type`, ROUND(AVG(duration),2) as avg_duration_in_seasons
FROM netflix_title2
WHERE `type` = "TV Show";

-- average duration of content across different genres--------------------------

-- for movies--------------------------
SELECT `type`, listed_in, AVG(duration)
FROM netflix_title2
WHERE `type` = "Movie"
GROUP BY `type`, listed_in
ORDER BY 3 DESC;

-- for TV Shows------------------------
SELECT `type`, listed_in, ROUND(AVG(duration),2) AS avg_duration 
FROM netflix_title2
WHERE `type` = "TV Show"
GROUP BY `type`, listed_in
ORDER BY 3 DESC;


-- average duration as per ratings------------------------------------

-- for Movies-----------------
SELECT `type`, rating, ROUND(AVG(duration),2) AS avg_duration
FROM netflix_title2
WHERE `type` = "Movie"
GROUP BY `type`, rating
ORDER BY 3 DESC;

-- for TV Shows-----------------
SELECT `type`, rating, ROUND(AVG(duration),2) AS avg_duration
FROM netflix_title2
WHERE `type` = "TV Show"
GROUP BY `type`, rating
ORDER BY 3 DESC;

-- directors with most titles on netflix-------------------
SELECT DISTINCT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, ',', numbers.n), ',', -1)) AS director_name, COUNT(*) AS appearance_count
FROM netflix_title2
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
    SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL 
    SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL 
    SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL 
    SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) numbers ON CHAR_LENGTH(cast) - CHAR_LENGTH(REPLACE(cast, ',', '')) >= numbers.n - 1
GROUP BY director_name
ORDER BY appearance_count DESC;


-- distinct actors that worked for different netflix and number of times they appeared in any netflix title-----------------------
-- alternative method using CTE---------------------------------------
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 20  -- Adjust this value if you have more than 20 actors in some titles
),
actors AS (
    SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(t.cast, ',', numbers.n), ',', -1)) AS actor_name
    FROM netflix_title2 AS t
    JOIN numbers ON CHAR_LENGTH(t.cast) - CHAR_LENGTH(REPLACE(t.cast, ',', '')) >= numbers.n - 1
)
SELECT actor_name, COUNT(*) AS appearance_count
FROM actors
GROUP BY actor_name
ORDER BY appearance_count DESC;


-- preferred genres of prolific directors-----------------

SELECT DISTINCT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, ',', numbers.n), ',', -1)) AS director_name, listed_in, COUNT(*)
FROM netflix_title2
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL 
    SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL 
    SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL 
    SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL 
    SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
) numbers ON CHAR_LENGTH(cast) - CHAR_LENGTH(REPLACE(cast, ',', '')) >= numbers.n - 1
GROUP BY director_name, listed_in
ORDER BY 3 DESC;

SELECT *
FROM netflix_title2;