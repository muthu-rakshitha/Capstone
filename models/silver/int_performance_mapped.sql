with sleeve_perf as (

    select *
    from {{ ref('stg_sleeve_performance') }}

),

benchmark_perf as (

    select *
    from {{ ref('stg_benchmark_performance') }}

),

mapping as (

    select *
    from {{ ref('sleeve_benchmark_mapping') }}

)

select
    s.sleeve_id,
    s.month_date,
    s.returns as sleeve_return,
    b.returns as benchmark_return,
    {{ excess_return('s.returns','b.returns') }} as excess_return

from sleeve_perf s

left join mapping m
    on s.sleeve_id = m.sleeve_id

left join benchmark_perf b
    on m.benchmark_id = b.sleeve_id
    and s.month_date = b.month_date
