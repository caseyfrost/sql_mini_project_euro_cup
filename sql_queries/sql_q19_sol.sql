-- Write a SQL query to find the number of captains who were also goalkeepers.

WITH gks AS (
SELECT
	player_id AS id
FROM 
	euro_cup_2016.player_mast
WHERE
	posi_to_play = 'GK'
)

SELECT
	COUNT(match_no) AS num_gk_caps
FROM
	euro_cup_2016.match_captain AS mc
WHERE
	mc.player_captain IN (SELECT id FROM gks)