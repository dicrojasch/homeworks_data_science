CREATE TABLE birds_new LIKE birds;

DESCRIBE birds;
DESCRIBE birds_new;
SELECT * FROM birds_new;

SHOW CREATE TABLE birds \G

ALTER TABLE birds_new AUTO_INCREMENT = 6;

CREATE TABLE birds_details SELECT bird_id, description FROM birds;

DESCRIBE birds_details;

ALTER TABLE birds DROP COLUMN description;
