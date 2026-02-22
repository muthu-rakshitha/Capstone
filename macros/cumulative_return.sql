{% macro cumulative_return(column_name, partition_col, order_col) %}
    exp(sum(ln(1 + {{ column_name }})) over (
        partition by {{ partition_col }}
        order by {{ order_col }}
        rows between unbounded preceding and current row
    )) - 1
{% endmacro %}