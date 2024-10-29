SELECT
    sales.orders_id,
    sales.date_date,
    ROUND(SUM(sales.revenue),2),
    ROUND(SUM(sales.quantity),2),
    ROUND(SUM(sales.purchase_cost),2),
    ROUND(SUM(sales.margin),2)
FROM {{ ref('int_sales_margin') }} AS sales
GROUP BY orders_id, date_date