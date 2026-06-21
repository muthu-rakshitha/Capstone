select
    sleeve_id
from {{ ref('int_allocation_current') }}
group by sleeve_id
having abs(sum(weight) - 100) > 0.01