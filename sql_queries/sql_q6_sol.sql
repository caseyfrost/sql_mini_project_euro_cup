-- Write a SQL query to find the number of matches that were won by a single point, but
-- do not include matches decided by penalty shootout.

-- One CTE of a self join
WITH difs AS (
SELECT
	m1.match_no,
	m1.goal_score - m2.goal_score AS dif
FROM
	euro_cup_2016.match_details AS m1
INNER JOIN
	euro_cup_2016.match_details AS m2
		ON
			m1.match_no = m2.match_no
		AND
			m1.decided_by = 'N'
		AND
			m1.win_lose != m2.win_lose
		AND
			m1.win_lose = 'W')
            
SELECT
	COUNT(match_no) AS count_matches_won_by_one_point
FROM
	difs
WHERE
	dif = 1;


-- Multiple CTE without self join
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
