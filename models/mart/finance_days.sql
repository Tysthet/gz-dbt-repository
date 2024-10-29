WITH orders AS (

)

SELECT
    date_date,
    ROUND(COUNT(orders_id),0) AS nb_transactions
    ROUND(SUM(revenue),1) AS revenue
    ROUND(SUM(revenue / nb_transactions),1) AS average_basket
    ROUND(SUM(margin),1) AS margin
    ROUND(SUM(ops.operational_margin),1) AS operational_margin
    ROUND(SUM(purchase_cost), 1) AS purchase_cost
    ROUND(SUM(ops.shipping_fees),1) AS total_shipping_fee
    ROUND(SUM(ops.log_costs),1) AS total_log_costs
    AS qty_products_sold
FROM sales
INNER JOIN {{ ref('int_orders_operational') }} AS ops USING (orders_id)
GROUP BY date_date
ORDER BY date_date DESC