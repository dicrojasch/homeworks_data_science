RENAME TABLE rookery.birds TO rookery.birds_old, test.birds_new TO rookery.birds;

DROP TABLE birds_old;

SELECT * FROM country_codes LIMIT 5;

# mysql --user='drojas' -p rookery < apache_countries.sql
CREATE TABLE country_codes SELECT code1 as country_code, country_name as country_name FROM apache_countries;

SELECT * FROM country_codes LIMIT 5;
ALTER TABLE country_codes ORDER BY country_code;
SELECT * FROM country_codes LIMIT 5;

# indexes

ALTER TABLE conservation_status CHANGE status_id conservation_status_id INT AUTO_INCREMENT PRIMARY KEY;    # ERROR 1068 (42000): Multiple primary key defined

SHOW INDEX FROM birdwatchers.humans \G

EXPLAIN SELECT * FROM birdwatchers.humans
WHERE name_last = 'Hollar' \G

ALTER TABLE birdwatchers.humans ADD INDEX human_names (name_last, name_first);

EXPLAIN SELECT * FROM birdwatchers.humans WHERE name_last = 'Hollar' \G

ALTER TABLE conservation_status
DROP PRIMARY KEY,
CHANGE status_id conservation_status_id INT PRIMARY KEY AUTO_INCREMENT;
