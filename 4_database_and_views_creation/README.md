## Database and Views Creation

This folder includes the database schema as a PDF file and the database views (Including both SQL querries and the .csv output) that are used to answer the relevant questions.

The views are then used as source tables for visuals in the PowerBI report. 

The questions and the reasons why they are asked are mentioned in the executive summary of the whole project. 

### The folder is split-up into 4 sub-folders: 

#### time_dependent_analysis_of_the_state_of_the_company:

Here, views are created to display how did the number of bikes and stations (including their location) evolve during the year.  

#### analysis_of_user_behaviour:

* User behaviour by time:
        Here, views are created to display how do the relevant metrics (the number of rides taken, ride length and the distance between the start and end points) depend on month, day in a week and hour of the day.
* User behaviour by station:
        Here, views are created to show which stations are the most popular ones and how does this evolve over the year. 
* User behaviour by weather:
        Here, views are created to show how does weather influence the relevant metrics (number of rides taken, ride length, distance between the start and end points).

#### station_location_analysis:

Here, views are created to show how does the number and location of start as well as non-start stations evolve over the year. 

#### bike_and_station_maintenance_analysis:

This is not a very important and useful part of the analysis, but views are created to estimate the wear of the bikes and the docking stations.  