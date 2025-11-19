{{config(alias='stage_regions')}}

with region as (
select 

R_REGIONKEY as region_id,
R_NAME as Region_name,
R_COMMENT as Region_comment

from {{source('src','regions')}}
)

select * from region