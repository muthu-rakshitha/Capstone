{% macro latest_date(model_name, date_column='month_date') %}
    (select max({{ date_column }}) from {{ ref(model_name) }})
{% endmacro %}