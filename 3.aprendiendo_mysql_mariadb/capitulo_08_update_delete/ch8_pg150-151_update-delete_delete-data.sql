DELETE FROM humans
WHERE name_first = 'Elena'
AND name_last = 'Bokova'
AND email_address LIKE '%yahoo.com';

DELETE FROM humans, prize_winners
USING humans JOIN prize_winners
WHERE name_first = 'Elena'
AND name_last = 'Bokova';

DELETE FROM humans, prize_winners
USING humans JOIN prize_winners
WHERE name_first = 'Elena'
AND name_last = 'Bokova'
AND email_address LIKE '%yahoo.com'
AND humans.human_id = prize_winners.human_id;
