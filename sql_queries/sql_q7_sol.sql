SELECT
	m.match_no, v.venue_name As venue
FROM
	euro_cup_2016.match_mast AS m, euro_cup_2016.soccer_venue AS v
WHERE
	m.decided_by = 'P' AND m.venue_id = v.venue_id;