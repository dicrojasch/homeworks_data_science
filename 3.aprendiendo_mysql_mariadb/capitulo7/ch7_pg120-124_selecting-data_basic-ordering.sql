USE rookery;

SELECT * FROM birds;

SELECT bird_id, scientific_name, common_name
FROM birds;

SELECT common_name, scientific_name
FROM birds WHERE family_id = 103
LIMIT 3;

SELECT common_name, scientific_name
FROM birds WHERE family_id = 103
ORDER BY common_name
LIMIT 3;

SELECT * FROM bird_families
WHERE scientific_name
IN('Charadriidae','Haematopodidae','Recurvirostridae','Scolopacidae');

SELECT common_name, scientific_name, family_id
FROM birds
WHERE family_id IN(103, 160, 162, 164)
ORDER BY common_name
LIMIT 3;
