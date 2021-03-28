SELECT COUNT(*) FROM birds;

SELECT families.scientific_name AS 'Family',
COUNT(*) AS 'Number of Birds'
FROM birds, bird_families AS families
WHERE birds.family_id = families.family_idQ
AND families.scientific_name like '%Pelecanidae%';

SELECT orders.scientific_name AS 'Order',
families.scientific_name AS 'Family',
COUNT(*) AS 'Number of Birds'
FROM birds, bird_families AS families, bird_orders AS orders
WHERE birds.family_id = families.family_id
AND families.order_id = orders.order_id
AND orders.scientific_name like 'Pelecaniformes%';

SELECT orders.scientific_name AS 'Order',
families.scientific_name AS 'Family',
COUNT(*) AS 'Number of Birds'
FROM birds, bird_families AS families, bird_orders AS orders
WHERE birds.family_id = families.family_id
AND families.order_id = orders.order_id
AND orders.scientific_name like '%Pelecaniformes'
GROUP BY Family;

