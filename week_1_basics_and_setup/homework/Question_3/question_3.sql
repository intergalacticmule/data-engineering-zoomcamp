--Question 3
with up_to_1_mile as (
	select 
		count(1) as up_to_1_mile_count
	from green_taxi_data_2019_10
	where date(lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
	and date(lpep_dropoff_datetime) between '2019-10-01' and '2019-10-31'
	and trip_distance <= 1
),
between_1_and_3_miles as (
	select 
		count(1) between_1_and_3_miles_count
	from green_taxi_data_2019_10
	where date(lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
	and date(lpep_dropoff_datetime) between '2019-10-01' and '2019-10-31'
	and trip_distance between 1.01 and 3
),
between_3_and_7_miles as (
	select 
		count(1) as between_3_and_7_miles_count
	from green_taxi_data_2019_10
	where date(lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
	and date(lpep_dropoff_datetime) between '2019-10-01' and '2019-10-31'
	and trip_distance between 3.01 and 7
),
between_7_and_10_miles as (
	select 
		count(1) as between_3_and_7_miles_count
	from green_taxi_data_2019_10
	where date(lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
	and date(lpep_dropoff_datetime) between '2019-10-01' and '2019-10-31'
	and trip_distance between 7.01 and 10
),
over_10_miles as (
	select 
		count(1) as over_10_miles_count
	from green_taxi_data_2019_10
	where date(lpep_pickup_datetime) between '2019-10-01' and '2019-10-31'
	and date(lpep_dropoff_datetime) between '2019-10-01' and '2019-10-31'
	and trip_distance > 10
)
select
	up_to_1_mile.up_to_1_mile_count,
	between_1_and_3_miles.between_1_and_3_miles_count,
	between_3_and_7_miles.between_3_and_7_miles_count,
	between_7_and_10_miles.between_3_and_7_miles_count,
	over_10_miles.over_10_miles_count
from 
	up_to_1_mile,
	between_1_and_3_miles,
	between_3_and_7_miles,
	between_7_and_10_miles,
	over_10_miles;