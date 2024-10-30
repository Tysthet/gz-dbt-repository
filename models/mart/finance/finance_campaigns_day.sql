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
    f.purchase_cost,
    f.margin,
    f.total_shipping_fees,
    f.total_log_costs,
    f.total_ship_costs
FROM {{ ref("finance_days") }} AS f
INNER JOIN {{ ref("int_campaigns_day") }} AS c USING (date_date)
ORDER BY f.date_date DESC
