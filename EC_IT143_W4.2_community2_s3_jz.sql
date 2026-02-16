
SELECT TeamName, COUNT(*) AS PlayerCount
FROM CommunityTwoTable
GROUP BY TeamName;
