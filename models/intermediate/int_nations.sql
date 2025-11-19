{{ config(materialized="incremental", unique_key="nation_id",on_schema_change="sync_all_columns") }}

with
    nation as (
        select
            nation_id,
            nation_name,
            region_id,
            nation_comment,
            jodo_col,
            current_timestamp() as updated_at
        from {{ ref("stg_nations") }}
        {% if is_incremental() %}
            where
                updated_at
                > (select coalesce(max(updated_at), '1900-01-01') from {{ this }})
        {% endif %}

    )

select *
from nation
