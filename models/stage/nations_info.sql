with nation_info as(
    select r.REGION_ID,
    n.NATION_NAME,
    r.REGION_NAME,
    r.REGION_COMMENT, 
    from {{ref('stg_regions')}} r join {{ref('stg_nations')}} n on r.region_id=n.region_id
)
select * from nation_info