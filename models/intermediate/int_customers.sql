WITH customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
),

nations AS (
    SELECT *
    FROM {{ ref('stg_nations') }}
),

regions AS (
    SELECT *
    FROM {{ ref('stg_regions') }}
)

select c.*,n.nation_name as nation_name,n.updated_at,r.region_id as region_id,r.region_name as region_name,
r.region_comment as region_comment
FROM customers c
LEFT JOIN nations n
    ON c.nation_id = n.nation_id
LEFT JOIN regions r
    ON n.region_id = r.region_id
