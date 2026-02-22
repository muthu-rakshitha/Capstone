select
    sleeve_id,
    sector,
    sum(weight) as sector_weight
from {{ ref('int_allocation_current') }}
group by sleeve_id, sector
