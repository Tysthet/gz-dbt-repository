SELECT
    DATE(CONCAT(EXTRACT(YEAR FROM date_date), '-', EXTRACT(MONTH FROM date_date), '-1')) AS datemonth,
    ROUND(SUM(ads_margin),1) AS ads_margin,
    ROUND(SUM(average_basket),1) AS average_basket,
    ROUND(SUM(operational_margin),1) AS operational_margin,
    ROUND(SUM(ads_cost),1) AS ads_cost,
    ROUND(SUM(ads_impression),1) AS ads_impression,
    ROUND(SUM(ads_click),1) AS ads_click,
    ROUND(SUM(qty_products_sold),1) AS qty_products_sold,
    ROUND(SUM(revenue),1) AS revenue,
    ROUND(SUM(purchase_cost),1) AS purchase_cost,
    ROUND(SUM(margin),1) AS margin,
    ROUND(SUM(total_shipping_fees),1) AS total_shipping_fees,
    ROUND(SUM(total_log_costs),1) AS total_log_costs,
    ROUND(SUM(total_ship_costs),1) AS total_ship_costs
FROM {{ ref("finance_campaigns_day") }}
GROUP BY datemonth
ORDER BY datemonth DESC
