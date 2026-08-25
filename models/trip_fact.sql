WITH TRIPS AS (
    select 
    BIKE_ID,
    USER_TYPE,
    DATE(TO_TIMESTAMP(START_TIME)) AS TRIP_DATE,
    START_STATION_ID,
    END_STATION_ID,
    TRIP_DURATION_SECONDS
    from {{ source('demo', 'bike') }}
)

select * from TRIPS