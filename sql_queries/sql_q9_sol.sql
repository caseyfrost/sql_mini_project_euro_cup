-- Write a SQL query to find the goalkeeper’s name and jersey number, playing for
-- Germany, who played in Germany’s group stage matches.
SELECT
	p.player_name, p.jersey_no
FROM
	euro_cup_2016.match_details AS m
JOIN
	euro_cup_2016.player_mast AS p
ON
	m.player_gk = p.player_id
WHERE
	m.team_id = 1208 AND m.play_stage = 'G'
GROUP BY
	p.player_name, p.jersey_no;