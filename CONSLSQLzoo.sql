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

--ERROR

