select
    sleeve_id,
    sleeve_name,
    sleeve_category,
    yield,
    price_to_earnings,
    price_to_sales,
    eps_growth_3y,
    sales_growth_3y,
    fcf_growth_3y
from {{ ref('int_sleeve_mapped') }}