-- Write a SQL query to find the match number for the game with the highest number of
-- penalty shots, and which countries played that match.

WITH teams AS (
SELECT
	m.match_no, m.team_id, c.country_name
FROM
	euro_cup_2016.match_details AS m
JOIN
	euro_cup_2016.soccer_country AS c
ON
	m.team_id = c.country_id
),

countries AS(
SELECT
	t1.match_no,
    t1.country_name AS country1,
    t2.country_name AS country2
FROM
	teams AS t1, teams AS t2
WHERE
	t1.match_no = t2.match_no AND t1.team_id < t2.team_id
)

SELECT
	p.match_no,
    p.kick_no,
    c.country1,
    c.country2
FROM
	euro_cup_2016.penalty_shootout AS p
JOIN
	countries AS c
ON
	p.match_no = c.match_no
ORDER BY
	p.kick_no DESC
LIMIT
	1;
