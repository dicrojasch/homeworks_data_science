
SELECT NOW( );

-- NOW() = CURRENT_TIMESTAMP( ) = LOCALTIME( ) = LOCALTIMESTAMP( )

INSERT INTO bird_sightings
(bird_id, human_id, time_seen, location_gps)
VALUES (104, 34, NOW( ), '47.318875; 8.580119');

SELECT NOW(), SLEEP(4) AS 'Zzz', SYSDATE(), SLEEP(2) AS 'Zzz', SYSDATE();

SELECT NOW( ), CURDATE( ), CURTIME( );

SELECT UNIX_TIMESTAMP( ), NOW( );

SELECT (2014 - 1970) AS 'Simple',
UNIX_TIMESTAMP( ) AS 'Seconds since Epoch',
ROUND(UNIX_TIMESTAMP( ) / 60 / 60 / 24 / 365.25) AS 'Complicated';

SELECT CONCAT(name_first, SPACE(1), name_last) AS 'Birdwatcher',
ROUND((UNIX_TIMESTAMP( ) - UNIX_TIMESTAMP(time_seen)) / 60 / 60 / 24)
 AS 'Days Since Spotted'
FROM bird_sightings JOIN humans USING(human_id)
WHERE bird_id = 309;

-- Extracting Date and Time Components

SELECT CONCAT(name_first, SPACE(1), name_last) AS 'Birdwatcher',
time_seen, DATE(time_seen), TIME(time_seen)
FROM bird_sightings
JOIN humans USING(human_id)

SELECT CONCAT(name_first, SPACE(1), name_last) AS 'Birdwatcher',
time_seen, HOUR(time_seen), MINUTE(time_seen), SECOND(time_seen)
FROM bird_sightings JOIN humans USING(human_id)
WHERE bird_id = 309 

SELECT CONCAT(name_first, SPACE(1), name_last) AS 'Birdwatcher',
time_seen, YEAR(time_seen), MONTH(time_seen), DAY(time_seen),
MONTHNAME(time_seen), DAYNAME(time_seen)
FROM bird_sightings JOIN humans USING(human_id)
WHERE bird_id = 309 

SELECT common_name AS 'Endangered Bird', 
       CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       CONCAT(
       DAYNAME(time_seen), ', ', MONTHNAME(time_seen), SPACE(1), DAY(time_seen), ', ', YEAR(time_seen)) AS 'Date Spotted', 
       CONCAT(
       HOUR(time_seen), ':', MINUTE(time_seen), IF(HOUR(time_seen) < 12, ' a.m.', ' p.m.')) AS 'Time Spotted'
FROM bird_sightings
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
     JOIN rookery.conservation_status USING(conservation_status_id)
WHERE conservation_category = 'Threatened'
LIMIT 3;

SELECT time_seen,
EXTRACT(YEAR_MONTH FROM time_seen) AS 'Year & Month',
EXTRACT(MONTH FROM time_seen) AS 'Month Only',
EXTRACT(HOUR_MINUTE FROM time_seen) AS 'Hour & Minute',
EXTRACT(HOUR FROM time_seen) AS 'Hour Only'
FROM bird_sightings JOIN humans USING(human_id)
LIMIT 3;
