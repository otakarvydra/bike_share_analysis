WITH temp_query_1 AS (
         SELECT ride.date,
            ride.day,
            EXTRACT(hour FROM ride.start_time) AS hour_no,
            count(ride.ride_id) AS no_rides
           FROM ride
          GROUP BY ride.date, ride.day, (EXTRACT(hour FROM ride.start_time))
          ORDER BY ride.date
        )
 SELECT day,
    hour_no,
    avg(no_rides)::integer AS average_no_rides
   FROM temp_query_1
  GROUP BY day, hour_no
  ORDER BY day, hour_no;