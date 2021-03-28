
use birdwatchers;


-- compare and search strings
drop table if exists possible_duplicate_email;

CREATE TABLE possible_duplicate_email
(human_id INT,
email_address1 VARCHAR(255),
email_address2 VARCHAR(255),
entry_date datetime );

INSERT IGNORE INTO possible_duplicate_email
(human_id, email_address1, email_address2, entry_date)
VALUES(LAST_INSERT_ID(), 'bobyfischer@mymail.com', 'bobbyfischer@mymail.com', CURRENT_DATE())
WHERE ABS( STRCMP('bobbyrobin@mymail.com', 'bobyrobin@mymail.com') ) = 1 ;

CREATE FULLTEXT INDEX comment_index ON bird_sightings(comments);

SELECT CONCAT(name_first, SPACE(1), name_last) AS Name,
    common_name AS Bird, SUBSTRING(comments, 1, 25) AS Comments
FROM birdwatchers.bird_sightings
    JOIN birdwatchers.humans USING(human_id)
    JOIN rookery.birds USING(bird_id)
WHERE MATCH (comments) AGAINST ('beautiful');

-- replace insert into strings

SELECT INSERT(common_name, 6, 0, ' (i.e., Smallest)') AS 'Smallest Birds'
FROM birds
WHERE common_name LIKE 'Least %'
LIMIT 1;

SELECT common_name AS Original,
INSERT(common_name, LOCATE('Gt.', common_name), 3, 'Great') AS Adjusted
FROM birds
WHERE common_name REGEXP 'Gt.' LIMIT 1;

UPDATE birds
SET common_name = INSERT(common_name, LOCATE('Gt.', common_name), 3, 'Great')
WHERE common_name REGEXP 'Gt.';

SELECT common_name AS Original,
REPLACE(common_name, 'Gt.', 'Great') AS Replaced
FROM birds
WHERE common_name REGEXP 'Gt.' LIMIT 1;

UPDATE birds
SET common_name = REPLACE(common_name, 'Gt.', 'Great');
