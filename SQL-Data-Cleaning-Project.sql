create database mini_project;
use mini_project;
show tables;
select * from layoffs limit 5;

-- OBJECTIVE OF THE PROJECT
--  (i)   Remove duplicates 
--  (ii)  Standerdize The data --> Spellings or any other issue example = United states / U.S.A
--  (iii) Null values / blank values --> we have to handle this issue
--  (iv)  Remove any columns

-- WARNING --> WE NEVER WORK ON ORIGINAL DATA ( WE ALWAYS KEEP THE RAW DATA AS IS WE ALWAYS WORK ON THE COPY OF THE DATA)

-- ==============================================================================
-- 								STAGE 1
-- ==============================================================================

-- We make the copy of the data 
create table layoff_2 like layoffs;
describe layoff_2;
insert into layoff_2 select * from layoffs;
select count(*) from layoffs;
select count(*) from layoff_2;

-- ================================================================================
-- 							STAGE 2
-- ================================================================================

-- Find duplicates
select * from layoff_2;
select * , row_number() over(partition by company, industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoff_2;

with duplicate_cte as (
select * , row_number() over(partition by company, industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoff_2
)
select * from duplicate_cte where row_num>1;

select * from layoff_2 where company = "Oda";

with duplicate_cte as (
select *, row_number() over ( partition by
company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
) as row_num from layoff_2
)
select * from duplicate_cte where row_num >1;



select * from layoff_2 where company = "Casper";
with duplicate_cte as (
select *, row_number() over ( partition by
company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
) as row_num from layoff_2
)
delete  from duplicate_cte where row_num>1;

select row_number() over() as "serial No." , company,location,country from layoff_2;

select name,budget,year from movies m1 where budget > (select avg(budget) from movies m2
where m2.year = m1.year)
limit 30;







