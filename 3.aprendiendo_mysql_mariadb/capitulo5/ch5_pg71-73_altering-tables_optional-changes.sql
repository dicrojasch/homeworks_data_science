CREATE TABLE rookery.conservation_status
(status_id INT AUTO_INCREMENT PRIMARY KEY,
conservation_category CHAR(10),
conservation_state CHAR(25) );

INSERT INTO rookery.conservation_status
(conservation_category, conservation_state)
VALUES('Extinct','Extinct'),
('Extinct','Extinct in Wild'),
('Threatened','Critically Endangered'),
('Threatened','Endangered'),
('Threatened','Vulnerable'),
('Lower Risk','Conservation Dependent'),
('Lower Risk','Near Threatened'),
('Lower Risk','Least Concern');

SELECT * FROM rookery.conservation_status;

ALTER TABLE birds_new CHANGE COLUMN endangered conservation_status_id INT DEFAULT 8;

ALTER TABLE birds_new ALTER conservation_status_id SET DEFAULT 7;

SHOW COLUMNS FROM birds_new LIKE 'conservation_status_id' \G

ALTER TABLE birds_new ALTER conservation_status_id DROP DEFAULT;