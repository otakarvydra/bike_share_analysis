WITH temp_query_1 AS (
         SELECT ride.date,
            count(ride.ride_id) AS no_rides,
            avg(ride.stop_time - ride.start_time) AS avg_ride_duration,
            avg(ride.geo_distance_km) AS avg_ride_distance
           FROM ride
          GROUP BY ride.date
        )
 SELECT temp_query_1.date,
    temp_query_1.no_rides,
    temp_query_1.avg_ride_duration,
    temp_query_1.avg_ride_distance,
    weather.tavg_degc,
    weather.prcp_mm,
    weather.snow_mm,
    weather.awnd_ms
   FROM temp_query_1
     JOIN weather ON temp_query_1.date = weather.date;