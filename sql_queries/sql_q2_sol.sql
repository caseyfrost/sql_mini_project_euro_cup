SELECT
	COUNT(match_no) as matches_by_pk
FROM 
	euro_cup_2016.match_mast
WHERE 
	decided_by = 'P';