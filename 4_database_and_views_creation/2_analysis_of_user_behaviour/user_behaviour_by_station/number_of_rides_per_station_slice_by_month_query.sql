WITH temp_query_1 AS (
         SELECT ride.ride_id,
            EXTRACT(month FROM ride.date) AS month,
            ride.start_station_id AS station_id
           FROM ride
        ), temp_query_2 AS (
         SELECT ride.ride_id,
            EXTRACT(month FROM ride.date) AS month,
            ride.end_station_id AS station_id
           FROM ride
        ), temp_query_3 AS (
         SELECT temp_query_1.ride_id,
            temp_query_1.month,
            temp_query_1.station_id
           FROM temp_query_1
        UNION ALL
         SELECT temp_query_2.ride_id,
            temp_query_2.month,
            temp_query_2.station_id
           FROM temp_query_2
        ), temp_query_4 AS (
         SELECT temp_query_3.month,
            temp_query_3.station_id,
            count(temp_query_3.ride_id) AS no_rides
           FROM temp_query_3
          GROUP BY temp_query_3.month, temp_query_3.station_id
        )
 SELECT month,
    station_id,
    no_rides
   FROM temp_query_4;