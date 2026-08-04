USE mini_project;

-- Find duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,industry,total_laid_off,
percentage_laid_off,`date`
) AS row_num
FROM layoff_2;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,
total_laid_off,percentage_laid_off,
`date`,stage,country,funds_raised_millions
) AS row_num
FROM layoff_2
)
SELECT *
FROM duplicate_cte
WHERE row_num>1;

-- Check NULL values

SELECT *
FROM layoff_2
WHERE `date` IS NULL;

-- Convert Date

SELECT
`date`,
STR_TO_DATE(`date`,'%m/%d/%y')
FROM layoff_2;

ALTER TABLE layoff_2
MODIFY COLUMN `date` DATE;