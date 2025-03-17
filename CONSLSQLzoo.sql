---LISTADO DE 
1.
--The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';
--Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'germany'

  2.
--Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
--Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

3.
--Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).
 --The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

--SELECT names
--You can use WHERE name LIKE 'B%' to find the countries that start with "B".
--The % is a wild-card it can match any characters
--Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

  2.
--Find the countries that end with y
SELECT name FROM world
  WHERE name LIKE '%Y'

  3.
--Luxembourg has an x - so does one other country. List them both.
--Find the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%X%'

  4.
--Iceland, Switzerland end with land - but are there others?
--Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%land'

  5.
--Columbia starts with a C and ends with ia - there are two more like this.
--Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

6.
--Greece has a double e - who has a double o?
--Find the country that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%oo%'

7.
--Bahamas has three a - who else?
--Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

  8.
--India and Angola have an n as the second character. You can use the underscore as a single character wildcard.
--SELECT name FROM world
 WHERE name LIKE '_n%'
--ORDER BY name
--Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

9.
--Lesotho and Moldova both have two o characters separated by two other characters.
--Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

10.
--Cuba and Togo have four characters names.
--Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____'

 ---Harder Questions
11.
---The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country
--Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital;

12
--The capital of Sweden is Stockholm. Both words start with the letter 'S'.
--Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
--You can use the function LEFT to isolate the first character.
--You can use <> as the NOT EQUALS operator.
SELECT name,
       CASE WHEN continent='Europe' or continent='Asia' THEN 'Eurasia'
            WHEN continent in ('North America','South America','Caribbean') THEN 'America'   
            ELSE continent END
  FROM world
 WHERE name LIKE 'A%' or name LIKE 'B%'
13
--Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
--Find the country that has all the vowels and no spaces in its name.
--You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
--The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name, continent, CASE
                     WHEN continent = 'Oceania' THEN 'Australasia'
                     WHEN continent = 'Eurasia' THEN 'Europe/Asia'
                     WHEN name = 'Turkey' THEN 'Europe/Asia'
    WHEN continent = 'Caribbean' AND name LIKE 'B%' then 'North America'
    WHEN continent = 'Caribbean' THEN 'South America'    
                 ELSE continent END
FROM world ORDER BY name

--SELECT from Nobel Tutorial

1
--Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2
--Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
3
--Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein'
4
--Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000
5
--Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
  FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989
(in My
 BETWEEN is inclusive.. this is not always the case)
6
--Show all details of the presidential winners:
--Theodore Roosevelt
--Thomas Woodrow Wilson
--Jimmy Carter
--Barack Obama
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter')
7
--Show the winners with first name John
SELECT winner FROM nobel
  WHERE winner LIKE 'JOHN %'
8
--Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT * FROM nobel
  WHERE yr = 1980 AND subject = 'Physics'
     OR yr = 1984 AND subject = 'Chemistry'
9
--Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT * FROM nobel
  WHERE yr = 1980
    AND subject NOT IN ('Chemistry','Medicine')
10
--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel
  WHERE yr < 1910 AND subject = 'Medicine'
     OR yr >= 2004 AND subject = 'Literature'

--Harder Questions
11
--Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'
12
--Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel
  WHERE winner = 'Eugene O''Neill'
13
--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir %'
  ORDER BY yr DESC, winner
14
--The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
--Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject in ('Chemistry','Physics'), subject, winner

--SELECT in SELECT
1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
2
SELECT name FROM world
  WHERE continent = 'Europe'
    AND gdp/population > (SELECT gdp/population
                            FROM world
                           WHERE name = 'United Kingdom')
3
SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
                        WHERE name IN ('Argentina','Australia'))
  ORDER BY name
4
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world
                        WHERE name = 'Canada')
    AND population < (SELECT population FROM world
                        WHERE name = 'Poland')
5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world
                          WHERE name = 'Germany')*100,0),'%')
             FROM world WHERE continent = 'Europe'
6

SELECT name FROM world
  WHERE gdp > ALL(SELECT gdp FROM world
                   WHERE gdp > 0 AND continent = 'Europe')
7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
8

SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent=x.continent)
--Got this one to work.. but I'm still not quite sure what the variables are doing.

--Difficult Questions that use techniques not covered in previous sections...
9
SELECT name, continent, population FROM world x
  WHERE 25000000 >= ALL(SELECT population
	                FROM world y
		        WHERE x.continent = y.continent
                        AND y.population>0);
10
SELECT name, continent FROM world x
  WHERE population >= ALL(SELECT population*3
                         FROM world y
                         WHERE x.continent = y.continent
                         and y.name != x.name)

--SUM and COUNT
1
SELECT SUM(population)
FROM world
2

SELECT DISTINCT continent FROM world
3
SELECT SUM(gdp) FROM world
  WHERE continent = 'Africa'

4
SELECT COUNT(name) FROM world
  WHERE area >= 1000000
5
SELECT SUM(population) FROM world
  WHERE name IN ('France','Germany','Spain')
6
SELECT continent, COUNT(name) FROM world
GROUP BY continen
7
SELECT continent, COUNT(name) FROM world
  WHERE population > 10000000
  GROUP BY continent
8
SELECT continent FROM world
  GROUP BY continent
  HAVING SUM(population) > 100000000

--JOIN
1
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'
2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012
3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'
4
SELECT team1, team2, player FROM game
  JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'
5
SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam on (teamid=id)
 WHERE gtime<=10
 6
SELECT mdate,teamname FROM game
  JOIN eteam ON (team1 = eteam.id)
  WHERE coach = 'Fernando Santos'
7
SELECT player FROM goal
  JOIN game ON (matchid = id)
  WHERE stadium = 'National Stadium, Warsaw'

--More Difficult Questions....
8
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1= 'GER' OR team2='GER')
    AND teamid != 'GER'
9
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
10
SELECT stadium, COUNT(*) FROM goal
  JOIN game ON (matchid = id)
  GROUP BY stadium
11
SELECT matchid, mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY mdate,matchid
12
SELECT matchid, mdate, COUNT(*) FROM goal
  JOIN game ON (matchid=id)
  WHERE teamid = 'GER'
  GROUP BY matchid, mdate
13
SELECT DISTINCT mdate, team1,
	SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY id, mdate, team1, team2
ORDER BY mdate, matchid, team1, team2


## More JOIN
1.

SELECT id, title
 FROM movie
 WHERE yr=1962

2.

SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane'
```
3.
```

SELECT id, title, yr FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr
```
4.
```

SELECT title FROM movie
  WHERE id IN (11768, 11955, 21191)
```
5.
```

SELECT id FROM actor
  WHERE name = 'Glenn Close'
```
6.
```

SELECT id FROM movie
  WHERE title = 'Casablanca'
```
7.
```

SELECT name FROM casting JOIN actor ON (id=actorid)
  WHERE movieid=11768
```
8.
```

SELECT name FROM casting
  JOIN actor ON (actor.id=actorid)
  JOIN movie ON (movie.id=movieid)
  WHERE title = 'Alien'
```
9.
```

SELECT title FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE name = 'Harrison Ford'
```
10.
```

SELECT title FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE name = 'Harrison Ford'  AND ord > 1
```
11.
```

SELECT title, name FROM casting
  JOIN movie ON (movie.id = movieid)
  JOIN actor ON (actor.id = actorid)
  WHERE yr = 1962 and ord = 1
```
### Harder Questions
12.
```

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)
```
13.
```

SELECT title, name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1
	AND movie.id IN
	(SELECT movie.id FROM movie
	   JOIN casting ON movie.id = movieid
	   JOIN actor ON actor.id = actorid
           WHERE actor.name = 'Julie Andrews')
```
14.
```

SELECT DISTINCT name FROM casting
  JOIN movie ON movie.id = movieid
  JOIN actor ON actor.id = actorid
  WHERE actorid IN (
	SELECT actorid FROM casting
	  WHERE ord = 1
	  GROUP BY actorid
	  HAVING COUNT(actorid) >= 30)
ORDER BY name
```
15.
```

SELECT title, COUNT(actorid) FROM casting
  JOIN movie ON movieid = movie.id
  WHERE yr = 1978
  GROUP BY movieid, title
  ORDER BY COUNT(actorid) DESC
```
16.
```

SELECT DISTINCT name FROM casting
  JOIN actor ON actorid = actor.id
  WHERE name != 'Art Garfunkel'
	AND movieid IN (
		SELECT movieid
		FROM movie
		JOIN casting ON movieid = movie.id
		JOIN actor ON actorid = actor.id
		WHERE actor.name = 'Art Garfunkel'
)
```
## Using NULL
1.
```

SELECT name FROM teacher
  WHERE dept IS NULL
```
2.
```

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
```
3.
```

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```
4.
```

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
```
5.
```

SELECT teacher.name, COALESCE(teacher.mobile,'07986 444 2266')  FROM teacher
```
6.
```

SELECT teacher.name, COALESCE(dept.name,'None') FROM teacher
  LEFT JOIN dept ON teacher.dept = dept.id
```
7.
```

SELECT COUNT(name), COUNT(mobile) FROM teacher
```
8.
```

SELECT dept.name, COUNT(teacher.dept) FROM teacher
  RIGHT JOIN dept ON dept.id = teacher.dept
  GROUP BY dept.name
```
9.
```

SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
                  ELSE 'Art'
                  END
                  FROM teacher
```
10.
```

SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci'
                  WHEN dept = 3 THEN 'Art'
                  ELSE 'None'
                  END
                  FROM teacher
```
## Self JOIN
1.
```

SELECT DISTINCT COUNT(*) FROM stops
```
2.
```

SELECT id FROM stops
  WHERE name = 'Craiglockhart'
```
3.
```

SELECT id, name FROM stops JOIN route ON (stops.id = route.stop)
  WHERE num = 4
```
4.
```

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2
```
5.
```

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')
```
6.
```

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'
```
7.
```

SELECT a.company, a.num  
FROM route a, route b
WHERE a.num = b.num AND (a.stop = 115 AND b.stop = 137)
GROUP BY num;
```
8.
```

SELECT a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross';
```
9.
```

SELECT DISTINCT name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53;
```
10.
```

SELECT a.num, a.company, stopb.name, c.num, c.company
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN (route c JOIN route d ON (c.company = d.company AND c.num = d.num))
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopc ON c.stop = stopc.id
JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart'
	AND stopd.name = 'Sighthill'
	AND stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.name, LENGTH(c.num), d.num;
```
