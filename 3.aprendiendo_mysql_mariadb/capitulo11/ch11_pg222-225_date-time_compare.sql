
SELECT CURDATE() AS 'Today', 
       DATE_FORMAT(membership_expiration, '%M %e, %Y') AS 'Date Membership Expires', 
       DATEDIFF(membership_expiration, CURDATE()) AS 'Days Until Expiration'
FROM humans
WHERE human_id = 4;

DROP TABLE IF EXISTS birding_events;

CREATE TABLE birding_events
(event_id          INT AUTO_INCREMENT
                       KEY, 
 event_name        VARCHAR(255), 
 event_description TEXT, 
 meeting_point     VARCHAR(255), 
 event_date        DATE, 
 start_time        TIME
);

INSERT INTO birding_events 
VALUES
(NULL, 
 'Sandpipers in San Diego', 
 "Birdwatching Outing in San Diego to look for Sandpipers,
Curlews, Godwits, Snipes and other shore birds.
Birders will walk the beaches and surrounding area in groups of six.
A light lunch will be provided.", 
 "Hotel del Coronado, the deck near the entrance to the restaurant.", 
 '2014-06-15', 
 '09:00:00'
);


SELECT NOW(), 
       event_date, 
       start_time, 
       DATEDIFF(event_date, DATE(NOW())) AS 'Days to Event', 
       TIMEDIFF(start_time, TIME(NOW())) AS 'Time to Start'
FROM birding_events;

SELECT NOW(), 
       event_date, 
       start_time, 
       CONCAT(
       DATEDIFF(event_date, DATE(NOW())), ' Days, ', DATE_FORMAT(TIMEDIFF(start_time, TIME(NOW())), '%k hours, %i minutes')) AS 'Time to Event'
FROM birding_events;


ALTER TABLE birding_events
ADD COLUMN event_datetime DATETIME;

UPDATE birding_events
SET event_datetime = CONCAT(event_date,SPACE(1), start_time);

SELECT event_date, start_time, event_datetime
FROM birding_events;

SELECT NOW(), 
       event_datetime, 
       CONCAT(
       DATEDIFF(event_datetime, NOW()), ' Days, ', TIME_FORMAT(TIMEDIFF(TIME(event_datetime), CURTIME()), '%k hours, %i minutes')) AS 'Time to Event'
FROM birding_events;

ALTER TABLE birding_events DROP COLUMN event_date, 
                           DROP COLUMN start_time;
