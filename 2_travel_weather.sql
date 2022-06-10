##########==========##########==========##########==========##########==========
##########==========##########==========##########==========##########==========

## this script sets up a MySQL database to provide ad hoc weather queries
## See README_SQL.md for details

#####################
## Set up database ##
#####################

/*  comment out database set-up - START

## configuration reminders (if needed)
##SET GLOBAL local_infile = 1;
## OPT_LOCAL_INFILE=1 #add to mysqlbench connection

## reset databases
CREATE DATABASE IF NOT EXISTS travel_weather;
USE travel_weather; 
DROP TABLE IF EXISTS weather;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS route;

## create route data table
CREATE TABLE route (
route varchar(32), pre_travel varchar(16), drive_mileage smallint,
trip_days tinyint, best_temp_1 varchar(8), best_temp_2 varchar(8),
states_etc varchar(32),
PRIMARY KEY (route)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/routes_for_sql.csv'
INTO TABLE route FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES;

## create city data table
CREATE TABLE city (
Num int, City varchar(32), State varchar(4), Route varchar(32),
Visit tinyint, Photo tinyint, Score tinyint, lon float, lat float,
Photo_Date varchar(8),
PRIMARY KEY (City),
FOREIGN KEY (Route) REFERENCES route(route)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/cities_for_sql.csv'
INTO TABLE city FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

## create weather data data
CREATE TABLE weather (
weather_id int, city varchar(32),
day smallint, hour tinyint, score float,
PRIMARY KEY (weather_id),
FOREIGN KEY (city) REFERENCES city(City)
);

LOAD DATA LOCAL INFILE '/Users/s8/Documents/Coding/travel_weather/B_Process/city_score.csv'
INTO TABLE weather FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

*/ ## comment out database set-up - END

##############################
## Formulate Common Queries ##
##############################

## prep - select database and cull irrelevant weather data
USE travel_weather;
SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS day_weather;
CREATE TABLE day_weather AS SELECT * FROM weather WHERE hour BETWEEN 7 AND 19;
ALTER TABLE day_weather ADD PRIMARY KEY (weather_id);

## Average weather score for each state
ALTER TABLE day_weather ADD week smallint;
UPDATE day_weather SET week = MOD(day, 7);
DELETE FROM day_weather WHERE weather_id IS NULL;

DROP TABLE IF EXISTS state_avg;
CREATE TABLE state_avg AS SELECT * FROM day_weather LEFT JOIN city ON day_weather.city = city.City;
#SELECT State, week, AVG(score) FROM state_avg GROUP BY State, week;



#SELECT city, MOD(day) AS month, AVG(score) FROM day_weather GROUP BY (city, month);

## Best weather for a single city

## Best city for each week

#SELECT * FROM weather LIMIT 2;
#SELECT * FROM city LIMIT 2;
#SELECT * FROM route LIMIT 2;
#SELECT DISTINCT hour FROM weather;

##########==========##########==========##########==========##########==========
##########==========##########==========##########==========##########==========