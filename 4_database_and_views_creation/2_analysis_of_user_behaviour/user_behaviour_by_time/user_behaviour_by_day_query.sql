WITH temp_query_1 AS (
         SELECT ride.day,
            avg(ride.geo_distance_km) AS average_geographical_distance_km,
            avg(ride.stop_time - ride.start_time) AS time_difference
           FROM ride
          GROUP BY ride.day
        ), temp_query_2 AS (
         SELECT DISTINCT ON (ride.date, ride.day) ride.date,
            ride.day
           FROM ride
        ), temp_query_3 AS (
         SELECT ride.day,
            count(ride.ride_id) AS no_rides
           FROM ride
          GROUP BY ride.day
        ), temp_query_4 AS (
         SELECT temp_query_2.day,
            count(temp_query_2.date) AS no_days
           FROM temp_query_2
          GROUP BY temp_query_2.day
        )
 SELECT temp_query_1.day,
    temp_query_3.no_rides / temp_query_4.no_days AS average_no_rides,
    round(temp_query_1.average_geographical_distance_km, 2) AS average_distance_km,
    EXTRACT(minute FROM temp_query_1.time_difference) AS average_time_minute
   FROM temp_query_1
     JOIN temp_query_3 ON temp_query_1.day = temp_query_3.day
     JOIN temp_query_4 ON temp_query_3.day = temp_query_4.day;