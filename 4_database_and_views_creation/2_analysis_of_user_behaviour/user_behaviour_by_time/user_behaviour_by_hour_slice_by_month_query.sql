WITH temp_query_1 AS (
         SELECT ride.date,
            ride.day,
            EXTRACT(hour FROM ride.start_time) AS hour_no,
            count(ride.ride_id) AS no_rides
           FROM ride
          GROUP BY ride.date, ride.day, (EXTRACT(hour FROM ride.start_time))
          ORDER BY ride.date
        ), temp_query_2 AS (
         SELECT temp_query_1.date,
            EXTRACT(month FROM temp_query_1.date) AS month,
            temp_query_1.day,
            temp_query_1.hour_no,
            temp_query_1.no_rides
           FROM temp_query_1
        )
 SELECT month,
    day,
    hour_no,
    avg(no_rides)::integer AS average_no_rides
   FROM temp_query_2
  GROUP BY month, day, hour_no
  ORDER BY month, day, hour_no;