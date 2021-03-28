-- mysql --user='drojas' -p  rookery < birdwatchers.sql

use birdwatchers;

UPDATE birdwatchers.humans
SET country_id = 'us';

SELECT human_id, name_first, name_last
FROM humans
WHERE name_first = 'Rusty'
AND name_last = 'Osborne';

UPDATE humans
SET name_last = 'Johnson'
WHERE human_id = 3;

SELECT human_id, name_first, name_last
FROM humans
WHERE human_id = 3;

UPDATE humans
SET formal_title = 'Ms.'
WHERE human_id IN(24, 32);

SHOW FULL COLUMNS
FROM humans
LIKE 'formal_title';

UPDATE humans
SET formal_title = 'Ms.'
WHERE formal_title IN('Miss','Mrs.');

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr.','Ms.');

SHOW WARNINGS ;

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr.','Ms.','Mr','Ms');

UPDATE humans
SET formal_title = SUBSTRING(formal_title, 1, 2);

ALTER TABLE humans
CHANGE COLUMN formal_title formal_title ENUM('Mr','Ms');
