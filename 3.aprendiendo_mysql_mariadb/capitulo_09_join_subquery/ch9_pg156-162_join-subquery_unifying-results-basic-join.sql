USE test;

SELECT book_id, 
       title, 
       status_name
FROM books
     JOIN status_names
WHERE status = status_id;
SELECT book_id, 
       title, 
       status_name
FROM books
     JOIN status_names ON(status = status_id);
SELECT book_id, 
       title, 
       status_name
FROM books
     JOIN status_names USING(status_id);


USE rookery;

SELECT common_name, 
       conservation_state
FROM birds
     JOIN conservation_status ON(birds.conservation_status_id = conservation_status.conservation_status_id)
WHERE conservation_category = 'Threatened'
      AND common_name LIKE '%Goose%';


SELECT common_name, 
       conservation_state
FROM birds
     JOIN conservation_status USING(conservation_status_id)
WHERE conservation_category = 'Threatened'
      AND common_name LIKE '%Goose%';

SELECT common_name AS 'Bird',
    bird_families.scientific_name AS 'Family', conservation_state AS 'Status'
FROM birds
    JOIN conservation_status USING(conservation_status_id)
    JOIN bird_families USING(family_id)
WHERE conservation_category = 'Threatened'
    AND common_name REGEXP 'Goose|Duck'
ORDER BY Status, Bird;

SELECT common_name AS 'Bird',
    bird_families.scientific_name AS 'Family', conservation_state AS 'Status'
FROM birds, conservation_status, bird_families
WHERE birds.conservation_status_id = conservation_status.conservation_status_id
    AND birds.family_id = bird_families.family_id
    AND conservation_category = 'Threatened'
    AND common_name REGEXP 'Goose|Duck'
ORDER BY Status, Bird;

SELECT common_name AS 'Bird from Anatidae',
    conservation_state AS 'Conservation Status'
FROM birds
    JOIN conservation_status AS states USING(conservation_status_id)
    JOIN bird_families USING(family_id)
WHERE conservation_category = 'Threatened'
    AND bird_families.scientific_name = 'Anatidae'
ORDER BY states.conservation_status_id DESC, common_name ASC;


SELECT CONCAT(name_first, ' ', name_last) AS Birder,
    common_name AS Bird, location_gps AS 'Location of Sighting'
FROM birdwatchers.humans
    JOIN birdwatchers.bird_sightings USING(human_id)
    JOIN rookery.birds USING(bird_id)
    JOIN rookery.bird_families USING(family_id)
WHERE country_id = 'ru'
    AND bird_families.scientific_name = 'Scolopacidae'
ORDER BY Birder;

SELECT common_name AS 'Bird',
    conservation_state AS 'Status'
FROM birds
    LEFT JOIN conservation_status USING(conservation_status_id)
WHERE common_name LIKE '%Egret%'
