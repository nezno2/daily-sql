CREATE DATABASE IF NOT EXISTS `mysql_database`;

USE `mysql_database`;

CREATE TABLE IF NOT EXISTS `occupations` (
    `name` VARCHAR(50),
    `occupation` VARCHAR(100),
	PRIMARY KEY (`name`, `occupation`)
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

WITH `profession` AS (
SELECT 
	`name`,
	`occupation`,
	ROW_NUMBER() OVER (PARTITION BY `occupation` ORDER BY `name`) AS `row_number`
FROM `occupations`
)
SELECT
    MAX(CASE WHEN `occupation` = 'Doctor' THEN `name` END) AS `doctor`,
    MAX(CASE WHEN `occupation` = 'Professor' THEN `name` END) AS `professor`,
    MAX(CASE WHEN `occupation` = 'Singer' THEN `name` END) AS `singer`,
    MAX(CASE WHEN `occupation` = 'Actor' THEN `name` END) AS `actor`
FROM `profession`
GROUP BY `row_number`
ORDER BY `row_number`;