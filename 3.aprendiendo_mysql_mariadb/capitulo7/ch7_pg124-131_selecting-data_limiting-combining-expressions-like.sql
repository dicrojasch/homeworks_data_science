
SELECT common_name, scientific_name, family_id
FROM birds
WHERE family_id IN(103, 160, 162, 164)
AND common_name != ''
ORDER BY common_name
LIMIT 3, 2;

SELECT common_name AS 'Bird',
bird_families.scientific_name AS 'Family'
FROM birds, bird_families
WHERE birds.family_id = bird_families.family_id
AND order_id = 102
AND common_name != ''
ORDER BY common_name LIMIT 10;

SELECT common_name AS 'Bird',
families.scientific_name AS 'Family'
FROM birds, bird_families AS families
WHERE birds.family_id = families.family_id
AND order_id = 102
AND common_name != ''
ORDER BY common_name LIMIT 10;

SELECT common_name AS 'Bird',
families.scientific_name AS 'Family',
orders.scientific_name AS 'Order'
FROM birds, bird_families AS families, bird_orders AS orders
WHERE birds.family_id = families.family_id
AND families.order_id = orders.order_id
AND families.order_id = 102
AND common_name != ''
ORDER BY common_name LIMIT 10, 5;

SELECT common_name AS 'Bird',
families.scientific_name AS 'Family',
orders.scientific_name AS 'Order'
FROM birds, bird_families AS families, bird_orders AS orders
WHERE birds.family_id = families.family_id
AND families.order_id = orders.order_id
AND common_name LIKE 'Least%'
ORDER BY orders.scientific_name, families.scientific_name, common_name
LIMIT 10;

SELECT common_name AS 'Birds Great and Small'
FROM birds
WHERE common_name REGEXP 'Great|Least'
ORDER BY family_id LIMIT 10;

SELECT common_name AS 'Birds Great and Small'
FROM birds
WHERE common_name REGEXP 'Great|Least'
AND common_name NOT REGEXP 'Greater'
ORDER BY family_id LIMIT 10;

# BINARY is for case sensitive 
SELECT common_name AS 'Hawks'
FROM birds
WHERE common_name REGEXP BINARY 'Hawk'
AND common_name NOT REGEXP 'Hawk-Owl'
ORDER BY family_id LIMIT 10;

SHOW CREATE DATABASE rookery;

SHOW FULL COLUMNS
FROM birds LIKE 'common_name';
