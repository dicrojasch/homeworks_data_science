-- Formatting Dates and Time

SELECT common_name AS 'Endangered Bird', 
       CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       DATE_FORMAT(time_seen, '%W, %M %e, %Y') AS 'Date Spotted', 
       TIME_FORMAT(time_seen, '%l:%i %p') AS 'Time Spotted'
FROM bird_sightings
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
     JOIN rookery.conservation_status USING(conservation_status_id)
WHERE conservation_category = 'Threatened'
LIMIT 3;

-- Adjusting to Standards and Time Zones

SELECT GET_FORMAT(DATE, 'USA');
SELECT GET_FORMAT(DATE, 'INTERNAL');

SELECT GET_FORMAT(DATE, 'USA'), GET_FORMAT(TIME, 'USA');
SELECT GET_FORMAT(DATE, 'INTERNAL'), GET_FORMAT(TIME, 'INTERNAL');

SELECT DATE_FORMAT(CURDATE(), GET_FORMAT(DATE, 'EUR')) AS 'Date in Europe', 
       DATE_FORMAT(CURDATE(), GET_FORMAT(DATE, 'USA')) AS 'Date in U.S.', 
       REPLACE(DATE_FORMAT(CURDATE(), GET_FORMAT(DATE, 'USA')), '.', '-') AS 'Another Date in U.S.';

SHOW VARIABLES LIKE 'time_zone';

SELECT common_name AS 'Bird', 
       CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       DATE_FORMAT(time_seen, '%r') AS 'System Time Spotted', 
       DATE_FORMAT(CONVERT_TZ(time_seen, 'US/Eastern', 'Europe/Rome'), '%r') AS 'Birder Time Spotted'
FROM bird_sightings
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
     JOIN rookery.conservation_status USING(conservation_status_id)
LIMIT 3;

-- To install the time zone file
-- mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -p -u root mysql

SET GLOBAL time_zone = 'GMT';

default-time-zone='GMT'
