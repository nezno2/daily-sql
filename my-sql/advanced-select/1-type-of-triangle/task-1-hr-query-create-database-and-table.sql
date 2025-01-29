CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `TRIANGLES` (
    `A` INT,
    `B` INT,
    `C` INT
);

INSERT IGNORE INTO `TRIANGLES` (`A`, `B`, `C`) VALUES
(10, 10, 10),
(11, 11, 11),
(30, 32, 30),
(40, 40, 40),
(20, 20, 21),
(21, 21, 21),
(20, 22, 21),
(20, 20, 40),
(20, 22, 21),
(30, 32, 41),
(50, 22, 51),
(20, 12, 61),
(20, 22, 50),
(50, 52, 51),
(80, 80, 80),
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