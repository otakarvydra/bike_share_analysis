 WITH temp_query_1 AS (
         SELECT ride.ride_id,
            ride.start_station_id AS station_id
           FROM ride
        ), temp_query_2 AS (
         SELECT ride.ride_id,
            ride.end_station_id AS station_id
           FROM ride
        ), temp_query_3 AS (
         SELECT temp_query_1.ride_id,
            temp_query_1.station_id
           FROM temp_query_1
        UNION ALL
         SELECT temp_query_2.ride_id,
            temp_query_2.station_id
           FROM temp_query_2
        )
 SELECT station_id,
    count(ride_id) AS no_rides
   FROM temp_query_3
  GROUP BY station_id
  ORDER BY (count(ride_id)) DESC;