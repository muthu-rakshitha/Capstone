{% macro excess_return(sleeve_ret, bench_ret) %}
    {{ sleeve_ret }} - {{ bench_ret }}
{% endmacro %}
