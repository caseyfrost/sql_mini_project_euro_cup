-- Write a SQL query to find all the defenders who scored a goal for their teams.

SELECT
	g.goal_id,
	p.player_name,
    p.posi_to_play
FROM
	euro_cup_2016.goal_details AS g
JOIN
	euro_cup_2016.player_mast AS p
ON
	g.player_id = p.player_id
WHERE p.posi_to_play IN ('DF', 'FD');