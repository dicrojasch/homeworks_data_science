-- Counting Values
USE rookery;

SELECT COUNT(*)
FROM birds;

UPDATE birds
SET common_name = NULL
WHERE common_name = '';

SELECT COUNT(common_name)
FROM birds;

SELECT COUNT(*) FROM birds
WHERE common_name IS NULL;

SELECT COUNT(*) FROM birds
WHERE common_name IS NOT NULL;

SELECT COUNT(*)
FROM birds
GROUP BY family_id;

SELECT bird_families.scientific_name AS 'Bird Family', 
       COUNT(*) AS 'Number of Species'
FROM birds
     JOIN bird_families USING(family_id)
GROUP BY birds.family_id;   

SELECT bird_families.scientific_name AS 'Bird Family', 
       COUNT(*) AS 'Number of Species'
FROM birds
     LEFT JOIN bird_families USING(family_id)
GROUP BY birds.family_id;

SELECT bird_families.scientific_name AS 'Bird Family', 
       COUNT(*) AS 'Number of Species'
FROM birds
     LEFT JOIN bird_families USING(family_id)
GROUP BY bird_families.scientific_name;

SELECT bird_families.scientific_name AS 'Bird Family', 
       COUNT(*) AS 'Number of Species'
FROM birds
     JOIN bird_families USING(family_id)
GROUP BY bird_families.scientific_name WITH ROLLUP;

SELECT IFNULL(bird_orders.scientific_name, '') AS 'Bird Order', 
       IFNULL(bird_families.scientific_name, 'Total:') AS 'Bird Family', 
       COUNT(*) AS 'Number of Species'
FROM birds
     JOIN bird_families USING(family_id)
     JOIN bird_orders USING(order_id)
GROUP BY bird_orders.scientific_name, 
         bird_families.scientific_name WITH ROLLUP;
         