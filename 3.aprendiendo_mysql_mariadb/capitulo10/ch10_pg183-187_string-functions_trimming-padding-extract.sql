UPDATE humans
  SET 
      name_first = LTRIM(name_first), 
      name_last = LTRIM(name_last);

UPDATE humans
  SET 
      name_first = RTRIM(name_first), 
      name_last = RTRIM(name_last);

UPDATE humans
  SET 
      name_first = LTRIM(RTRIM(name_last)), 
      name_last = LTRIM(RTRIM(name_last));

-- TRIM = LTRIM(RTRIM())

UPDATE humans
  SET 
      name_first = LTRIM(RTRIM(name_last)), 
      name_last = LTRIM(RTRIM(name_last));

SELECT CONCAT(
       RPAD(common_name, 20, '.'), RPAD(Families.scientific_name, 15, '.'), 
            Orders.scientific_name) AS Birds
FROM birds
     JOIN bird_families AS Families USING(family_id)
     JOIN bird_orders AS Orders
WHERE common_name != ''
      AND Orders.scientific_name = 'Ciconiiformes'
ORDER BY common_name
LIMIT 3;

-- Extracting Text

SELECT prospect_name
FROM prospects LIMIT 4;

SELECT LEFT(prospect_name, 2) AS title, 
       MID(prospect_name, 5, 25) AS first_name, 
       RIGHT(prospect_name, 25) AS last_name
FROM prospects
LIMIT 4;

SELECT SUBSTRING(prospect_name, 1, 2) AS title, 
       SUBSTRING(prospect_name FROM 5 FOR 25) AS first_name, 
       SUBSTRING(prospect_name, - 25) AS last_name
FROM prospects
LIMIT 3;

SELECT SUBSTRING_INDEX(prospect_name, '|', 1) AS title,
SUBSTRING_INDEX( SUBSTRING_INDEX(prospect_name, '|', 2), '|', -1) AS first_name,
SUBSTRING_INDEX(prospect_name, '|', -1) AS last_name
FROM prospects WHERE prospect_id = 4;
