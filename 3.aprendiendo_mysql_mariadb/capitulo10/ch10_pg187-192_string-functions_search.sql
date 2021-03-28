-- Locating Text Within a String

SELECT common_name AS 'Avocet'
FROM birds
     JOIN bird_families USING(family_id)
WHERE bird_families.scientific_name = 'Recurvirostridae'
      AND birds.common_name LIKE '%Avocet%';


SELECT SUBSTRING(common_name, 1, LOCATE(' Avocet', common_name)) AS 'Avocet'
FROM birds
     JOIN bird_families USING(family_id)
WHERE bird_families.scientific_name = 'Recurvirostridae'
      AND birds.common_name LIKE '%Avocet%';

SELECT human_id, 
       CONCAT(
       name_first, SPACE(1), name_last) AS Name, 
       join_date
FROM humans
WHERE country_id = 'ru'
ORDER BY join_date;


SELECT FIND_IN_SET('Anahit Vanetsyan', Names) AS Position
FROM
(
    SELECT GROUP_CONCAT(Name ORDER BY join_date) AS Names
    FROM
    (
        SELECT CONCAT(
               name_first, SPACE(1), name_last) AS Name, 
               join_date
        FROM humans
        WHERE country_id = 'ru'
    ) AS derived_1
) AS derived_2;

-- String Lengths
-- */*
SELECT IF(CHAR_LENGTH(comments) > 100, 'long', 'short')
FROM bird_sightings
WHERE sighting_id = 2;

-- length counts bytes
SELECT sighting_id
FROM bird_sightings
WHERE CHARACTER_LENGTH(comments) != LENGTH(comments);
