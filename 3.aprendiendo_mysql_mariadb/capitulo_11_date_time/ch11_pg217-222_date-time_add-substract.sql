-- Adding and Subtracting Dates and Time

UPDATE humans
  SET 
      membership_expiration = DATE_ADD(membership_expiration, INTERVAL 3 MONTH)
WHERE country_id = 'uk'
      AND membership_expiration > CURDATE();

UPDATE humans
  SET 
      membership_expiration = DATE_SUB(membership_expiration, INTERVAL 1 YEAR)
WHERE CONCAT(
      name_first, SPACE(1), name_last) = 'Melissa Lee';      

UPDATE humans
    SET membership_expiration = DATE_ADD(membership_expiration, INTERVAL -1 YEAR)
WHERE CONCAT(
    name_first, SPACE(1), name_last) = 'Melissa Lee';

UPDATE bird_sightings
    SET time_seen = DATE_ADD(time_seen, INTERVAL '1 2' DAY_HOUR)
WHERE sighting_id = 16;

SELECT TIME(NOW()), 
       TIME_TO_SEC(NOW()), 
       TIME_TO_SEC(NOW()) / 60 / 60 AS 'Hours';

DROP TABLE IF EXISTS bird_identification_tests;

CREATE TABLE bird_identification_tests
(test_id  INT AUTO_INCREMENT
              KEY, 
 human_id INT, 
 bird_id  INT, 
 id_start TIME, 
 id_end   TIME
);

INSERT INTO bird_identification_tests
VALUES(NULL, 16, 125, CURTIME(), NULL);

UPDATE bird_identification_tests
SET id_end = CURTIME();

SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       common_name AS 'Bird', 
       SEC_TO_TIME(TIME_TO_SEC(id_end) - TIME_TO_SEC(id_start)) AS 'Time Elapsed'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id);


SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       COUNT(time_seen) AS 'Sightings Recorded'
FROM bird_sightings
     JOIN humans USING(human_id)
WHERE QUARTER(time_seen) = (QUARTER(CURDATE()) - 1)
      AND YEAR(time_seen) = (YEAR(CURDATE()) - 1)
GROUP BY human_id
LIMIT 5;

SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       COUNT(time_seen) AS 'Sightings Recorded'
FROM bird_sightings
     JOIN humans USING(human_id)
WHERE CONCAT(
      QUARTER(time_seen), YEAR(time_seen)) = CONCAT(
      QUARTER(STR_TO_DATE(PERIOD_ADD(EXTRACT(YEAR_MONTH FROM CURDATE()), - 3), '%Y%m')), YEAR(STR_TO_DATE(PERIOD_ADD(EXTRACT(YEAR_MONTH FROM CURDATE()), - 3), '%Y%m')))
GROUP BY human_id
LIMIT 5;
