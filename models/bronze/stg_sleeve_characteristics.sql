with base as (

    select
        trim(sleeve_id) as sleeve_id,
        trim(sleeve_name) as sleeve_name,
        trim(sleeve_type) as sleeve_type,
        cast(no_of_securities as integer) as no_of_securities,
        cast(yield as float) as yield,
        cast(price_to_earnings as float) as price_to_earnings,
        cast(price_to_sales as float) as price_to_sales,
        cast(eps_growth_3y as float) as eps_growth_3y,
        cast(sales_growth_3y as float) as sales_growth_3y,
        cast(fcf_growth_3y as float) as fcf_growth_3y,
        cast(percent_A as float) as percent_A,
        cast(percent_B as float) as percent_B,
        cast(percent_neither as float) as percent_neither
    from {{ source('raw','sleeve_characteristics') }}

)

select distinct *
from base
