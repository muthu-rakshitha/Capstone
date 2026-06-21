{% macro format_pct(column_name, decimals=2) %}
    round({{ column_name }} * 100, {{ decimals }})
{% endmacro %}