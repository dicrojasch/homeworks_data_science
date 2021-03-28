REPLACE INTO bird_families
(scientific_name, brief_description, order_id)
VALUES('Viduidae', 'Indigobirds & Whydahs', 128),
('Estrildidae', 'Waxbills, Weaver Finches, & Allies', 128),
('Ploceidae', 'Weavers, Malimbe, & Bishops', 128);

SELECT * FROM bird_families
WHERE scientific_name = 'Viduidae'

INSERT LOW_PRIORITY INTO bird_sightings ... # for large inserts to instruct MySQL to enter the rows when it’s finished with whatever else it’s doing

INSERT DELAYED INTO bird_sightings ... # works as LOW_PRIORITY but additionally will release the mysql client immediately so that the client can go on to enter other SQL statements or even exit.

INSERT HIGH_PRIORITY INTO bird_sightings ... # when the database change the default priority 

