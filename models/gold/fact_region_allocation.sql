select
    sleeve_id,
    region,
    percentage_allotted
from {{ ref('int_region_allocation') }}