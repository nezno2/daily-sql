CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `OCCUPATIONS` (
    `Name` VARCHAR(50),
    `Occupation` VARCHAR(100)
);

INSERT IGNORE INTO `OCCUPATIONS` (`Name`, `Occupation`) VALUES
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
`Name`,
`Occupation`,
ROW_NUMBER() OVER (PARTITION BY `Occupation` ORDER BY `Name`) AS `Row Number`
FROM `OCCUPATIONS`;

WITH `PROFESSION` AS (
SELECT 
	`Name`,
	`Occupation`,
	ROW_NUMBER() OVER (PARTITION BY `Occupation` ORDER BY `Name`) AS `Row Number`
FROM `OCCUPATIONS`
)
SELECT
    MAX(CASE WHEN `Occupation` = 'Doctor' THEN `Name` END) AS `Doctor`,
    MAX(CASE WHEN `Occupation` = 'Professor' THEN `Name` END) AS `Professor`,
    MAX(CASE WHEN `Occupation` = 'Singer' THEN `Name` END) AS `Singer`,
    MAX(CASE WHEN `Occupation` = 'Actor' THEN `Name` END) AS `Actor`
FROM `PROFESSION`
GROUP BY `Row Number`
ORDER BY `Row Number`;