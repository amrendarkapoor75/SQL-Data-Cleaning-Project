USE mini_project;

SELECT
ROW_NUMBER() OVER() AS "Serial No.",
company,
location,
country
FROM layoff_2;

