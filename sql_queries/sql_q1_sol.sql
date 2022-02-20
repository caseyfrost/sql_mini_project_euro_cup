EXPLAIN ANALYZE
SELECT
	play_date
FROM
	euro_cup_2016.match_mast
WHERE match_no = 1;

EXPLAIN ANALYZE
SELECT
	MIN(play_date)
FROM
	euro_cup_2016.match_mast;