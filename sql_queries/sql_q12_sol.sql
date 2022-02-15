-- Write a SQL query that returns the total number of goals scored by each position on
-- each country’s team. Do not include positions which scored no goals.

SELECT
	COUNT(g.goal_id),
    p.posi_to_play
FROM
	euro_cup_2016.goal_details AS g
JOIN
	euro_cup_2016.player_mast AS p
ON
	g.player_id = p.player_id
GROUP BY p.posi_to_play;