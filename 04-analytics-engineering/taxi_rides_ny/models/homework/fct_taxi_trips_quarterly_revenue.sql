{{
    config(
        materialized='table'
    )
}}

with base as (
	select
       'Green' as service_type,
		extract(YEAR from lpep_pickup_datetime) as year,
		case
			when extract(month from lpep_pickup_datetime) between 1 and 3 then 1
			when extract(month from lpep_pickup_datetime) between 4 and 6 then 2
			when extract(month from lpep_pickup_datetime) between 7 and 9 then 3
			when extract(month from lpep_pickup_datetime) between 10 and 12 then 4
			else null
		end as quarter,
		sum(total_amount) as total_amount
	from {{ source('staging','green_tripdata') }}
	group by 1, 2, 3

    union all

    select
        'Yellow' as service_type,
		extract(YEAR from tpep_pickup_datetime) as year,
		case
			when extract(month from tpep_pickup_datetime) between 1 and 3 then 1
			when extract(month from tpep_pickup_datetime) between 4 and 6 then 2
			when extract(month from tpep_pickup_datetime) between 7 and 9 then 3
			when extract(month from tpep_pickup_datetime) between 10 and 12 then 4
			else null
		end as quarter,
		sum(total_amount) as total_amount
	from {{ source('staging','yellow_tripdata') }}
	group by 1, 2, 3
),

enriched as (
	select
        service_type,
		year,
		quarter,
		concat(year, '/Q', quarter) as year_quarter,
		total_amount
	from base
)

select 
    crnt.service_type,
	crnt.year_quarter as current_q,
	crnt.total_amount as total_amount_current_quarter,
	prvs.year_quarter as previous_q,
	prvs.total_amount as total_amount_previous_quarter,
	((crnt.total_amount - prvs.total_amount) / prvs.total_amount) * 100 as yoy
from enriched crnt
join enriched prvs
on crnt.year = prvs.year + 1
and crnt.quarter = prvs.quarter
and crnt.service_type = prvs.service_type