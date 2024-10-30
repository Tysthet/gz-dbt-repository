WITH e AS (
    SELECT
        ord.date_date,
        ROUND(SUM(ord.purchase_cost),1) AS purchase_cost,
        ROUND(SUM(ops.ship_cost),1) AS ship_cost
    FROM {{ ref("int_orders_margin") }} AS ord
    INNER JOIN {{ ref("int_orders_operational") }} AS ops
    USING(date_date)
    GROUP BY ord.date_date
)
SELECT
    f.date_date,
    ROUND(f.operational_margin - c.ads_cost,1) AS ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_click,
    f.qty_products_sold,
    f.revenue,
    e.purchase_cost,
    f.margin,
    f.total_shipping_fees,
    f.total_log_costs,
    e.ship_cost
FROM {{ ref("finance_days") }} AS f
INNER JOIN {{ ref("int_campaigns_day") }} AS c USING (date_date)
INNER JOIN e USING (date_date)
ORDER BY f.date_date DESC
