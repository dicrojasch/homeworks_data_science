
INSERT INTO humans
(formal_title, name_first, name_last, join_date, birding_background)
VALUES('Ms', 'Melissa', 'Lee', CURDATE(), COMPRESS("lengthy background..."));

SELECT birding_background AS Background
FROM humans
WHERE name_first = 'Melissa' AND name_last = 'Lee' ;

SELECT UNCOMPRESS(birding_background) AS Background
FROM humans
WHERE name_first = 'Melissa'
      AND name_last = 'Lee';
