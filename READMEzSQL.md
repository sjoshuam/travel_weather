# Overview
This SQL project is an add-on to the primary Python project. The main project
scores the temperateness of the weather for each of my planned read trip routes.
This project creates an SQL database of weather scores to facilitate
customized, ad hoc searches.  It is entirely based on data projects from the
main project.

Aside from convenience queries, this is
mostly for practice purposes.

# Task Board

## Task Description

1. PTP - Plan The Project.
2. BDB - Build Database.
3. FCQ - Formulate Common Queries. Should be able to support:
  + Best weather for a single city
  + Average weather for cities in a given state.
4. FVQ - Formulate Various Queries.
  + Use as wide a range of SQL query keywords as practical
5. UTG - Upload to GitHub.

## Task Matrix

|   | X |
|:- |:- |
|PTP|X  |
|BDB|X  |
|FCQ|X  |
|FVQ|   |
|UTG|X  |
| = |4.0|

Progress: 4.0 / 5.0 = 80%

|_Key:_|
|:-|
|X = Done|
|/ = >50% Done|
|  = Not Done|

## TODO
+ Add code to Python script to make csv versions of city_list tables

+ Look for ways to incorporate various query types:
  + SELECT FROM WHERE ORDER BY LIMIT
  + INNER/LEFT/OUT/CROSS JOIN
  + UNION/INTERSECT
  + AVG COUNT SUM MAX MIN
  + LAG LEAD NTILE
  + LIKE/%/_ BETWEEN AND
+ Look for ways to incorporate common queries, Part 2
  + CREATE DROP ALTER ADD RENAME
  + PRIMARY KEY / FOREIGN KEY REFERENCES
  + UNIQUE CHECK NOT NULL
  + INSERT INTO VALUES DELETE FROM
  + CREATE VIEW / INDEX UNIQUE INDEX
  + ON UPDATE
  + AUTO_INCREMENT
  + CURRENT_TIMESTAMP

# Source
See README.md
