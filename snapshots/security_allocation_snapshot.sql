{% snapshot security_allocation_snapshot %}

{{
    config(
      target_schema='SNAPSHOTS',
      unique_key='sleeve_id || ticker',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select *
from {{ ref('stg_security_allocation') }}

{% endsnapshot %}
