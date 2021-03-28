
SELECT common_name, 
       conservation_state
FROM birds
     LEFT JOIN conservation_status USING(conservation_status_id)
     JOIN bird_families USING(family_id)
WHERE bird_families.scientific_name = 'Ardeidae';

INSERT INTO conservation_status (conservation_state)
VALUES('Unknown');

SELECT LAST_INSERT_ID();

UPDATE birds
       LEFT JOIN conservation_status USING(conservation_status_id) JOIN bird_families USING(family_id)
  SET 
      birds.conservation_status_id = 9
       WHERE bird_families.scientific_name = 'Ardeidae'
             AND conservation_status.conservation_status_id IS NULL;

DELETE FROM humans, prize_winners USING humans
                                        JOIN prize_winners
                                        WHERE name_first = 'Elena'
                                              AND name_last = 'Bokova'
                                              AND email_address LIKE '%yahoo.com'
                                              AND humans.human_id = prize_winners.human_id;

DELETE FROM humans, prize_winners USING humans
                                        LEFT JOIN prize_winners ON humans.human_id = prize_winners.human_id
                                        WHERE name_first = 'Elena'
                                              AND name_last = 'Bokova'
                                              AND email_address LIKE '%yahoo.com';

DELETE FROM prize_winners USING humans
                                RIGHT JOIN prize_winners ON humans.human_id = prize_winners.human_id
                                WHERE humans.human_id IS NULL;
