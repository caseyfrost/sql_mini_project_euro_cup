-- Write a SQL query to find referees and the number of matches they worked in each
-- venue

WITH refs AS (
SELECT
	m.match_no,
    m.referee_id,
    m.venue_id,
    r.referee_name,
    v.venue_name
FROM
	euro_cup_2016.match_mast AS m
JOIN
	euro_cup_2016.referee_mast as r
ON
	m.referee_id = r.referee_id
JOIN
	euro_cup_2016.soccer_venue AS v
ON
	v.venue_id = m.venue_id
)

SELECT
	refs.referee_name AS ref,
    refs.venue_name AS venue,
    COUNT(refs.match_no)
FROM
	refs
GROUP BY ref, venue;