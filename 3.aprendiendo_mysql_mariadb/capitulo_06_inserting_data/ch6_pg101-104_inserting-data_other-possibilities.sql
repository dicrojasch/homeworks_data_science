INSERT INTO birds
(common_name, scientific_name, family_id)
VALUES('Mountain Plover', 'Charadrius montanus', 103);

INSERT INTO birds
(common_name, scientific_name, family_id)
VALUES('Snowy Plover', 'Charadrius alexandrinus', 103),
('Black-bellied Plover', 'Pluvialis squatarola', 103),
('Pacific Golden Plover', 'Pluvialis fulva', 103);

SELECT common_name AS 'Bird',
 birds.scientific_name AS 'Scientific Name',
 bird_families.scientific_name AS 'Family',
 bird_orders.scientific_name AS 'Order'
FROM birds,
 bird_families,
 bird_orders
WHERE birds.family_id = bird_families.family_id
AND bird_families.order_id = bird_orders.order_id;

# Other possibilities for inserting

INSERT INTO bird_families
SET scientific_name = 'Rallidae',
order_id = 113;