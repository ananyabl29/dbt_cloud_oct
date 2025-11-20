{{ config(
    materialized = 'dynamic_table',
    target_lag = '10 minutes',
    snowflake_warehouse = 'TRANSFORM_WH',
    refresh_mode='incremental'
) }}

select

    n.NATION_NAME as nation_name,
    sum(c.CUSTOMER_ID) as total_Customers,
    sum(c.ACCOUNT_BALANCE) as acc_balance

from {{ ref('stg_customers') }} c
join {{ ref('stg_nations') }} n on c.nation_id = n.nation_id
group by n.NATION_NAME