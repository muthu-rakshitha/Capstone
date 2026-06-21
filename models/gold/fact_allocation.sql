select
    sleeve_id,
    ticker,
    sector,
    weight
from {{ ref('int_allocation_current') }}