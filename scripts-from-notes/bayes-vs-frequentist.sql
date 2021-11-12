-- This script is not intended to be run in one go.
-- It is a code dump of a number of related examples from the notes.
-- It is here for you to experiment with as you follow the notes.

CREATE DATABASE StackExchange;
GO -- only use GO in T-SQL, remove GO for MySQL

USE StackExchange;
GO -- only use GO in T-SQL, remove GO for MySQL

CREATE TABLE Posts (
  Id INT NOT NULL,
  CreationDate DATETIME,
  Score INT,
  ViewCount INT,
  Body VARCHAR(100),
  PRIMARY KEY (Id)
);

INSERT INTO Posts 
VALUES
(1, '2020-01-01',1,200,'dummy text'),
(2, '2020-02-01',1,200,'dummy frequentist'),
(3, '2020-03-01',1,200,'dummy text'),
(4, '2020-03-01',1,200,'dummy bayesian');

-- ----------------------------------
-- FASTBALL TESTING / WRITING THE QUERY
-- ----------------------------------

-- step 1
SELECT MONTH(CreationDate) AS CreationMonth,
       CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
            WHEN Body LIKE '%bayesian%' THEN 'B'
            END AS Category
FROM Posts;


-- ----------------------------------

-- step 2
INSERT INTO Posts VALUES
(5, '2021-01-01',1,200,'dummy frequentist');

SELECT MONTH(CreationDate) AS CreationMonth,
       CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
            WHEN Body LIKE '%bayesian%' THEN 'B'
            END AS Category
FROM Posts
WHERE YEAR(CreationDate) <= 2020 
      AND Body LIKE '%bayesian%' OR Body LIKE '%frequentist%';

-- ----------------------------------

-- step 3
INSERT INTO Posts VALUES
(6, '2020-03-01',2,200,'dummy bayesian');

SELECT * FROM Posts;

SELECT AVG(Score) AvgScore,
       MONTH(CreationDate) AS CreationMonth,
       CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
            WHEN Body LIKE '%bayesian%' THEN 'B'
            END AS Category
FROM Posts
WHERE YEAR(CreationDate) <= 2020 
      AND (Body LIKE '%bayesian%' OR Body LIKE '%frequentist%')
GROUP BY MONTH(CreationDate), 
         CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
              WHEN Body LIKE '%bayesian%' THEN 'B'
              END;

-- ----------------------------------

-- step 4
SELECT AVG(CAST(Score AS DECIMAL)) AvgScore,
       AVG(CAST(ViewCount AS DECIMAL)) AS AvgViews,
       COUNT(*) AS NumPosts,
       MONTH(CreationDate) AS CreationMonth,
       CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
            WHEN Body LIKE '%bayesian%' THEN 'B'
            END AS Category
FROM Posts
WHERE YEAR(CreationDate) <= 2020
      AND (Body LIKE '%bayesian%' OR Body LIKE '%frequentist%')
GROUP BY MONTH(CreationDate), 
        CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
             WHEN Body LIKE '%bayesian%' THEN 'B'
             END;


-- ----------------------------------
-- REDUCING REPETITION
-- ----------------------------------

-- cleaning, step 1
WITH PostCats AS (
    SELECT MONTH(CreationDate) AS CreationMonth,
           CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
                WHEN Body LIKE '%bayesian%' THEN 'B'
                END AS Category
    FROM Posts
    WHERE YEAR(CreationDate) <= 2020
    )
SELECT *
FROM PostCats;

-- -----------------------------------

-- cleaning, step 2
WITH PostCats AS (
    SELECT MONTH(CreationDate) AS CreationMonth,
           CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
                WHEN Body LIKE '%bayesian%' THEN 'B'
                END AS Category
    FROM Posts
    WHERE YEAR(CreationDate) <= 2020
    )
SELECT CreationMonth, Category
FROM PostCats
WHERE Category IS NOT NULL
GROUP BY CreationMonth, Category;

-- -----------------------------------

-- cleaning, step 3
WITH PostCats AS (
    SELECT  MONTH(CreationDate) AS CreationMonth,
            CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
                 WHEN Body LIKE '%bayesian%' THEN 'B'
                 END AS Category,
    CAST(Score AS DECIMAL) AS Score,
    CAST(ViewCount AS DECIMAL) AS ViewCount
    FROM Posts
    WHERE YEAR(CreationDate) <= 2020
    )
SELECT CreationMonth, Category,
       AVG(Score) AS AvgScore, 
       AVG(ViewCount) AS AvgViews,
       COUNT(*) AS NumPosts
FROM PostCats
WHERE Category IS NOT NULL
GROUP BY CreationMonth, Category;

-- here is a link to the query, hosted on Stack Exchange:
-- https://data.stackexchange.com/stats/query/1509266/score-and-views-for-bayesian-vs-frequentist


-- ----------------------------------
-- VALIDITY TESTING
-- ----------------------------------

-- example 1

WITH Posts (Id, CreationDate, Score, ViewCount, Body) AS (
  SELECT 1,'2019-01-01',1,200,'dummy frequentist'
  UNION ALL
  SELECT 2,'2020-01-01',1,200,'dummy frequentist'
  UNION ALL
  SELECT 3,'2021-01-01',1,200,'dummy frequentist'
  UNION ALL
  SELECT 4,NULL,1,200,'dummy frequentist'
), 
PostCats AS ( 
SELECT  MONTH(CreationDate) AS CreationMonth,
		CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
				WHEN Body LIKE '%bayesian%' THEN 'B'
				END AS Category,
CAST(Score AS DECIMAL) AS Score,
CAST(ViewCount AS DECIMAL) AS ViewCount
FROM Posts
WHERE YEAR(CreationDate) <= 2020
)
SELECT CreationMonth, Category,
       AVG(Score) AS AvgScore, 
       AVG(ViewCount) AS AvgViews,
       COUNT(*) AS NumPosts
FROM PostCats
WHERE Category IS NOT NULL
GROUP BY CreationMonth, Category;

-- example 2

WITH Posts (Id, CreationDate, Score, ViewCount, Body) AS (
  SELECT 1,'2020-01-01',1,200,'dummy FREQUENTIST'
  UNION ALL
  SELECT 2,'2020-01-01',1,200,'dummy FREQUENTIST dummy'
  UNION ALL
  SELECT 3,'2020-01-01',1,200,'FREQUENTIST dummy'
  UNION ALL
  SELECT 4,'2020-01-01',1,200,NULL
), 
PostCats AS ( 
SELECT  MONTH(CreationDate) AS CreationMonth,
		CASE WHEN Body LIKE '%frequentist%' THEN 'F' 
				WHEN Body LIKE '%bayesian%' THEN 'B'
				END AS Category,
CAST(Score AS DECIMAL) AS Score,
CAST(ViewCount AS DECIMAL) AS ViewCount
FROM Posts
WHERE YEAR(CreationDate) <= 2020
)
SELECT CreationMonth, Category,
       AVG(Score) AS AvgScore, 
       AVG(ViewCount) AS AvgViews,
       COUNT(*) AS NumPosts
FROM PostCats
WHERE Category IS NOT NULL
GROUP BY CreationMonth, Category;

-- delete the database
DROP DATABASE StackExchange;
GO