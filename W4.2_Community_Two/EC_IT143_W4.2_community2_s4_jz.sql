CREATE VIEW v_community2_player_count
AS
SELECT TeamName, COUNT(*) AS PlayerCount
FROM CommunityTwoTable
GROUP BY TeamName;
