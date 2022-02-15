-- Write a SQL query to find the country where the most assistant referees come from,
-- and the count of the assistant referees.

WITH refs AS (
SELECT
	COUNT(r.ass_ref_id) AS ref_count,
    c.country_name as country
FROM
	euro_cup_2016.asst_referee_mast AS r
JOIN
	euro_cup_2016.soccer_country AS c
ON
	r.country_id = c.country_id
GROUP BY
	country
)

SELECT
	*
FROM
	refs
ORDER BY
	ref_count DESC;