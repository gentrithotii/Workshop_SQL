# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT *  
FROM city AS c 
WHERE c.Name LIKE "ping%" 
ORDER BY c.Population ASC;   
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT *  
FROM city AS c 
WHERE c.Name LIKE "ran%" 
ORDER BY c.Population DESC;   
#
# 3: Count all cities
SELECT count(*) AS NumberOfCities 
FROM city as c;
 
#
# 4: Get the average population of all cities
SELECT avg(c.Population) 
FROM city as c; 
#
# 5: Get the biggest population found in any of the cities
SELECT max(c.Population)  FROM city as c;
SELECT c.Name, c.Population 
FROM city as c 
WHERE c.Population = (SELECT max(Population) FROM city);
#
# 6: Get the smallest population found in any of the cities
SELECT min(c.Population)  FROM city as c;
#
# 7: Sum the population of all cities with a population below 10000
SELECT sum(c.Population)
FROM city AS c 
WHERE c.population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT count(c.CountryCode) 
FROM city AS c 
WHERE c.CountryCode IN ("MOZ", "VNM");
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT c.CountryCode,  COUNT(*) AS City_Count 
FROM city AS c 
WHERE c.CountryCode IN ("MOZ", "VNM")
GROUP BY c.CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
SELECT AVG(c.Population) AS Average_Population
 FROM city AS c
 WHERE c.CountryCode IN ("MOZ", "VNM");
#
# 11: Get the countrycodes with more than 200 cities
SELECT  c.CountryCode , COUNT(*)   as amount_of_cities 
FROM city AS c 
GROUP BY c.CountryCode 
HAVING COUNT(*) >200;   
 
 # 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT  c.CountryCode , COUNT(*)   AS amount_of_cities
 FROM city AS c 
 GROUP BY c.CountryCode 
 HAVING COUNT(*) >200 
 ORDER BY count(c.CountryCode) DESC;  
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT c.Name, cl.Language, c.Population
FROM city AS c 
JOIN countrylanguage AS cl ON c.CountryCode =  cl.CountryCode
WHERE c.Population BETWEEN 400 AND 500;

#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT c.Name, cl.Language, c.Population
FROM city AS c 
JOIN countrylanguage AS cl
ON c.CountryCode =  cl.CountryCode
WHERE c.Population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT c.Name AS City_Name, c.Population
FROM city AS c
WHERE c.CountryCode = (
    SELECT city.CountryCode
    FROM city
    WHERE city.Population = 122199
    );
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT c.Name AS City_Name, c.Population
FROM city AS c
WHERE c.CountryCode = (
    SELECT city.CountryCode
    FROM city
    WHERE  city.Population IN (122199) 
    ) AND c.Population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
SELECT c.Name
FROM city as c
WHERE c.CountryCode LIKE (
	SELECT city.CountryCode
    FROM city
    WHERE city.Name = "Luanda");
    
SELECT * FROM city WHERE  city.CountryCode = "AGO";
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT c.Name
FROM country cr
JOIN city c ON cr.Capital = c.ID
WHERE cr.Region = (
    SELECT cr2.Region
    FROM city y
    JOIN country cr2 ON y.CountryCode = cr2.Code
    WHERE y.Name = 'Yaren'
);
 
SELECT * FROM city AS c WHERE  c.name = "Yaren";
SELECT * FROM country AS cr WHERE cr.Code = "NRU";
SELECT * FROM country AS cr WHERE cr.Region = "Micronesia";

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT cl.Language
FROM country cr
JOIN countryLanguage cl ON cr.Code = cl.CountryCode
WHERE cr.Region = (
    SELECT cr2.Region
    FROM city y
    JOIN country cr2 ON y.CountryCode = cr2.Code
    WHERE y.Name = "Riga"
);

# 20: Get the name of the most populous city
SELECT c.Name
FROM city as c 
WHERE c.Population = (SELECT max(city.Population) FROM city)
#