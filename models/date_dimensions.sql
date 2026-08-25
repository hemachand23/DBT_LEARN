WITH CTE AS (
    select 
    START_TIME AS STARTED_AT,
    DATE(TO_TIMESTAMP(START_TIME)) as DATE_STARTED_AT,
    DAYNAME(TO_TIMESTAMP(START_TIME)) as DAY_NAME,
    {{day_type('START_TIME')}} as DAY_TYPE,
    MONTHNAME(TO_TIMESTAMP(START_TIME)) AS MONTH_NAME,
    {{get_season('START_TIME')}} AS SEASON,
    {{temporal_status('START_TIME')}} as TEMPORAL_STATUS
    from {{ source('demo', 'bike') }}   
)

select * from CTE