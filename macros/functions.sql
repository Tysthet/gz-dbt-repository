{% macro margin_percent(revenue,purchase_cost,decim) %}
    ROUND(SAFE_DIVIDE((revenue - purchase_cost), revenue), decim)
{% endmacro %}