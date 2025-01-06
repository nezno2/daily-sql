CREATE DATABASE IF NOT EXISTS `mysql_database`;

USE `mysql_database`;

CREATE TABLE IF NOT EXISTS `city` (
    `id` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(17),
    `country_code` VARCHAR(3),
    `district` VARCHAR(20),
    `population` INT
);

INSERT INTO `city` (`id`, `name`, `country_code`, `district`, `population`) VALUES
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3965, 'Corona', 'USA', 'California', 124966),
(3973, 'Concord', 'USA', 'California', 121780),
(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
(3982, 'Coral Springs', 'USA', 'Florida', 117549),
(4054, 'Fairfield', 'USA', 'California', 92256),
(4058, 'Boulder', 'USA', 'Colorado', 91238),
(4061, 'Fall River', 'USA', 'Massachusetts', 90555)
ON DUPLICATE KEY UPDATE 
    `name` = VALUES(`name`),
    `country_code` = VALUES(`country_code`),
    `district` = VALUES(`district`),
    `population` = VALUES(`population`);

SELECT * FROM `city` WHERE `id` = 1661;