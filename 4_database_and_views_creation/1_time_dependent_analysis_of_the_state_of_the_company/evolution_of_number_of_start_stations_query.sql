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
            count(DISTINCT temp_query_3.station_id) AS unique_stations
           FROM temp_query_3
             JOIN station ON temp_query_3.station_id = station.station_id
          WHERE station.start_station = true
          GROUP BY temp_query_3.month
        ), temp_query_5 AS (
         SELECT temp_query_3.month,
            temp_query_3.station_id,
            count(temp_query_3.ride_id) AS no_rides
           FROM temp_query_3
             JOIN station ON temp_query_3.station_id = station.station_id
          WHERE station.start_station = true
          GROUP BY temp_query_3.month, temp_query_3.station_id
        ), temp_query_6 AS (
         SELECT temp_query_5.month,
            percentile_cont(0.05::double precision) WITHIN GROUP (ORDER BY (temp_query_5.no_rides::double precision)) AS percentile_05_percent
           FROM temp_query_5
          GROUP BY temp_query_5.month
        )
 SELECT temp_query_4.month,
    temp_query_4.unique_stations,
    temp_query_6.percentile_05_percent::integer AS percentile_05_percent
   FROM temp_query_4
     JOIN temp_query_6 ON temp_query_4.month = temp_query_6.month;