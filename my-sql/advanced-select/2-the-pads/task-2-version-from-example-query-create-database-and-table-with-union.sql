CREATE DATABASE IF NOT EXISTS `mysql_database`;

USE `mysql_database`;

CREATE TABLE IF NOT EXISTS `occupations` (
    `name` VARCHAR(50),
    `occupation` VARCHAR(100)
);

INSERT IGNORE INTO `occupations` (`name`, `occupation`) VALUES
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

(SELECT 
CONCAT(`name`, '(', SUBSTR(`occupation`, 1, 1), ')') AS `occupation_and_occupation_count`
FROM `occupations`
ORDER BY `name` ASC)
UNION ALL
(SELECT
CONCAT('There are a total of ', COUNT(`occupation`), ' ', LOWER(`occupation`), 's.')
FROM `occupations`
GROUP BY `occupation`
ORDER BY COUNT(`occupation`), SUBSTR(`occupation`, 1, 1) ASC);