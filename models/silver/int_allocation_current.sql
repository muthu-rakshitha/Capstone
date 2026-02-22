select
    sleeve_id,
    ticker,
    sector,
    weight,
    updated_at
from {{ ref('security_allocation_snapshot') }}
where dbt_valid_to is null
