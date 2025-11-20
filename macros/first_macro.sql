{%macro jodo(col1,col2) %}
    {{col1}} || ' ' ||{{col2}}
{% endmacro %}

{% macro gender(gn) %}
    case
        when {{ gn }} = 'M' then 'Male'
        when {{ gn }} = 'F' then 'Female'
        else 'Unknown'
    end
{% endmacro %}


{% macro age_group(age) %}
CASE 
        WHEN age < 25 THEN 'Youngster'
        WHEN age < 60 THEN 'Middle'
        ELSE 'Senior'
        end
        {% endmacro %}

{%macro phone(ph) %}

 '(' ||SUBSTR({{ph}}, 1, 3) || ') ' ||   SUBSTR({{ph}}, 4, 3) || '-' ||   SUBSTR({{ph}}, 7)
{% endmacro %}


{% macro showemps() %}

    {% set sql %}
        select name
        from {{ ref('stg_employees') }}
    {% endset %}

    {% set results = run_query(sql) %}

    {{ return(results) }}
    {% if execute %}
        {{ log(results.as_text(), info=True) }}
    {% endif %}

{% endmacro %}

{% macro unload() %}

    {% do run_query("
        CREATE OR REPLACE STAGE stg_analytics
    ") %}

    {% do run_query("
        COPY INTO @stg_analytics/
        FROM stg_nations
        PARTITION BY (region_id)
        HEADER = TRUE
        FILE_FORMAT = (type=csv COMPRESSION = NONE null_id=(' '))
    ") %}

{% endmacro %}

{% macro mod_tab(table_name) %}
    {% set sql_stmt = "alter table " ~ table_name ~ " add column updated_at timestamp_ltz" %}
    {% do run_query(sql_stmt) %}
{% endmacro %}

