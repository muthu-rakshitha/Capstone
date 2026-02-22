select
    sleeve_id,
    month_date,
    sleeve_return,
    benchmark_return,
    excess_return,
    rolling_3m_return,
    rolling_6m_return,
    rolling_12m_return,
    cumulative_return
from {{ ref('int_performance_final') }}