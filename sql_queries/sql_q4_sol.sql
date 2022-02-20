SELECT
	COUNT(p.match_no) AS match_count,
    m.play_stage AS play_stage
FROM
	euro_cup_2016.player_in_out as p
INNER JOIN 
	euro_cup_2016.match_mast as m
GROUP BY
	m.play_stage;
    

