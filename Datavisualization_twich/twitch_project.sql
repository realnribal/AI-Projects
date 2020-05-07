--1. Start by getting a feel for the stream table and the chat table
SELECT *
FROM stream
LIMIT 20;

--What are the unique games in the stream table?
SELECT DISTINCT game
FROM stream;

--3. the unique channels in the stream table
SELECT DISTINCT channel
FROM stream;

--4. What are the most popular games in the stream table?
SELECT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY 2 DESC;

--5. Where are these  League of Legends stream viewers located?
SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY 2 DESC;

--6. Create a list of players and their number of streamers.
SELECT player, COUNT(*)
FROM stream
GROUP BY player
ORDER BY 2 DESC;

--7. Create a new column named genre for each of the games
SELECT game,
 CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;
--9. Return seconds for time stamps
SELECT time,
   strftime('%M', time)
FROM stream
GROUP BY 1
LIMIT 20;
--10 Let’s write a query that returns three columns:
--The hours of the time column
--The view count for each hour
--Lastly, filter the result with only the users in your country .
SELECT strftime('%H', time), count(*)
FROM stream
WHERE country = 'FR'
GROUP BY 1;