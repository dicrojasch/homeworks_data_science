SELECT 'Pelecanidae' AS 'Family',
 COUNT(*) AS 'Species'
 FROM birds, bird_families AS families
 WHERE birds.family_id = families.family_id
AND families.scientific_name = 'Pelecanidae'
UNION
 SELECT 'Ardeidae',
 COUNT(*)
 FROM birds, bird_families AS families
 WHERE birds.family_id = families.family_id
 AND families.scientific_name = 'Ardeidae';

 SELECT families.scientific_name AS 'Family',
 COUNT(*) AS 'Species'
 FROM birds, bird_families AS families, bird_orders AS orders
 WHERE birds.family_id = families.family_id
 AND families.order_id = orders.order_id
 AND orders.scientific_name = 'Pelecaniformes'
 GROUP BY families.family_id
UNION
 SELECT families.scientific_name, COUNT(*)
 FROM birds, bird_families AS families, bird_orders AS orders
 WHERE birds.family_id = families.family_id
 AND families.order_id = orders.order_id
 AND orders.scientific_name = 'Suliformes'
 GROUP BY families.family_id;

 SELECT *
FROM(SELECT families.scientific_name AS 'Family', 
            COUNT(*) AS 'Species', 
            orders.scientific_name AS 'Order'
     FROM birds , 
          bird_families AS families , 
          bird_orders AS orders
     WHERE birds.family_id = families.family_id
           AND families.order_id = orders.order_id
           AND orders.scientific_name = 'Pelecaniformes'
     GROUP BY families.family_id
UNION
SELECT families.scientific_name, 
       COUNT(*), 
       orders.scientific_name
FROM birds , 
     bird_families AS families , 
     bird_orders AS orders
WHERE birds.family_id = families.family_id
      AND families.order_id = orders.order_id
      AND orders.scientific_name = 'Suliformes'
GROUP BY families.family_id) AS derived_1
ORDER BY Family;
