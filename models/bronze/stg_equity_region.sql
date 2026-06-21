with base as (

    select
        sleeve_id,
        sleeve_name,
        lower(trim(region)) as region,
        cast(percentage_allotted as float) as percentage_allotted
    from {{ source('raw','equity_region') }}
    where percentage_allotted is not null

),

standardized as (

    select
        sleeve_id,
        sleeve_name,

        case
            when region in ('north america','north america ') then 'North America'
            when region in ('europe','europe ') then 'Europe'
            when region in ('asia pacific','asia-pacific') then 'Asia Pacific'
            when region in ('emerging market','emerging market ') then 'Emerging Market'
            else 'Other'
        end as region,

        percentage_allotted
    from base

)

select distinct *
from standardized
