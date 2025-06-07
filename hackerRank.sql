--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.--
--Input Format
--The Employee table containing employee data for a company is described as follows:
SELECT name
FROM Employee
ORDER BY name ASC;
--Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
--The CITY table is described as follows:
SELECT NAME
FROM CITY
WHERE CountryCode = 'USA' AND Population > 120000;
--Query all columns (attributes) for every row in the CITY table.
--The CITY table is described as follows:
SELECT *
FROM CITY;
--Query all columns for a city in CITY with the ID 1661.
--The CITY table is described as follows
SELECT *
FROM CITY
WHERE ID = 1661;
--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
--The CITY table is described as follows:
SELECT *
FROM CITY
WHERE CountryCode = 'JPN';

--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
SELECT Name
FROM CITY
WHERE CountryCode = 'JPN';
--Query a list of CITY and STATE from the STATION table.

SELECT CITY, STATE
FROM STATION;

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths.
(
  SELECT CITY, LENGTH(CITY) AS name_length
  FROM STATION
  WHERE LENGTH(CITY) = (
    SELECT MIN(LENGTH(CITY)) FROM STATION
  )
  ORDER BY CITY
  LIMIT 1
)
UNION ALL
(
  SELECT CITY, LENGTH(CITY) AS name_length
  FROM STATION
  WHERE LENGTH(CITY) = (
    SELECT MAX(LENGTH(CITY)) FROM STATION
  )
  ORDER BY CITY
  LIMIT 1
);

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) LIKE 'a%'
   OR LOWER(CITY) LIKE 'e%'
   OR LOWER(CITY) LIKE 'i%'
   OR LOWER(CITY) LIKE 'o%'
   OR LOWER(CITY) LIKE 'u%';

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) LIKE '%a'
   OR LOWER(CITY) LIKE '%e'
   OR LOWER(CITY) LIKE '%i'
   OR LOWER(CITY) LIKE '%o'
   OR LOWER(CITY) LIKE '%u';

--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE
  LOWER(SUBSTRING(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND
  LOWER(SUBSTRING(CITY, LENGTH(CITY), 1)) IN ('a', 'e', 'i', 'o', 'u');
--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
--Input Format
--The STATION table is described as follows
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
  AND CITY NOT LIKE 'E%'
  AND CITY NOT LIKE 'I%'
  AND CITY NOT LIKE 'O%'
  AND CITY NOT LIKE 'U%';
