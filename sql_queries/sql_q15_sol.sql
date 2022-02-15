-- Write a SQL query to find the referees who booked the most number of players.

WITH refs AS (
SELECT
	m.match_no, m.referee_id, r.referee_name
FROM
	euro_cup_2016.match_mast AS m
JOIN
	euro_cup_2016.referee_mast as r
ON
	m.referee_id = r.referee_id
)

SELECT
	COUNT(pb.booking_time) AS num_of_bookings,
    refs.referee_name
FROM
	euro_cup_2016.player_booked AS pb
JOIN
	refs
ON
	pb.match_no = refs.match_no
GROUP BY
	refs.referee_name