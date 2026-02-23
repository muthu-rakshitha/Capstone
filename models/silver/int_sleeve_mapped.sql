with sleeves as (

    select *
    from {{ ref('stg_sleeve_characteristics') }}

),

mapping as (

    select *
    from {{ ref('sleeve_category_mapping') }}

)

select
    s.sleeve_id,
    s.sleeve_name,
    m.category as sleeve_category,
    s.yield,
    s.price_to_earnings,
    s.price_to_sales,
    s.eps_growth_3y,
    s.sales_growth_3y,
    s.fcf_growth_3y
from sleeves s
right join mapping m
    on s.sleeve_id = m.sleeve_id
