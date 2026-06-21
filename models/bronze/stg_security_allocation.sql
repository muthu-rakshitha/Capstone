with base as (

    select
        trim(sleeve_id) as sleeve_id,
        trim(sleeve_name) as sleeve_name,
        lower(trim(sector)) as sector,
        trim(ticker) as ticker,
        cast(weight as float) as weight,
        cast(updated_at as date) as updated_at
    from {{ source('raw','security_allocation') }}
    where weight is not null

),

dedup as (

    select distinct *
    from base

)

select *
from dedup
