{% snapshot security_allocation_snapshot %}

{{
    config(
      target_schema='SNAPSHOTS',
      unique_key='sleeve_id || ticker',
      strategy='timestamp',
      updated_at='updated_at',
      invalidate_hard_deletes=True
    )
}}

select *
from {{ ref('stg_security_allocation') }}

{% endsnapshot %}
