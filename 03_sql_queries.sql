USE mini_project;

SELECT
ROW_NUMBER() OVER() AS "Serial No.",
company,
location,
country
FROM layoff_2;

SELECT
name,
budget,
year
FROM movies m1
WHERE budget >
(
SELECT AVG(budget)
FROM movies m2
WHERE m2.year=m1.year
)
LIMIT 30;