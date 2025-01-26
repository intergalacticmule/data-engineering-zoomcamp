select 
	date(lpep_pickup_datetime) as pickup_time,
	max(trip_distance)
from green_taxi_data_2019_10
group by pickup_time
order by 2 desc
limit 1;