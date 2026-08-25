{% macro round_avg(x) %}
    ROUND(AVG({{x}}), 2)
{% endmacro %}