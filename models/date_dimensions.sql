WITH CTE AS (
    select 
    STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
    DAYNAME(TO_TIMESTAMP(STARTED_AT)) as DAY_NAME,
    {{day_type('STARTED_AT')}} as DAY_TYPE,
    MONTHNAME(TO_TIMESTAMP(STARTED_AT)) AS MONTH_NAME,
    {{get_season('STARTED_AT')}} AS SEASON,
    {{temporal_status('STARTED_AT')}} as TEMPORAL_STATUS
    from {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
   
)

select * from CTE