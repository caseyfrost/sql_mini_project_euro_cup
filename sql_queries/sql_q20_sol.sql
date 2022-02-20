-- Write a SQL query to find the substitute players who came into the field in the first
-- half of play, within a normal play schedule.

WITH sub AS (
SELECT 
	* 
FROM 
	euro_cup_2016.player_in_out
WHERE
	in_out = 'I' AND play_schedule = 'NT' AND play_half = 1
),
    
player AS (
SELECT 
	player_name, player_id
FROM 
	euro_cup_2016.player_mast AS p
)

SELECT
	player.player_name,
    sub.match_no,
    sub.time_in_out,
    sub.play_schedule,
    sub.play_half
FROM
	sub
JOIN
	player
ON
	sub.player_id = player.player_id;