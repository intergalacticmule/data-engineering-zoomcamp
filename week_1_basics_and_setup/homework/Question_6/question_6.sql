select 
	p."Zone" as pickup_zone,
	d."Zone" as dropoff_zone,
	max(t.tip_amount) as max_tip
from green_taxi_data_2019_10 t
join taxi_zone_lookup p
	on t."PULocationID" = p."LocationID"
join taxi_zone_lookup d
	on t."DOLocationID" = d."LocationID"
where date(t.lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
and p."Zone" = 'East Harlem North'
group by p."Zone", d."Zone"
order by 3 desc
limit 1;