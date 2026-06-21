select
    sleeve_id,
    ticker,
    weight,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('security_allocation_snapshot') }}
