SELECT
	COUNT(p.match_no) as booked_in_stop
FROM
	euro_cup_2016.player_booked as p
WHERE
	play_schedule = 'ST';