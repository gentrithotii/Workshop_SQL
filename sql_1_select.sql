# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
#
SELECT "hello world",123;
#
# 2: Get everything from the city table
# (Hint: Many many rows)
SELECT * FROM city;
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
SELECT * FROM city WHERE district = "aceh";
#
# 4: Get only the name of the cities where the countrycode is "bfa"
SELECT Name FROM city WHERE CountryCode = "bfa";
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
SELECT Name , district FROM city WHERE countrycode = "tto";
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
SELECT  c.Name AS nm , c.District as dist FROM city AS c WHERE c.CountryCode = "arm" ;
#
# 7: Get the cities with a name that starts with "bor"
SELECT * FROM city AS c WHERE c.Name LIKE "bor%";
#
# 8: Get the cities with a name that contains the string "orto"
SELECT * FROM city AS c WHERE c.Name LIKE "%orto%";
#
# 9: Get the cities that has a population below 1000
SELECT * FROM city AS c WHERE c.Population < 1000;
#
# 10: Get the unique countrycodes from the cities that has a population below 1000
SELECT DISTINCT c.CountryCode FROM city AS c WHERE c.Population < 1000;
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT * FROM city AS c WHERE c.Population > 1000000 AND c.CountryCode = 'UKR';
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
SELECT * FROM city as c WHERE c.Population < 200 OR c.Population > 9500000;
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT * FROM city AS c WHERE c.CountryCode IN ("TJK" , "MRT" ,"AND" , "PNG" ,"SJM");
#
# 14: Get the cities with a population between 200 and 700 inclusive
SELECT * FROM city as c WHERE c.Population   between 200 AND 700;
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
SELECT * FROM country as c WHERE c.Population   between 8000 AND 20000;
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0
SELECT c.Name , c.IndepYear FROM country as c WHERE c.IndepYear < 0;
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
SELECT * FROM country as c WHERE c.IndepYear IS NULL AND c.Population > 1000000;
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT * FROM country as c WHERE c.SurfaceArea < 10 AND c.LifeExpectancy > 0;
#

