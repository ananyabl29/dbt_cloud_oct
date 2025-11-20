-- This test fails if any order has total price < 900

WITH orders AS (
    SELECT *
    FROM analytics.dbt_ananya.stg_orders
)

SELECT order_id,total_price
FROM orders
WHERE total_price <= 800