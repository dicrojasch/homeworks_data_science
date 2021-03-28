SELECT CONCAT(
       formal_title, '. ', name_first, SPACE(1), name_last) AS Birder, 
       CONCAT(
       common_name, ' - ', birds.scientific_name) AS Bird, 
       time_seen AS 'When Spotted'
FROM birdwatchers.bird_sightings
     JOIN birdwatchers.humans USING(human_id)
     JOIN rookery.birds USING(bird_id)
GROUP BY human_id DESC
LIMIT 4;


SELECT CONCAT_WS(
       '|', formal_title, name_first, name_last, street_address, city, state_province, postal_code, country_id)
FROM birdwatchers.humans
WHERE membership_type = 'premium'
      AND membership_expiration > CURDATE();

-- mysql -p --skip-column-names -e \
-- "SELECT CONCAT_WS('|', formal_title, name_first, name_last,
-- street_address, city, state_province, postal_code, country_id)
-- FROM birdwatchers.humans WHERE membership_type = 'premium'
-- AND membership_expiration > CURDATE();" > rookery_patch_mailinglist.txt

SELECT CONCAT_WS(
       '|', IFNULL(formal_title, ' '), IFNULL(name_first, ' '), IFNULL(name_last, ' '), IFNULL(street_address, ' '), IFNULL(city, ' '), IFNULL(state_province, ' '), IFNULL(postal_code, ' '), IFNULL(country_id, ' '))
FROM birdwatchers.humans
WHERE membership_type = 'premium'
      AND membership_expiration > CURDATE();


-- mysql -p --skip-column-names -e \
-- "SELECT CONCAT_WS('|', IFNULL(formal_title, ' '), IFNULL(name_first, ' '),
-- IFNULL(name_last, ' '), IFNULL(street_address, ' '),
-- IFNULL(city, ' '), IFNULL(state_province, ' '),
-- IFNULL(postal_code, ' '), IFNULL(country_id, ' '))
-- FROM birdwatchers.humans WHERE membership_type = 'premium'
-- AND membership_expiration > CURDATE();" > rookery_patch_mailinglist.txt

SELECT LCASE(common_name) AS Species, 
       UCASE(bird_families.scientific_name) AS Family
FROM birds
     JOIN bird_families USING(family_id)
WHERE common_name LIKE '%Wren%'
ORDER BY Species
LIMIT 5;

SELECT QUOTE(common_name)
FROM birds
WHERE common_name LIKE "%Prince%"
ORDER BY common_name;
