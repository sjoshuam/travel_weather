# Overview

# Task Board
### Progress Metrics

|Group            |Progress |Weight |PxW   |
|:-               |:-       |:-     |:-    |
|Planning         |      .83|    .16| .1333|
|Import Data      |      .25|    .16| .0400|
|Refine Data      |      .25|    .16| .0400|
|Build Model      |      .25|    .16| .0400|
|Model Routes     |      .25|    .16| .0400|
|Build Dashboard  |      .25|    .16| .0400|
|Add To Portfolio |      .00|    .04| .0000|
**--**
|TOTAL            |        =|      =| .3066|
|T2               |        =|      =| .4088|

### Work Queue

|  | 1| 2| 3| 4| =|
|:-|:-|:-|:-|:-|:-|
**Planning**
|Data research         |X|X|X|X|4    |
|README.md             |X|X|-|-|2    |
|GitHub                |X|X|X|X|4    |
|TOTAL                 |=|=|=|=|10/12|
**Import Data**
|extract_links         |X|-|-|-|1    |
|download_files        |X|-|-|-|1    |
|TOTAL                 |=|=|=|=|02/08|
**Refine Data**
|refine_files          |X|-|-|-|1    |
|load_model_data       |X|-|-|-|1    |
|TOTAL                 |=|=|=|=|02/08|
**Build Model**
|model_weather         |X|-|-|-|1    |
|TOTAL                 |=|=|=|=|01/04|
**Model Routes**
|model_city            |X|-|-|-|1    |
|model_routes          |X|-|-|-|1    |
|find_best_month       |X|-|-|-|1    |
|TOTAL                 |=|=|=|=|03/12|
**Render Dashboard**
|render_data           |X|-|-|-|1    |
|render_infrastructure |X|-|-|-|1    |
|render_weather        |X|-|-|-|1    |
|TOTAL                 |=|=|=|=|03/12|
**Add To Portfolio**
|Add To portfolio      |-|-|-|-|0    |
|TOTAL                 |=|=|=|=|00/04|

### Work Queue Descriptions

+ Planning: Data research -
+ Planning: README.md -
+ Planning: GitHub -
+ Import data: extract_links -
+ Import data: download_files -
+ Refine data: refine_files -
+ Refine data: compile data -
+ Build model: train_model -
+ Build model: test_model -
+ Model routes: model_routes -
+ Model routes: compile_results -
+ Render dashboard: render_layout -
+ Render dashboard: render_line_panel -
+ Render dashboard: render_table_panel -
+ Add To Portfolio: Add To Portfolio -

For programming tasks, the standard four milestones are:
1. Build architecture - write just enough code to show that the approach is
   feasible
2. Build tests - write quality tests
3. Build functionality - build all of the project's essential features
4. Refine code - make the code more elegant and pay off any remaining
   technical debt

# Directory Layout
Project directories are lettered to indicate sequences, and code scripts are
numbered for the same reason.
+ A_Input - Original input data.  Should be read but never written.
+ B_Progress - Contains intermediate data as needed.  Generally, these files
facilitate data hand-offs between scripts.
+ C_Output - Tables and visualizations that are the project's final products.
+ Z_Admin - Documentation as needed to provide guidance and context for the
project. Most significantly, this directory contains any supplemental planning material.

# Data Sources

NOAA's Local Climatological Data:
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2019/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2018/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2017/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2016/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2015/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2014/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2013/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2012/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2011/
+ https://www.ncei.noaa.gov/data/local-climatological-data/access/2010/
