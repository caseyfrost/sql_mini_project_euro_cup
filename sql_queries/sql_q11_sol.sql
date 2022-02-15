-- Write a SQL query to find the players, their jersey number, and playing club who were
-- the goalkeepers for England in EURO Cup 2016.

SELECT
	p.player_name, p.jersey_no, p.playing_club
FROM
	euro_cup_2016.player_mast AS p
WHERE
	p.team_id = 1206 and p.posi_to_play = 'GK';