CREATE DATABASE mini_project;
USE mini_project;

SHOW TABLES;

SELECT * FROM layoffs LIMIT 5;

-- Create a copy of the original table
CREATE TABLE layoff_2 LIKE layoffs;

INSERT INTO layoff_2
SELECT * FROM layoffs;

SELECT COUNT(*) FROM layoffs;
SELECT COUNT(*) FROM layoff_2;