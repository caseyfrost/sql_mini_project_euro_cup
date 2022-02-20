WITH wins AS (
SELECT
	match_no,
    goal_score
FROM
	euro_cup_2016.match_details 
WHERE 
	win_lose = 'W' AND decided_by = 'N'
),

losses AS (
SELECT
	match_no,
    goal_score
FROM
	euro_cup_2016.match_details
WHERE
	win_lose = 'L' AND decided_by = 'N'
),
    
result AS (
SELECT
	wins.match_no,
    ABS(wins.goal_score - losses.goal_score) AS dif
FROM
	wins
JOIN
	losses
ON
	wins.match_no = losses.match_no)

SELECT
	COUNT(result.match_no) AS count_matches_won_by_one_point
FROM
	result
WHERE
	result.dif = 1;