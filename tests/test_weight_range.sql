select *
from {{ ref('int_allocation_current') }}
where weight < 0
   or weight > 100