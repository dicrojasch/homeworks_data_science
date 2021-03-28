

SELECT common_name AS 'Bird', 
       TIME_TO_SEC(TIMEDIFF(id_end, id_start)) AS 'Seconds to Identify'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
WHERE name_first = 'Ricky'
      AND name_last = 'Adams';


SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       SUM(TIME_TO_SEC(TIMEDIFF(id_end, id_start))) AS 'Total Seconds for Identifications'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
WHERE name_first = 'Ricky'
      AND name_last = 'Adams';

SELECT Identifications, 
       Seconds, 
       (Seconds / Identifications) AS 'Avg. Seconds/Identification'
FROM
(
    SELECT human_id, 
           COUNT(*) AS 'Identifications'
    FROM bird_identification_tests
         JOIN humans USING(human_id)
         JOIN rookery.birds USING(bird_id)
    WHERE name_first = 'Ricky'
          AND name_last = 'Adams'
) AS row_count
JOIN
(
    SELECT human_id, 
           CONCAT(
           name_first, SPACE(1), name_last) AS 'Birdwatcher', 
           SUM(TIME_TO_SEC(TIMEDIFF(id_end, id_start))) AS 'Seconds'
    FROM bird_identification_tests
         JOIN humans USING(human_id)
         JOIN rookery.birds USING(bird_id)
) AS second_count USING(human_id);


SELECT CONCAT(
    name_first, SPACE(1), name_last) AS 'Birdwatcher', 
    AVG(TIME_TO_SEC(TIMEDIFF(id_end, id_start))) AS 'Avg. Seconds per Identification'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
WHERE name_first = 'Ricky'
      AND name_last = 'Adams';

SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       COUNT(*) AS 'Birds', 
       TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(id_end, id_start)))), '%i:%s') AS 'Avg. Time'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
GROUP BY human_id
LIMIT 3;

SELECT Birdwatcher, 
       avg_time AS 'Avg. Time'
FROM
(
    SELECT CONCAT(
           name_first, SPACE(1), name_last) AS 'Birdwatcher', 
           COUNT(*) AS 'Birds', 
           TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(id_end, id_start)))), '%i:%s') AS 'avg_time'
    FROM bird_identification_tests
         JOIN humans USING(human_id)
         JOIN rookery.birds USING(bird_id)
    GROUP BY human_id
) AS average_times
ORDER BY avg_time;


SELECT MIN(avg_time) AS 'Minimum Avg. Time', 
       MAX(avg_time) AS 'Maximum Avg. Time'
FROM humans
     JOIN
(
    SELECT human_id, 
           COUNT(*) AS 'Birds', 
           TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(TIMEDIFF(id_end, id_start)))), '%i:%s') AS 'avg_time'
    FROM bird_identification_tests
         JOIN humans USING(human_id)
         JOIN rookery.birds USING(bird_id)
    GROUP BY human_id
) AS average_times;

SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       TIME_FORMAT(SEC_TO_TIME(MIN(TIME_TO_SEC(TIMEDIFF(id_end, id_start)))), '%i:%s') AS 'Minimum Time', 
       TIME_FORMAT(SEC_TO_TIME(MAX(TIME_TO_SEC(TIMEDIFF(id_end, id_start)))), '%i:%s') AS 'Maximum Time'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
GROUP BY Birdwatcher;

SELECT common_name AS 'Bird', 
       MAX(SUBSTRING(location_gps, 1, 11)) AS 'Furthest North', 
       MIN(SUBSTRING(location_gps, 1, 11)) AS 'Furthest South'
FROM birdwatchers.bird_sightings
     JOIN rookery.birds USING(bird_id)
WHERE location_gps IS NOT NULL
GROUP BY bird_id
LIMIT 3;
