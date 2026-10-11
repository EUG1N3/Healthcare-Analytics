{% macro standardized (column_name) %}
    INITCAP(TRIM( {{ column_name}} ))
{% endmacro %}