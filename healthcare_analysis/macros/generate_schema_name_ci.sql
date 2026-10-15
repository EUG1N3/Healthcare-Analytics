{% macro generate_schema_name_ci(custom_schema_name, node) -%}

    {% if target.name == 'ci' %}
        
        {{ target.schema }}

    {% elif target.name in ['eugene_dev', 'peter_dev'] %}
        {% if target.schema not in ['eugene_dev', 'peter_dev'] %}
            {{ exceptions.raise_compiler_error("Access Denied: Development execution is strictly restricted to eugene_dev or peter_dev spaces.") }}
        {% endif %}
        
        {{ target.schema }}

    {% elif target.name == 'prod' %}
        {% if custom_schema_name is not none %}
            {{ custom_schema_name | trim }}
        {% else %}
            {{ target.schema }}
        {% endif %}

    {% else %}
        {{ target.schema }}
    {% endif %}

{%- endmacro %}
