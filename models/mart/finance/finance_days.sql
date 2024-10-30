SELECT
    orders.date_date,
    ROUND(COUNT(orders.orders_id),0) AS nb_transactions,
    ROUND(SUM(revenue),1) AS revenue,
    ROUND((SUM(orders.revenue) / COUNT(orders.orders_id)),1) AS average_basket,
    ROUND(SUM(orders.purchase_cost),1) AS purchase_cost,
    ROUND(SUM(orders.margin),1) AS margin,
    ROUND(SUM(ops.operational_margin),1) AS operational_margin,
    ROUND(SUM(ops.shipping_fee),1) AS total_shipping_fees,
    ROUND(SUM(ops.logcost),1) AS total_log_costs,
    ROUND(SUM(ops.ship_cost),1) AS total_ship_costs,
    ROUND(SUM(orders.quantity),1) AS qty_products_sold,
FROM {{ ref('int_orders_margin') }} AS orders
INNER JOIN {{ ref('int_orders_operational') }} AS ops USING (orders_id)
GROUP BY date_date
ORDER BY date_date DESC