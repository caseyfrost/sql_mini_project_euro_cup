-- Write a SQL query to find the highest number of foul cards given in one match.

SELECT
	COUNT(match_no) AS book_count,
    match_no
FROM 
	euro_cup_2016.player_booked
GROUP BY
	match_no
ORDER BY
	book_count DESC;