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

(SELECT 
CONCAT(`NAME`, '(', SUBSTR(`OCCUPATION`, 1, 1), ')') AS `OCCUPATION_AND_OCCUPATION_COUNT`
FROM `OCCUPATIONS`
ORDER BY `NAME` ASC)
UNION ALL 
(SELECT
CONCAT('There are a total of ', COUNT(`OCCUPATION`), ' ', LOWER(`OCCUPATION`), 's.')
FROM `OCCUPATIONS`
GROUP BY `OCCUPATION`
ORDER BY COUNT(`OCCUPATION`), SUBSTR(`OCCUPATION`, 1, 1) ASC);