SELECT
    orders_id,
    date_date,
    ROUND(SUM(revenue),2),
    ROUND(SUM(quantity),2),
    ROUND(SUM(purchase_cost),2),
    ROUND(SUM(margin),2)
FROM {{ref("int_sales_margin")}} AS sales
GROUP BY orders_id, date_date