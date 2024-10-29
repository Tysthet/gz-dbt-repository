SELECT
    orders.orders_id,
    orders.date_date,
    ROUND((orders.margin + ship.shipping_fee - ship.logcost - ship.ship_cost),2) AS operational_margin,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost
FROM {{ ref('int_orders_margin') }} AS orders
INNER JOIN {{ ref ('stg_gz_raw_data__ship') }} AS ship USING(orders_id)
ORDER BY orders.orders_id DESC