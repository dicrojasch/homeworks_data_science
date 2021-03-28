
SELECT sorting_id, bird_name, bird_image
FROM bird_images
ORDER BY sorting_id
LIMIT 5;

SELECT sorting_id, bird_name, bird_image
FROM bird_images 
ORDER BY CAST(sorting_id AS INT) LIMIT 5;

SELECT bird_name, gender_age, bird_image
FROM bird_images
WHERE bird_name LIKE '%Plover%'
ORDER BY gender_age
LIMIT 5;

SHOW COLUMNS FROM bird_images LIKE 'gender_age';

SELECT bird_name, gender_age, bird_image
FROM bird_images
WHERE bird_name LIKE '%Plover%'
ORDER BY CONVERT(gender_age, CHAR)
LIMIT 5;

SELECT bird_name, gender_age, bird_image
FROM bird_images
WHERE bird_name LIKE '%Plover%'
ORDER BY CONVERT(gender_age USING utf8)
LIMIT 5;
