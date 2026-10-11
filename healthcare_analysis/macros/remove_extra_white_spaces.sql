{% macro remove_white_spaces (column_name) %}
    TRIM({{column_name}})
{% endmacro %}