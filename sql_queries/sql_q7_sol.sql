-- Write a SQL query to find all the venues where matches with penalty shootouts were
-- played.

-- Slightly faster
SELECT
	m.match_no, v.venue_name As venue
FROM
	euro_cup_2016.match_mast AS m, euro_cup_2016.soccer_venue AS v
WHERE
	m.decided_by = 'P' AND m.venue_id = v.venue_id;
    
-- 
SELECT
	m.match_no, v.venue_name As venue
FROM
	euro_cup_2016.match_mast AS m
JOIN
	euro_cup_2016.soccer_venue AS v
ON
	m.decided_by = 'P' AND m.venue_id = v.venue_id;