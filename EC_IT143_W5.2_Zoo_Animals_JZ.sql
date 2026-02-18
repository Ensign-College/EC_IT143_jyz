

-- =============================================
-- Author: JUSTICE YAW ZIGAH
-- Class: EC_IT143
-- Assignment: Week 5.2 My Communities – Create Answers
-- Community: Zoo_Animals
-- Description: SQL analysis answering four selected questions
-- =============================================

USE Zoo_Animals;
GO

-- Question 1
-- Original Author: [Your Name]
-- Question:
-- How many animals have hair?
SELECT COUNT(*) AS Animals_With_Hair
FROM Zoo_animals
WHERE hair = 1;
GO

-- Question 2
-- Original Author: Caroline Moyo
-- Question:
-- How many animals are predators?
SELECT COUNT(*) AS Predator_Count
FROM Zoo_animals
WHERE predator = 1;
GO

-- Question 3
-- Original Author: [Your Name]
-- Question:
-- What is the average number of legs for all animals?
SELECT AVG(legs) AS Average_Number_of_Legs
FROM Zoo_animals;
GO

-- Question 4
-- Original Author: Washington Masapi
-- Question:
-- How many animals are aquatic but not airborne?
SELECT COUNT(*) AS Aquatic_Not_Airborne
FROM Zoo_animals
WHERE aquatic = 1
AND airborne = 0;
GO

Now click:
File → Save As

File name MUST be:

EC_IT143_W5.2_Zoo_Animals_YOURINITIALS.sql

Example if your name is Thabo Mokoena:
EC_IT143_W5.2_Zoo_Animals_TM.sql

Save it to Desktop.

PART 2 — SCRIPT #2 (Social_Media_Addiction)
Click New Query again → Paste this:

-- =============================================
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