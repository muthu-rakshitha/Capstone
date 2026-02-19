with base as (

    select
        sleeve_id,
        cast(month_date as date) as month_date,
        cast(returns as float) as returns
    from {{ source('raw','sleeve_performance') }}
    where returns is not null

)

select distinct *
from base
