CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `OCCUPATIONS` (
    `NAME` VARCHAR(50),
    `OCCUPATION` VARCHAR(100)
);

INSERT IGNORE INTO `OCCUPATIONS` (`NAME`, `OCCUPATION`) VALUES
('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashley', 'Professor'),
('Ketty', 'Professor'),
('Christeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');

SELECT 
CONCAT(`NAME`, '(', SUBSTR(`OCCUPATION`, 1, 1), ')') AS `OCCUPATION_BY_PERSON`
FROM `OCCUPATIONS`
ORDER BY `NAME` ASC;

SELECT
CONCAT('There are a total of ', COUNT(`OCCUPATION`), ' ', LOWER(`OCCUPATION`), 's.') AS `OCCUPATION_COUNT`
FROM `OCCUPATIONS`
GROUP BY `OCCUPATION`
ORDER BY COUNT(`OCCUPATION`), SUBSTR(`OCCUPATION`, 1, 1) ASC;