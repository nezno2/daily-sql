CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `TRIANGLES` (
    `A` INT,
    `B` INT,
    `C` INT
);

INSERT IGNORE INTO `TRIANGLES` (`A`, `B`, `C`) VALUES
(20, 20, 23),
(20, 20, 20),
(20, 21, 22),
(13, 14, 30);

SELECT 
CASE 
WHEN `A` + `B` <= `C` OR `A` + `C` <= `B` OR `B` + `C` <= `A`
THEN 'Not A Triangle'
WHEN `A` = `B` AND `B` = `C`
THEN 'Equilateral'
WHEN `A` = `B` OR `B` = `C` OR `A` = `C`
THEN 'Isosceles'
ELSE 'Scalene'
END AS `TRIANGLETYPE`
FROM `TRIANGLES`;