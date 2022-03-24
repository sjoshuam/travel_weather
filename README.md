----------==========----------==========----------==========----------==========

# Overview

This project finds the best times of the year to each set of destinations
specified in the input file.  The resulting chart is a useful travel planning
tool and informs the table in the us_travels panel.

# Task Board

I have organized this project's development into a stages by components matrix.

## Stages
+ Drafting – Build prototypes of all features and how they work together.
+ Improving – Rebuilt code, using knowledge gained from Drafting Stage.
+ Optimizing – Identify and streamline the slowest features in the code.

## Components (Drafting Stage)
0. Import Data – Import all needed data.  This is a large task.
1. Refine Data – Clean and resahpe data into an enriched form.
2. Build Model – Trained a model to predict weather at destinations.
3. Model Routes – Predict weather at destinations along route.
4. Render Visualization – Visualize weather temperateness for each route.
5. Test Code - Tests for all features.

## Task Matrix
|     |Dr|Im|Op|
|:-   |:-|:-|:-|
|00-ID| X|  |  |
|01-RD| X|  |  |
|02-BM| X|  |  |
|03-MR| X|  |  |
|04-RV|  |  |  |
|05-TC|  |  |  |

Total Progress: 22%

# Directory Layout
Project directories are lettered to indicate sequences, and code scripts are
numbered for the same reason.
+ A_Input - Original input data.  It should be read but never written.
+ B_Progress - Contains intermediate data as needed.  Generally, these files
facilitate data hand-offs between scripts.
+ C_Output - Tables and visualizations that are the project's final products.
+ Z_Admin - Documentation as needed to provide guidance and context for the
project. Most significantly, this directory contains any supplemental planning
material.

# Data Sources

NOAA's Local Climatological Data:
https://www.ncei.noaa.gov/data/local-climatological-data/access/**YEAR**/

**YEAR** - replace this with the calendar year.  The project uses data from
2017 to 2021.
