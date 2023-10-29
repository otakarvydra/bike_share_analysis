WITH temp_query_1 AS (
         SELECT EXTRACT(month FROM ride.date) AS month_num,
            count(ride.ride_id) AS no_rides,
            avg(ride.geo_distance_km) AS average_geographical_distance_km,
            avg(ride.stop_time - ride.start_time) AS time_difference
           FROM ride
          GROUP BY (EXTRACT(month FROM ride.date))
        )
 SELECT month_num,
    no_rides,
    average_geographical_distance_km,
    time_difference
   FROM temp_query_1;