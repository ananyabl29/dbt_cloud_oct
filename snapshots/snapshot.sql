

{% snapshot scd_order %}

{{
    config(
        target_db = 'ANALYTICS',
        target_schema = 'SCD',
        unique_key = 'o_orderkey',
        strategy = 'check',
        check_cols = ['o_orderpriority','o_orderdate','o_comment'],
        hard_deletes='new_record',
        alias='scd_order_2'
    )
}}

SELECT *
FROM {{ source('src', 'orders') }}

{% endsnapshot %}
