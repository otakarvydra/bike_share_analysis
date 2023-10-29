## Data Preprocessing

This folder includes two Jupyter notebooks that preprocess the raw data for analysis.

The output of this step are 3 separate csv files: 
1. weather - This file includes all relevant weather metrics for each day of 2016. 
2. rides - This file includes all rides taken and info related to them. 
3. stations - This file includes all the active stations in the citibike sharing system.

Greater detail on how this preprocessing was done is included as an executive summary at the top of both of the files, but in a nutshell: 
* The weather file is validated, cleaned and units are converted to SI units. 
* The tripdata files are validated, cleaned, normalized and two new columns are added so that the dataset can be analysed to greater depth. 
* In the rides table, the geographical distance of the start and end station of each ride is calculated. 
* In the stations table, the latitude and logitude of each station is decoded to provide the city, neighbourhood and postal code.
