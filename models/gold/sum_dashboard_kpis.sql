with latest as (

    select *
    from {{ ref('fact_performance') }}
    where month_date = (
        select max(month_date)
        from {{ ref('fact_performance') }}
    )

),

avg_excess_12m as (

    select
        sleeve_id,
        avg(excess_return) as avg_excess_12m
    from {{ ref('fact_performance') }}
    where month_date >= dateadd(month, -12,
        (select max(month_date) from {{ ref('fact_performance') }})
    )
    group by sleeve_id
),

top5 as (

    select
        sleeve_id,
        sum(weight) as top5_weight
    from (
        select
            sleeve_id,
            weight,
            row_number() over (
                partition by sleeve_id
                order by weight desc
            ) as rn
        from {{ ref('fact_allocation') }}
    )
    where rn <= 5
    group by sleeve_id
)

select
    l.sleeve_id,

    round(l.cumulative_return * 100, 2) as total_return_pct,
    round(l.rolling_12m_return * 100, 2) as rolling_12m_return_pct,
    round(a.avg_excess_12m * 100, 2) as avg_excess_12m_pct,
    round(t.top5_weight, 2) as top5_concentration_pct

from latest l
left join avg_excess_12m a
    on l.sleeve_id = a.sleeve_id
left join top5 t
    on l.sleeve_id = t.sleeve_id