SELECT bird_orders.scientific_name AS 'Bird Order', 
       GROUP_CONCAT(bird_families.scientific_name) AS 'Bird Families in Order'
FROM rookery.bird_families
     JOIN rookery.bird_orders USING(order_id)
WHERE bird_orders.scientific_name = 'Charadriiformes'
GROUP BY order_id;

SELECT bird_orders.scientific_name AS 'Bird Order', 
       GROUP_CONCAT(bird_families.scientific_name SEPARATOR ', ') AS 'Bird Families in Order'
FROM rookery.bird_families
     JOIN rookery.bird_orders USING(order_id)
GROUP BY order_id;
