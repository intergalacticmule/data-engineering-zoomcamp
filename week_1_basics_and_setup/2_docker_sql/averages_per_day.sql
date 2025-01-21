-- Quality check for records with LocationIDs not present in the zone table - No such records found
SELECT
	"PULocationID",
	"DOLocationID"
FROM yellow_taxi_data t
WHERE t."PULocationID" IS NULL
OR t."DOLocationID" IS NULL
OR t."PULocationID" NOT IN (
	SELECT 
		"LocationID"
	FROM taxi_zone_lookup
)
OR t."DOLocationID" NOT IN (
	SELECT
		"LocationID"
	FROM taxi_zone_lookup
);

-- explicit outer join averages per vendor per day report
WITH base AS (
	SELECT
		CASE
			WHEN t."VendorID" = 1 THEN 'Creative Mobile Technologies, LLC'
			WHEN t."VendorID" = 2 THEN 'VeriFone Inc.'
		END AS vendor,
		tpep_pickup_datetime AS "pickup_dt",
		tpep_dropoff_datetime AS "dropoff_dt",
		tpep_dropoff_datetime - tpep_pickup_datetime AS "duration",
		ROUND(CAST(trip_distance*1.6 AS numeric), 2) AS "distance_km",
		total_amount AS "amount_dollars",
		CASE
			WHEN total_amount = 0 AND trip_distance = 0 THEN '0.00'
			WHEN total_amount > 0 AND trip_distance > 0 THEN ROUND(NULLIF(CAST(total_amount AS numeric), 0)/ NULLIF(CAST(trip_distance*1.6 AS numeric), 0),2)
			WHEN total_amount > 9 AND trip_distance = 0 THEN total_amount
		END AS "fare_dollar_per_km"
	FROM
		yellow_taxi_data t,
		taxi_zone_lookup zpu,
		taxi_zone_lookup zdo
	WHERE
		t."PULocationID" = zpu."LocationID"
	AND
		t."DOLocationID" = zdo."LocationID")

SELECT
	base.vendor AS "vendor",
	to_char(base.pickup_dt, 'YYYY-MM-DD') AS "day",
	COUNT(1) AS "trips_per_day",
	date_trunc('second', AVG(base.duration)) AS "avg_duration_per_trip",
	ROUND(AVG(base.distance_km), 2) AS "avg_km_per_trip",
	ROUND(AVG(CAST(base.amount_dollars AS numeric)), 2) AS "average_bill_dollars",
	ROUND(AVG(CAST(base.fare_dollar_per_km AS numeric)), 2) AS "avg_fare_per_km"
FROM base
GROUP BY "vendor", "day"
ORDER BY "vendor", "day";

--explicit outer join averages per vendor per day report
WITH base AS (
	SELECT
		CASE
			WHEN t."VendorID" = 1 THEN 'Creative Mobile Technologies, LLC'
			WHEN t."VendorID" = 2 THEN 'VeriFone Inc.'
		END AS vendor,
		tpep_pickup_datetime AS "pickup_dt",
		tpep_dropoff_datetime AS "dropoff_dt",
		tpep_dropoff_datetime - tpep_pickup_datetime AS "duration",
		ROUND(CAST(trip_distance*1.6 AS numeric), 2) AS "distance_km",
		total_amount AS "amount_dollars",
		CASE
			WHEN total_amount = 0 AND trip_distance = 0 THEN '0.00'
			WHEN total_amount > 0 AND trip_distance > 0 THEN ROUND(NULLIF(CAST(total_amount AS numeric), 0)/ NULLIF(CAST(trip_distance*1.6 AS numeric), 0),2)
			WHEN total_amount > 9 AND trip_distance = 0 THEN total_amount
		END AS "fare_dollar_per_km"
	FROM
		yellow_taxi_data t
	right JOIN taxi_zone_lookup zpu
		ON t."PULocationID" = zpu."LocationID"
	JOIN taxi_zone_lookup zdo
		ON t."DOLocationID" = zdo."LocationID" )

SELECT
	base.vendor AS "vendor",
	TO_CHAR(base.pickup_dt, 'YYYY-MM-DD') AS "day",
	COUNT(1) AS "trips_per_day",
	DATE_TRUNC('second', AVG(base.duration)) AS "avg_duration_per_trip",
	ROUND(AVG(base.distance_km), 2) AS "avg_km_per_trip",
	ROUND(AVG(CAST(base.amount_dollars AS numeric)), 2) AS "average_bill_dollars",
	ROUND(AVG(CAST(base.fare_dollar_per_km AS numeric)), 2) AS "avg_fare_per_km"
FROM base
GROUP BY "vendor", "day"
ORDER BY "vendor", "day";
