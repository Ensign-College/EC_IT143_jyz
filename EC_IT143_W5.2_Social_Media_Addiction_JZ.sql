-- Author: [Your Full Name]
-- Class: EC_IT143
-- Assignment: Week 5.2 My Communities – Create Answers
-- Community: Social_Media_Addiction
-- Description: SQL analysis answering four selected questions
-- =============================================

USE Social_media_addiction;
GO

-- Question 1
-- Original Author: [Your Name]
-- Question:
-- What is the average daily usage time by platform?

SELECT
Platform,
AVG(Daily_Usage_Time_min) AS Avg_Daily_Usage_Minutes
FROM Social_media_addiction
GROUP BY Platform
ORDER BY Avg_Daily_Usage_Minutes DESC;
GO

-- Question 2
-- Original Author: Michael Abifarin
-- Question:
-- Which platform has the highest average addiction level?

SELECT
Platform,
AVG(Addiction_Level) AS Avg_Addiction_Level
FROM Social_media_addiction
GROUP BY Platform
ORDER BY Avg_Addiction_Level DESC;
GO

-- Question 3
-- Original Author: [Your Name]
-- Question:
-- What is the relationship between daily usage time and productivity loss?

SELECT
Daily_Usage_Time_min,
Productivity_Loss_Score
FROM Social_media_addiction
ORDER BY Daily_Usage_Time_min DESC;
GO

-- Question 4
-- Original Author: Samuella Mei
-- Question:
-- What is the average mental health index by emotional state post usage?

SELECT
Emotional_State_Post_Usage,
AVG(Mental_Health_Index) AS Avg_Mental_Health_Index
FROM Social_media_addiction
GROUP BY Emotional_State_Post_Usage
ORDER BY Avg_Mental_Health_Index DESC;
GO