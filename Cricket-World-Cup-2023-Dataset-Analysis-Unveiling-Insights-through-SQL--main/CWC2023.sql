
-- Retrieve all columns for matches played in a specific city.
SELECT * FROM CWC2023 WHERE City = 'Mumbai';

-- Count the total number of matches played at each stadium.
SELECT Stadium, COUNT(Stadium) AS Num_of_matches FROM CWC2023 GROUP BY Stadium;

-- Find the teams that won the toss and chose to bat.
SELECT Toss_Winner, Toss_Decision FROM CWC2023 WHERE Toss_Decision = 'Bat';

-- Calculate the average run rate for all matches.
SELECT Match_ID, (Runrate_A + Runrate_B) / 2 AS Avg_Runrate FROM CWC2023;

-- Retrieve the match where the winning team had the highest run margin.
SELECT TOP 1 Team_A, Team_B, Wining_Team, 
  MAX(CAST(SUBSTRING(Margin, 1, CHARINDEX(' ', Margin) - 1) AS INT)) AS Max_Margin
FROM CWC2023 
WHERE Margin LIKE '%Runs%'
GROUP BY Team_A, Team_B, Wining_Team
ORDER BY Max_Margin DESC;

-- Identify matches where the total score (Team A + Team B) is above 600 runs.
SELECT Team_A, Score_A, Team_B, Score_B, (Score_A + Score_B) As Total_Score 
FROM CWC2023 
WHERE (Score_A + Score_B) > 600 ;

-- Calculate the total number of boundaries (4s + 6s) for each match.
SELECT Match_ID, Team_A, Team_B, SUM(Boundaries_A + Boundaries_B) AS Total_Boundaries
FROM CWC2023
GROUP BY Match_ID, Team_A, Team_B
ORDER BY Total_Boundaries DESC;

-- Determine the top 5 cities, matches with the highest average run rate.
SELECT DISTINCT TOP 5 Team_A, Team_B, City, (Runrate_A + Runrate_B) / 2 AS Avg_runrate 
FROM CWC2023
ORDER BY Avg_runrate DESC;

-- Retrieve matches where the same team won the toss and the match.
SELECT Match_ID, Team_A, Team_B, Toss_Winner, Wining_Team
FROM CWC2023 
WHERE Toss_Winner = Wining_Team;

-- Find matches where the winning team's score is within a specific range.
SELECT Match_ID, Team_A, Score_A, Team_B, Score_B, Wining_Team
FROM CWC2023
WHERE Score_A BETWEEN 350 AND 400 OR Score_B BETWEEN 350 AND 400;

-- Identify matches where the difference in overs played between Team A and Team B is significant.
SELECT Match_ID, Team_A, Overs_Played_A, Team_B, Overs_Played_B FROM CWC2023
WHERE (Overs_Played_A - Overs_Played_B) > 10 OR (Overs_Played_B - Overs_Played_A) > 10;

-- Calculate the average margin of victory for matches in each stadium for teams who batted first.
SELECT Stadium,
  AVG(CAST(SUBSTRING(Margin, 1, CHARINDEX(' ', Margin) - 1) AS INT)) AS Avg_Margin
FROM CWC2023
WHERE Margin LIKE '%Runs%'
GROUP BY Stadium;

-- Calculate the average score for each team across all matches.
SELECT Team, AVG(Score) AS Avg_score 
FROM (
  SELECT Team_A AS Team, Score_A AS Score FROM CWC2023
  UNION ALL
  SELECT Team_B AS Team, Score_B AS Score FROM CWC2023
) AS All_Teams
GROUP BY Team;

-- Determine matches where the winning team had the highest number of 6s.
SELECT M1.Match_ID, M1.Team_A, M1.Team_B, M1.Wining_Team, _6s_A, _6s_B
FROM CWC2023 AS M1
JOIN (
  SELECT Match_ID, Team_A, Team_B, Wining_Team 
  FROM CWC2023
) AS M2
ON M1.Match_ID = M2.Match_ID
WHERE (M1.Team_A = M2.Wining_Team AND M1._6s_A > M1._6s_B)
OR (M1.Team_B = M2.Wining_Team AND M1._6s_B > M1._6s_A);

-- List matches where the total wides and no-balls exceed a certain limit.
SELECT Match_ID, Team_A, Wides_A, No_Balls_A, Team_B, Wides_B, No_Balls_B 
FROM CWC2023
WHERE (Wides_A + No_Balls_A + Wides_B + No_Balls_B) > 30;
