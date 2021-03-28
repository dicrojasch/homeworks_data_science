-- Scalar queries, (single value subquery) 

SELECT scientific_name AS Family
FROM bird_families
WHERE order_id =
(
    SELECT order_id
    FROM bird_orders
    WHERE scientific_name = 'Galliformes'
);


UPDATE humans
  SET 
      membership_type = 'premium', 
      membership_expiration = DATE_ADD(IFNULL(membership_expiration, CURDATE()), INTERVAL 1 YEAR)
WHERE human_id =
(
    SELECT human_id
    FROM
    (
        SELECT human_id, 
               COUNT(*) AS sightings, 
               join_date
        FROM birdwatchers.bird_sightings
             JOIN birdwatchers.humans USING(human_id)
             JOIN rookery.birds USING(bird_id)
             JOIN rookery.bird_families USING(family_id)
        WHERE country_id = 'ru'
              AND bird_families.scientific_name = 'Scolopacidae'
        GROUP BY human_id
    ) AS derived_1
    WHERE sightings > 5
    ORDER BY join_date ASC
    LIMIT 1
);

-- Column subquery  

SELECT *
FROM
(
    SELECT common_name AS 'Bird', 
           families.scientific_name AS 'Family'
    FROM birds
         JOIN bird_families AS families USING(family_id)
         JOIN bird_orders AS orders USING(order_id)
    WHERE common_name != ''
          AND families.scientific_name IN
    (
        SELECT DISTINCT 
               families.scientific_name AS 'Family'
        FROM bird_families AS families
             JOIN bird_orders AS orders USING(order_id)
        WHERE orders.scientific_name = 'Galliformes'
        ORDER BY Family
    )
    ORDER BY RAND()
) AS derived_1
GROUP BY(Family);

-- row subquery 

INSERT INTO bird_sightings
(bird_id, human_id, time_seen, location_gps)
VALUES (
        SELECT birds.bird_id, humans.human_id,
            date_spotted, gps_coordinates
        FROM (
                SELECT personal_name, family_name, science_name, date_spotted,
                    CONCAT(latitude, '; ', longitude) AS gps_coordinates
                FROM eastern_birders
                    JOIN eastern_birders_spottings USING(birder_id)
                WHERE (
                        personal_name, family_name,
                        science_name, CONCAT(latitude, '; ', longitude) 
                ) NOT IN (
                    SELECT name_first, name_last, scientific_name, location_gps
                    FROM humans
                        JOIN bird_sightings USING(human_id)
                        JOIN rookery.birds USING(bird_id) 
                ) 
            ) AS derived_1
            JOIN humans ON(
                    personal_name = name_first AND family_name = name_last
                )
            JOIN rookery.birds ON(scientific_name = science_name) 
    );

-- table subquery 

SELECT family AS 'Bird Family', 
       COUNT(*) AS 'Number of Birds'
FROM
(
    SELECT families.scientific_name AS family
    FROM birds
         JOIN bird_families AS families USING(family_id)
    WHERE families.scientific_name IN('Pelecanidae', 'Ardeidae')
) AS derived_1
GROUP BY family;
