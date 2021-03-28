

use birdwatchers;

-- Limit updates

CREATE TABLE prize_winners
(winner_id INT AUTO_INCREMENT PRIMARY KEY,
human_id INT,
winner_date DATE,
prize_chosen VARCHAR(255),
prize_sent DATE);

INSERT INTO prize_winners
(human_id)
SELECT human_id
FROM humans;

UPDATE prize_winners
SET winner_date = CURDATE()
WHERE winner_date IS NULL
ORDER BY RAND()
LIMIT 2;

SHOW WARNINGS

UPDATE prize_winners, humans
SET winner_date = NULL,
 prize_chosen = NULL,
 prize_sent = NULL
WHERE country_id = 'uk'
AND prize_winners.human_id = humans.human_id;



-- Handling duplicates

ALTER TABLE humans
ADD COLUMN better_birders_site TINYINT DEFAULT 0;

INSERT INTO prize_winners
(human_id)
SELECT human_id FROM humans
WHERE better_birders_site = 1;

ALTER TABLE humans
ADD COLUMN possible_duplicate TINYINT DEFAULT 0;

CREATE TEMPORARY TABLE possible_duplicates
(name_1 varchar(25), name_2 varchar(25));

INSERT INTO possible_duplicates
SELECT name_first, name_last
FROM
 (SELECT name_first, name_last, COUNT(*) AS nbr_entries
 FROM humans
 GROUP BY name_first, name_last) AS derived_table
WHERE nbr_entries > 1;

UPDATE humans, possible_duplicates
SET possible_duplicate = 1
WHERE name_first = name_1
AND name_last = name_2;
