select distinct
    month_date as date,
    year(month_date) as year,
    month(month_date) as month,
    monthname(month_date) as month_name,
    quarter(month_date) as quarter
from {{ ref('int_performance_final') }}