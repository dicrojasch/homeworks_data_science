
-- Rounding Numbers

SELECT IFNULL(COLUMN_GET(choices, answer AS CHAR), 'total')
AS 'Birding Site', COUNT(*) AS 'Votes'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer WITH ROLLUP;

SET @fav_site_total =
(
    SELECT COUNT(*)
    FROM survey_answers
         JOIN survey_questions USING(question_id)
    WHERE survey_id = 1
          AND question_id = 1
);
SELECT @fav_site_total;


SELECT COLUMN_GET(choices, answer AS CHAR)
 AS 'Birding Site',
COUNT(*) AS 'Votes',
CONCAT( ROUND( (COUNT(*) / @fav_site_total) * 100), '%')
 AS 'Percent'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer;


SELECT COLUMN_GET(choices, answer AS CHAR)
AS 'Birding Site',
COUNT(*) AS 'Votes',
CONCAT( ROUND( (COUNT(*) / @fav_site_total) * 100, 1), '%') AS 'Percent'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer;


-- Rounding Only Down or Up

SELECT COLUMN_GET(choices, answer AS CHAR)
 AS 'Birding Site',
COUNT(*) AS 'Votes',
CONCAT( FLOOR( (COUNT(*) / @fav_site_total) * 100), '%')
 AS 'Percent'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer;

SELECT COLUMN_GET(choices, answer AS CHAR)
AS 'Birding Site',
COUNT(*) AS 'Votes',
CONCAT( CEILING( (COUNT(*) / @fav_site_total) * 100), '%') AS 'Percent'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer;

--Truncating Numbers

SELECT COLUMN_GET(choices, answer AS CHAR)
 AS 'Birding Site',
COUNT(*) AS 'Votes',
CONCAT( TRUNCATE( (COUNT(*) / @fav_site_total) * 100, 1), '%')
 AS 'Percent'
FROM survey_answers
JOIN survey_questions USING(question_id)
WHERE survey_id = 1
AND question_id = 1
GROUP BY answer;

-- Eliminating Negative Numbers

SELECT
SUM( TIME_TO_SEC( TIMEDIFF(id_start, id_end) ) )
 AS 'Total Seconds for All',
ABS( SUM( TIME_TO_SEC( TIMEDIFF(id_start, id_end) ) ) )
 AS 'Absolute Total'
FROM bird_identification_tests;

SET @min_avg_time =
(
    SELECT MIN(avg_time)
    FROM
    (
        SELECT AVG(TIME_TO_SEC(TIMEDIFF(id_end, id_start))) AS 'avg_time'
        FROM bird_identification_tests
        GROUP BY human_id
    ) AS average_times
);
SELECT @min_avg_time;

SELECT CONCAT(
       name_first, SPACE(1), name_last) AS 'Birdwatcher', 
       common_name AS 'Bird', 
       ROUND(@min_avg_time - TIME_TO_SEC(TIMEDIFF(id_end, id_start))) AS 'Seconds Less than Average'
FROM bird_identification_tests
     JOIN humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
WHERE SIGN(TIME_TO_SEC(TIMEDIFF(id_end, id_start) - @min_avg_time)) = - 1;
