WITH wins AS (
SELECT
	* 
FROM
	euro_cup_2016.match_details 
WHERE 
	win_lose = 'W' AND decided_by = 'N'
),

losses AS (
SELECT
	*
FROM
	euro_cup_2016.match_details
WHERE
	win_lose = 'L' AND decided_by = 'N'
),
    
result AS (
SELECT
	wins.match_no,
    wins.goal_score as win_goals,
    losses.goal_score as loss_goals,
    ABS(wins.goal_score - losses.goal_score) as dif
FROM
	wins
JOIN
	losses
ON
	wins.match_no = losses.match_no)

SELECT
	result.match_no, result.win_goals, result.loss_goals, result.dif
FROM
	result
WHERE
	result.dif = 1;