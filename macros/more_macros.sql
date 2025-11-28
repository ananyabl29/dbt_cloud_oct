{% macro dbt_meta() -%}
    '{{ invocation_id }}'::varchar AS invocation_id,
    '{{ run_started_at}}'::timestamp as date_day
{%- endmacro %}