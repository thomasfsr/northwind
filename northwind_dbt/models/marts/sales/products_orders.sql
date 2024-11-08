WITH 
product_joined_cat AS (
    SELECT
        product_id, 
        product_name,
        discontinued,
        category_name,
        category_description
    FROM {{ ref('int_products_joined_category') }}
)

SELECT 
    od.order_id,
    od.product_id,
    od.unit_price,
    od.quantity,
    od.discount,
    p.product_name,
    p.discontinued,
    p.category_name,
    p.category_description
FROM {{ ref('stg_northwind__order_details') }} AS od
LEFT JOIN product_joined_cat AS p 
ON od.product_id = p.product_id
