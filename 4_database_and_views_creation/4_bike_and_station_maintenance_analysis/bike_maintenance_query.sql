 WITH temp_query_1 AS (
         SELECT ride.bike_id,
            min(ride.date) AS first_operation,
            max(ride.date) AS last_operation,
            count(ride.ride_id) AS no_rides,
            sum(ride.geo_distance_km) AS sum_distance
           FROM ride
          GROUP BY ride.bike_id
          ORDER BY (count(ride.ride_id)) DESC
        )
 SELECT bike_id,
    first_operation,
    last_operation,
    no_rides,
    sum_distance
   FROM temp_query_1;