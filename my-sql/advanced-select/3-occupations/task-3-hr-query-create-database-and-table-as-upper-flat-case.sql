CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `OCCUPATIONS` (
    `NAME` VARCHAR(50),
    `OCCUPATION` VARCHAR(100)
);

INSERT IGNORE INTO `OCCUPATIONS` (`NAME`, `OCCUPATION`) VALUES
('Ashley', 'Professor'),
('Samantha', 'Actor'),
('Julia', 'Doctor'),
('Britney', 'Professor'),
('Maria', 'Professor'),
('Meera', 'Professor'),
('Priya', 'Doctor'),
('Priyanka', 'Professor'),
('Jennifer', 'Actor'),
('Ketty', 'Actor'),
('Belvet', 'Professor'),
('Naomi', 'Professor'),
('Jane', 'Singer'),
('Jenny', 'Singer'),
('Kristeen', 'Singer'),
('Christeen', 'Singer'),
('Eve', 'Actor'),
('Aamina', 'Doctor');

SELECT 
`NAME`,
`OCCUPATION`,
ROW_NUMBER() OVER (PARTITION BY `OCCUPATION` ORDER BY `NAME`) AS `ROW_NUMBER`
FROM `OCCUPATIONS`;

WITH `PROFESSION` AS (
SELECT 
	`NAME`,
	`OCCUPATION`,
	ROW_NUMBER() OVER (PARTITION BY `OCCUPATION` ORDER BY `NAME`) AS `ROW_NUMBER`
FROM `OCCUPATIONS`
)
SELECT
    MAX(CASE WHEN `OCCUPATION` = 'Doctor' THEN `NAME` END) AS `DOCTOR`,
    MAX(CASE WHEN `OCCUPATION` = 'Professor' THEN `NAME` END) AS `PROFESSOR`,
    MAX(CASE WHEN `OCCUPATION` = 'Singer' THEN `NAME` END) AS `SINGER`,
    MAX(CASE WHEN `OCCUPATION` = 'Actor' THEN `NAME` END) AS `ACTOR`
FROM `PROFESSION`
GROUP BY `ROW_NUMBER`
ORDER BY `ROW_NUMBER`;