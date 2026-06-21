with base as (

    select *
    from {{ ref('stg_equity_region') }}

),

mapped as (

    select
        b.sleeve_id,
        b.sleeve_name,
        b.region,
        b.percentage_allotted
    from base b
    right join {{ ref('sleeve_category_mapping') }} m
        on b.sleeve_id = m.sleeve_id

)

select distinct *
from mapped