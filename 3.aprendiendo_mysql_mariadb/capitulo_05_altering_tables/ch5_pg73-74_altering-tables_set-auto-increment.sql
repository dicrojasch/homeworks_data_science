SELECT auto_increment
FROM information_schema.tables
WHERE table_name = 'birds';

USE rookery
ALTER TABLE birds AUTO_INCREMENT = 10;