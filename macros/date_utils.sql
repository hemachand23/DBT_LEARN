{% macro temporal_status(x) %}
    CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST'
    WHEN TO_TIMESTAMP({{x}}) > CURRENT_DATE THEN 'FUTURE'
    ELSE 'PRESENT' END
{% endmacro %}

{% macro get_season(x) %}
    CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN (11,12,1) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (2,3,4) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (5,6,7) THEN 'SUMMER'
    ELSE 'AUTUMN' END
{% endmacro %}

{% macro day_type(x) %}
    case when DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat', 'Sun') then 'WEEKEND'
    else 'BUSINESSDAY' end
{% endmacro %}