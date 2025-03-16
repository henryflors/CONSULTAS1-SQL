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
(in MySQL BETWEEN is inclusive.. this is not always the case)
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
