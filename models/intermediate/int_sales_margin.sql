
WITH joined AS (
    SELECT
    sales.orders_id,
    products.products_id,
    sales.date_date,
    sales.quantity,
    sales.revenue,
    products.purchase_price,
    sales.quantity * products.purchase_price AS purchase_cost
    FROM {{ref("stg_gz_raw_data__sales")}} AS sales
    INNER JOIN {{ref("stg_gz_raw_data__product")}} AS products USING (products_id)
)
SELECT
    joined.*,
    joined.revenue - joined.purchase_cost AS margin
FROM joined