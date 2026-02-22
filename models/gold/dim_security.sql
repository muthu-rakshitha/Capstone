select distinct
    ticker,
    sector
from {{ ref('int_allocation_current') }}