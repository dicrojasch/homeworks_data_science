SELECT DISTINCT bird_orders.order_id,
cornell_bird_order AS "Cornell's Order",
bird_orders.scientific_name AS 'My Order'
FROM bird_families, bird_orders
WHERE bird_families.order_id IS NULL
AND cornell_bird_order = bird_orders.scientific_name
LIMIT 5;


UPDATE bird_families, bird_orders
SET bird_families.order_id = bird_orders.order_id
WHERE bird_families.order_id IS NULL
AND cornell_bird_order = bird_orders.scientific_name;

SELECT * FROM bird_families
ORDER BY family_id DESC LIMIT 4;

SELECT * FROM bird_orders
WHERE order_id = 128;

SELECT family_id, scientific_name, brief_description
FROM bird_families
WHERE order_id IS NULL;


