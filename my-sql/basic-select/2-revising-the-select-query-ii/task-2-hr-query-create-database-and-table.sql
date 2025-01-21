CREATE DATABASE IF NOT EXISTS `hr_database`;

USE `hr_database`;

CREATE TABLE IF NOT EXISTS `CITY` (
    `ID` INT NOT NULL PRIMARY KEY,
    `NAME` VARCHAR(17),
    `COUNTRYCODE` VARCHAR(3),
    `DISTRICT` VARCHAR(20),
    `POPULATION` INT
);

INSERT INTO `CITY` (`ID`, `NAME`, `COUNTRYCODE`, `DISTRICT`, `POPULATION`) VALUES
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3965, 'Corona', 'USA', 'California', 124966),
(3973, 'Concord', 'USA', 'California', 121780),
(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
(3982, 'Coral Springs', 'USA', 'Florida', 117549),
(4054, 'Fairfield', 'USA', 'California', 92256),
(4058, 'Boulder', 'USA', 'Colorado', 91238),
(4061, 'Fall River', 'USA', 'Massachusetts', 90555)
AS `CITYNEW`
ON DUPLICATE KEY UPDATE 
    `NAME` = `CITYNEW`.`NAME`,
    `COUNTRYCODE` = `CITYNEW`.`COUNTRYCODE`,
    `DISTRICT` = `CITYNEW`.`DISTRICT`,
    `POPULATION` = `CITYNEW`.`POPULATION`;

SELECT `Name` FROM `City` WHERE `CountryCode` = 'USA' AND `Population` > 120000;