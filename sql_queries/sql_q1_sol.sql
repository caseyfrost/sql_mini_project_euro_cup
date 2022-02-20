-- Write a SQL query to find the date EURO Cup 2016 started on

SELECT
	play_date
FROM
	euro_cup_2016.match_mast
WHERE match_no = 1;

--
SELECT
	MIN(play_date)
FROM
	euro_cup_2016.match_mast;