# mysql --user='drojas' -p rookery < cornell_birds_families_orders.sql
USE rookery;
DESCRIBE cornell_birds_families_orders;

SELECT * FROM cornell_birds_families_orders
LIMIT 1;

ALTER TABLE bird_families
ADD COLUMN cornell_bird_order VARCHAR(255);

INSERT IGNORE INTO bird_families
(scientific_name, brief_description, cornell_bird_order)
SELECT bird_family, examples, bird_order
FROM cornell_birds_families_orders;
