select 
	d."Zone",
	sum(t.total_amount) as sum_total
from green_taxi_data_2019_10 t
join taxi_zone_lookup d
	on t."PULocationID" = d."LocationID"
where date(t.lpep_pickup_datetime) = '2019-10-18'
group by d."Zone"
having sum(t.total_amount) > 13000
order by 2 desc;