SELECT *
FROM netflix_titles;

CREATE TABLE netflix_title1
LIKE netflix_titles;

INSERT netflix_title1
SELECT *
FROM netflix_titles;

SELECT *
FROM netflix_title1;

SELECT `MyUnknownColumn`, `MyUnknownColumn_[0]`, `MyUnknownColumn_[1]`, `MyUnknownColumn_[2]`, `MyUnknownColumn_[3]`, `MyUnknownColumn_[4]`,
 `MyUnknownColumn_[5]`, `MyUnknownColumn_[6]`, `MyUnknownColumn_[7]`, `MyUnknownColumn_[8]`, `MyUnknownColumn_[9]`,`MyUnknownColumn_[10]`,
  `MyUnknownColumn_[11]`, `MyUnknownColumn_[12]`
FROM netflix_titles;

ALTER TABLE netflix_titles 
DROP COLUMN `MyUnknownColumn`, 
DROP COLUMN `MyUnknownColumn_[0]`, 
DROP COLUMN `MyUnknownColumn_[1]`, 
DROP COLUMN `MyUnknownColumn_[2]`, 
DROP COLUMN `MyUnknownColumn_[3]`, 
DROP COLUMN `MyUnknownColumn_[4]`, 
DROP COLUMN `MyUnknownColumn_[5]`, 
DROP COLUMN `MyUnknownColumn_[6]`, 
DROP COLUMN `MyUnknownColumn_[7]`, 
DROP COLUMN `MyUnknownColumn_[8]`, 
DROP COLUMN `MyUnknownColumn_[9]`, 
DROP COLUMN `MyUnknownColumn_[10]`, 
DROP COLUMN `MyUnknownColumn_[11]`, 
DROP COLUMN `MyUnknownColumn_[12]`;

ALTER TABLE netflix_title1 
DROP COLUMN `MyUnknownColumn`, 
DROP COLUMN `MyUnknownColumn_[0]`, 
DROP COLUMN `MyUnknownColumn_[1]`, 
DROP COLUMN `MyUnknownColumn_[2]`, 
DROP COLUMN `MyUnknownColumn_[3]`, 
DROP COLUMN `MyUnknownColumn_[4]`, 
DROP COLUMN `MyUnknownColumn_[5]`, 
DROP COLUMN `MyUnknownColumn_[6]`, 
DROP COLUMN `MyUnknownColumn_[7]`, 
DROP COLUMN `MyUnknownColumn_[8]`, 
DROP COLUMN `MyUnknownColumn_[9]`, 
DROP COLUMN `MyUnknownColumn_[10]`, 
DROP COLUMN `MyUnknownColumn_[11]`, 
DROP COLUMN `MyUnknownColumn_[12]`;

SELECT *
FROM netflix_title1;

CREATE TABLE `netflix_title2` (
  `show_id` text,
  `type` text,
  `title` text,
  `director` text,
  `cast` text,
  `country` text,
  `date_added` text,
  `release_year` int DEFAULT NULL,
  `rating` text,
  `duration` text,
  `listed_in` text,
  `description` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT netflix_title2
SELECT *, 
ROW_NUMBER() OVER(
	PARTITION BY `show_id`, `type`, `title`, `director`, `cast`, `country`, `date_added`, `release_year`, `rating`, `duration`, 
    `listed_in`, `description`)AS row_num
FROM netflix_titles;

SELECT *
FROM netflix_title2;

SELECT *
FROM netflix_title2
WHERE row_num > 1;
-- No duplicates found------------------------------


SELECT *
FROM netflix_title2
WHERE  director = '';

DELETE
FROM netflix_title2
WHERE  cast = '';

SELECT DISTINCT director
FROM netflix_title2
ORDER BY 1;

-- most frequently occuring country---------------------
SELECT country, COUNT(*) as count
FROM netflix_title2
WHERE country != ''
GROUP BY country
ORDER BY count DESC
LIMIT 1;

-- interpolating missing values in country column-----------------------------
UPDATE netflix_title2
SET country = 'United States'
WHERE country = '';


-- most frequently occuring director name-----------------
SELECT director, COUNT(*) as count
FROM netflix_title2
WHERE director != ''
GROUP BY director
ORDER BY count DESC;

SELECT *
FROM netflix_title2
WHERE director = '';

UPDATE netflix_title2
SET director = 'Unknown'
WHERE director = '';

SELECT *
FROM netflix_title2;

SELECT title
FROM netflix_title2
WHERE title REGEXP '[^a-zA-Z0-9 ,\-:()&!]';


DELETE 
FROM netflix_title2
WHERE title LIKE '%ShippA%';

SELECT *
FROM netflix_title2;

DELETE
FROM netflix_title2
WHERE director REGEXP '[^a-zA-Z .,&-]';

DELETE 
FROM netflix_title2
WHERE cast REGEXP '[^a-zA-Z \,\'\.\-]';

SELECT *
FROM netflix_title2;

-- formatting "date_added" column-----------------------------------

ALTER TABLE netflix_title2
MODIFY COLUMN `date_added` DATE;

SELECT *
FROM netflix_title2;

UPDATE netflix_title2 nt2
JOIN netflix_titles nt
		ON nt2.show_id = nt.show_id
SET nt2.date_added = nt.date_added
WHERE nt.date_added IS NOT NULL;

SELECT *
FROM netflix_title2;

