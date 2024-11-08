with 
grouped_od AS (
    SELECT
        order_id,
        SUM(quantity) AS total_quantity,
        SUM(raw_price) AS total_raw_price,
        SUM(price) AS total_price,
        SUM(brute_discount) AS total_brute_discount
    FROM {{ ref('stg_northwind__order_details') }}
    GROUP BY order_id
),
ord_merged AS (
    SELECT 
        o.*,
        god.total_quantity,
        god.total_raw_price,
        god.total_price,
        god.total_brute_discount
    FROM grouped_od god
    LEFT JOIN {{ ref('stg_northwind__orders') }} o
    ON god.order_id = o.order_id
)
select * from ord_merged
