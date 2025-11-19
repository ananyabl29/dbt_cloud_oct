{% macro jodo(col1, col2) %}
    {{ col1 }} || ' ' || {{ col2 }}
{% endmacro %}

{% macro mod_tab(table_name) %}
    {% set sql_stmt = "alter table " ~ table_name ~ " add column updated_at timestamp_ltz" %}
    {% do run_query(sql_stmt) %}
{% endmacro %}

