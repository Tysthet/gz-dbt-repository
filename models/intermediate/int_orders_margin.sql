SELECT
    sales.orders_id,
    sales.date_date,
    ROUND(SUM(sales.revenue),2) AS revenue,
    ROUND(SUM(sales.quantity),2) AS quantity,
    ROUND(SUM(sales.purchase_cost),2) AS purchase_cost,
    ROUND(SUM(sales.margin),2) AS margin
FROM {{ ref('int_sales_margin') }} AS sales
GROUP BY orders_id, date_date
ORDER BY orders_id DESC