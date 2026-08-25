WITH DWT AS (
    SELECT 
    DATE(TIME) AS WEATHER_DATE,
    CLOUDS,
    HUMIDITY,
    PRESSURE,
    TEMP,
    WEATHER
    FROM {{ source('demo', 'weather') }}
),

DWT_AGG AS (
    SELECT 
    WEATHER_DATE,
    WEATHER,
    {{round_avg('CLOUDS')}} as CLOUDS_AVG,
    {{round_avg('HUMIDITY')}} AS HUMIDITY_AVG,
    {{round_avg('PRESSURE')}} AS PRESSURE_AVG,
    {{round_avg('TEMP')}} AS TEMP_AVG
    FROM DWT 
    GROUP BY WEATHER_DATE, WEATHER
    QUALIFY row_number() OVER (PARTITION BY WEATHER_DATE ORDER BY COUNT(WEATHER) DESC) = 1
)

select * from DWT_AGG