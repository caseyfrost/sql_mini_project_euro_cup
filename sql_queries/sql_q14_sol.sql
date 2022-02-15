-- Write a SQL query to find referees and the number of bookings they made for the
-- entire tournament. Sort your answer by the number of bookings in descending order.

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
    refs.match_no,
    refs.referee_name
FROM
	euro_cup_2016.player_booked AS pb
JOIN
	refs
ON
	pb.match_no = refs.match_no
GROUP BY
	refs.match_no, refs.referee_name