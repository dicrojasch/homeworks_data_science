ALTER TABLE bird_families ADD COLUMN order_id INT;

CREATE TABLE test.birds_new LIKE birds;

USE test
DESCRIBE birds_new;

INSERT INTO birds_new SELECT * FROM rookery.birds;

CREATE TABLE birds_new_alternative SELECT * FROM rookery.birds;

ALTER TABLE birds_new ADD COLUMN wing_id CHAR(2);

ALTER TABLE birds_new DROP COLUMN wing_id;

ALTER TABLE birds_new ADD COLUMN wing_id CHAR(2) AFTER family_id;

ALTER TABLE birds_new
ADD COLUMN body_id CHAR(2) AFTER wing_id,
ADD COLUMN bill_id CHAR(2) AFTER body_id,
ADD COLUMN endangered BIT DEFAULT b'1' AFTER bill_id,
CHANGE COLUMN common_name common_name VARCHAR(255);

UPDATE birds_new SET endangered = 0 WHERE bird_id IN(1,2,4,5);

SELECT bird_id, scientific_name, common_name
FROM birds_new
WHERE endangered \G

ALTER IGNORE TABLE birds_new
MODIFY COLUMN endangered
ENUM('Extinct',
 'Extinct in Wild',
 'Threatened - Critically Endangered',
 'Threatened - Endangered',
 'Threatened - Vulnerable',
 'Lower Risk - Conservation Dependent',
 'Lower Risk - Near Threatened',
 'Lower Risk - Least Concern')
AFTER family_id;

SHOW COLUMNS FROM birds_new LIKE 'endangered' \G

UPDATE birds_new SET endangered = 7;

