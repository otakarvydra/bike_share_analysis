WITH temp_query_1 AS (
         SELECT EXTRACT(month FROM ride.date) AS month,
            ride.start_station_id AS station_id
           FROM ride
        ), temp_query_2 AS (
         SELECT EXTRACT(month FROM ride.date) AS month,
            ride.end_station_id AS station_id
           FROM ride
        ), temp_query_3 AS (
         SELECT temp_query_1.month,
            temp_query_1.station_id
           FROM temp_query_1
        UNION ALL
         SELECT temp_query_2.month,
            temp_query_2.station_id
           FROM temp_query_2
        ), temp_query_4 AS (
         SELECT DISTINCT temp_query_3.month,
            temp_query_3.station_id
           FROM temp_query_3
        )
 SELECT temp_query_4.month,
    temp_query_4.station_id,
    station.station_latitude,
    station.station_longitude,
    station.city,
    station.neighbourhood,
    station.postcode
   FROM temp_query_4
     JOIN station ON temp_query_4.station_id = station.station_id
  ORDER BY temp_query_4.month;