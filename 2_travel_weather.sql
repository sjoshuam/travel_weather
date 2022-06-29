##########==========##########==========##########==========##########==========
##########==========##########==========##########==========##########==========

## this script sets up a MySQL database to provide ad hoc weather queries
## See README_SQL.md for details

#########################
## Connection settings ##
#########################

SET SQL_SAFE_UPDATES = 0;
SET GLOBAL local_infile = 1;
## OPT_LOCAL_INFILE=1 #add to mysqlbench connection

#####################
## Create Database ##
#####################

/*

## reset databases
DROP DATABASE IF EXISTS travel_weather;
CREATE DATABASE travel_weather;
USE travel_weather; 

## create route data table
CREATE TABLE route (
route varchar(32),
pre_travel varchar(16),
drive_mileage smallint,
trip_days tinyint,
best_temp_1 varchar(8),
best_temp_2 varchar(8),
states_etc varchar(32),
PRIMARY KEY (route)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/routes_for_sql.csv'
INTO TABLE route FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DELETE FROM route WHERE route is NULL;

## create city data table
CREATE TABLE city (
num int,
city varchar(32),
state varchar(4),
route varchar(32),
visit tinyint CHECK (visit = 0 OR visit = 1),
photo tinyint CHECK (photo = 0 OR photo = 1),
score tinyint CHECK (score >= 0 OR score <= 1),
lon float CHECK (lon >= -180 OR lon <= 180),
lat float CHECK (lat >= -90 OR lat <= 90),
photo_date varchar(8),
PRIMARY KEY (city),
FOREIGN KEY (route) REFERENCES route (route)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/cities_for_sql.csv'
INTO TABLE city FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

DELETE FROM city WHERE city is NULL;

## create weather data table
CREATE TABLE weather (
weather_id int,
city varchar(32),
day smallint CHECK (day > 0 AND day < 367),
hour tinyint CHECK (hour > 0 AND hour < 25),
score float CHECK (score >= 0 AND score <= 1),
PRIMARY KEY (weather_id),
FOREIGN KEY (city) REFERENCES city(city)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/city_score.csv'
INTO TABLE weather FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

DELETE FROM weather WHERE weather_id is NULL;

## create calendar data table
CREATE TABLE calendar (
example varchar(10),
month smallint CHECK (month > 0 AND month < 32),
half_month float CHECK (half_month > 0 AND half_month < 13),
day smallint CHECK (day > 0 AND day < 32),
day_of_year smallint CHECK (day_of_year > 0 AND day_of_year < 367),
leap_example varchar(10),
leap_month smallint CHECK (leap_month > 0 AND leap_month < 13),
leap_half_month float CHECK (leap_half_month > 0 AND leap_half_month < 13),
leap_day smallint CHECK (leap_day > 0 AND leap_day < 32),
PRIMARY KEY (day_of_year)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/A_Input/calendar.csv'
INTO TABLE calendar FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

DELETE FROM calendar WHERE day_of_year is NULL;

## simplify data to temperate hours per day
CREATE TABLE daily_weather AS SELECT city, day, SUM(score) as tw_hours FROM weather
WHERE hour BETWEEN 7 AND 19
GROUP BY city, day;

## simplify data to average temperate hours per half-month
CREATE TABLE bimonthly_weather AS SELECT daily_weather.city, city.state, half_month, AVG(tw_hours) as avg_tw FROM daily_weather
LEFT JOIN calendar ON daily_weather.day = calendar.day_of_year
LEFT JOIN city ON daily_weather.city = city.city
GROUP BY daily_weather.city, half_month
ORDER BY half_month ASC, avg_tw DESC, daily_weather.city ASC;
DROP TABLE daily_weather;

*/

##############################
## Formulate Ad-Hoc Queries ##
##############################

## select database
USE travel_weather;

## view raw materials
/*
SELECT * FROM bimonthly_weather LIMIT 3;
SELECT * FROM calendar LIMIT 3;
SELECT * FROM city LIMIT 3;
SELECT * FROM route LIMIT 3;
SELECT * FROM weather LIMIT 3;
*/


## When is the best time to visit X states during Y half-months?
/*
SELECT half_month, ROUND(AVG(avg_tw), 1) as good_hours FROM bimonthly_weather 
WHERE state in ("MI", "WI")
GROUP BY half_month
HAVING good_hours >= 6
ORDER BY half_month ASC;
*/


## What fraction of cities are generally temperate on a given route in each half-month?
/*
DROP VIEW IF EXISTS bwc;
CREATE VIEW bwc AS (SELECT * FROM bimonthly_weather LEFT JOIN city USING (city, state));
SELECT route, half_month, ROUND(AVG(avg_tw >= 6), 2) AS good_weather FROM bwc
WHERE route = 'Georgia Plus'
GROUP BY half_month, route;
*/


## Which states have the least-bad worst-month weather?
/*
SELECT state, ROUND(MIN(avg_tw), 1) as good_weather FROM bimonthly_weather
GROUP BY state ORDER BY good_weather DESC LIMIT 5;
*/

## When is the best time to visit each city?
/*
DROP VIEW IF EXISTS bm;
CREATE VIEW bm AS (SELECT city, MAX(avg_tw) AS avg_tw FROM bimonthly_weather GROUP BY CITY);
SELECT * FROM bm LEFT JOIN bimonthly_weather USING (city, avg_tw)
ORDER BY half_month, city;
*/

## How good is the weather in each half-month for a custom table of cities?
DROP TABLE IF EXISTS cl;
CREATE TABLE cl (city varchar(32));
INSERT INTO cl (city) VALUES
	("Pittsburgh PA"), ("Cleveland OH"),
    ("Detroit MI"), ("Lansing MI"), ("Grand Rapids MI"),
    ("Green Bay WI"), ("Milwaukee WI"), ("Madison WI"),
    ("Chicago IL"), ("Davenport IA");
    
SELECT half_month, ROUND(MIN(avg_tw), 1) AS min, ROUND(AVG(avg_tw), 1) AS mean FROM cl 
LEFT JOIN bimonthly_weather USING (city)
GROUP BY half_month 
HAVING half_month > 7 AND half_month < 10
ORDER BY half_month ASC;


    


##########==========##########==========##########==========##########==========
##########==========##########==========##########==========##########==========