USE rookery;

DESCRIBE bird_families;

SELECT order_id FROM bird_orders
WHERE scientific_name = 'Gaviiformes';

INSERT INTO bird_families
VALUES(100, 'Gaviidae',
"Loons or divers are aquatic birds found mainly in the Northern Hemisphere.",
103);

INSERT INTO bird_families
VALUES('Anatidae', "This family includes ducks, geese and swans.", NULL, 103);

SHOW WARNINGS \G

SELECT * FROM bird_families \G

DELETE FROM bird_families
WHERE family_id = 101;

INSERT INTO bird_families
(scientific_name, order_id, brief_description)
VALUES('Anatidae', 103, "This family includes ducks, geese and swans.");

SELECT * FROM bird_families;

SELECT order_id, scientific_name FROM bird_orders;

INSERT INTO bird_families
(scientific_name, order_id)
VALUES('Charadriidae', 109),
 ('Laridae', 102),
 ('Sternidae', 102),
 ('Caprimulgidae', 122),
 ('Sittidae', 128),
 ('Picidae', 125),
 ('Accipitridae', 112),
 ('Tyrannidae', 128),
Practical Examples | 99
 ('Formicariidae', 128),
 ('Laniidae', 128);

SELECT family_id, scientific_name
FROM bird_families
ORDER BY scientific_name;

SHOW COLUMNS FROM birds LIKE '%id';   # % as wildcard

