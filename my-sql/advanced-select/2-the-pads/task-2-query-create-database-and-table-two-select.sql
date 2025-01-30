CREATE DATABASE IF NOT EXISTS `mysql_database`;

USE `mysql_database`;

CREATE TABLE IF NOT EXISTS `occupations` (
    `name` VARCHAR(50),
    `occupation` VARCHAR(100)
);

INSERT IGNORE INTO `occupations` (`name`, `occupation`) VALUES
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
CONCAT(`name`, '(', SUBSTR(`occupation`, 1, 1), ')') AS `occupation_by_person`
FROM `occupations`
ORDER BY `name` ASC;

SELECT
CONCAT('There are a total of ', COUNT(`occupation`), ' ', LOWER(`occupation`), 's.') AS `occupation_count`
FROM `occupations`
GROUP BY `occupation`
ORDER BY COUNT(`occupation`), SUBSTR(`occupation`, 1, 1) ASC;