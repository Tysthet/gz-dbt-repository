WITH joined AS (
    SELECT
    {{ref("stg_gz_raw_data__sales")}}.quantity,
    {{ref("stg_gz_raw_data__sales")}}.revenue,
    {{ref("stg_gz_raw_data__product")}}.purchase_price,
    {{ref("stg_gz_raw_data__sales")}}.quantity * {{ref("stg_gz_raw_data__product")}}.purchase_price AS purchase_cost
    FROM {{ref("stg_gz_raw_data__sales")}}
    INNER JOIN {{ref("stg_gz_raw_data__product")}} USING (products_id)
)
SELECT
    *,
    joined.revenue - joined.purchase_cost AS margin
FROM joined