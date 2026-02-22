{% set periods = [3,6,12] %}

with base as (

    select *
    from {{ ref('int_performance_mapped') }}

)

select
    sleeve_id,
    month_date,
    sleeve_return,
    benchmark_return,
    excess_return,

    -- Rolling Returns
{% for p in periods %}
    avg(sleeve_return) over (
        partition by sleeve_id
        order by month_date
        rows between {{ p-1 }} preceding and current row
    ) as rolling_{{ p }}m_return,
{% endfor %}

    -- Cumulative Return (Compounded)
    {{ cumulative_return('sleeve_return','sleeve_id','month_date') }}
    as cumulative_return

from base