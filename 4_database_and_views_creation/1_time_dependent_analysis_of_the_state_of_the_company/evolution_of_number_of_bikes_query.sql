WITH temp_query_1 AS (
         SELECT ride.ride_id,
            EXTRACT(month FROM ride.date) AS month,
            ride.start_station_id,
            ride.end_station_id,
            ride.bike_id
           FROM ride
        ), temp_query_2 AS (
         SELECT temp_query_1.month,
            temp_query_1.bike_id,
            count(temp_query_1.ride_id) AS no_rides
           FROM temp_query_1
          GROUP BY temp_query_1.month, temp_query_1.bike_id
        ), temp_query_3 AS (
         SELECT temp_query_2.month,
            percentile_cont(0.05::double precision) WITHIN GROUP (ORDER BY (temp_query_2.no_rides::double precision)) AS percentile_5_percent
           FROM temp_query_2
          GROUP BY temp_query_2.month
        ), temp_query_4 AS (
         SELECT temp_query_1.month,
            count(DISTINCT temp_query_1.bike_id) AS no_unique_bikes
           FROM temp_query_1
          GROUP BY temp_query_1.month
        )
 SELECT temp_query_3.month,
    temp_query_4.no_unique_bikes,
    temp_query_3.percentile_5_percent::integer AS percentile_5_percent
   FROM temp_query_3
     JOIN temp_query_4 ON temp_query_3.month = temp_query_4.month;