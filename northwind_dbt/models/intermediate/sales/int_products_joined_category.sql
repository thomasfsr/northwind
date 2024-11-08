WITH 
categories AS (
    SELECT 
        category_id,
        category_name,
        category_description
    FROM {{ ref('stg_northwind__categories') }}
),
prod_joined_cate AS (
    SELECT 
        p.*,
        c.category_name,
        c.category_description
    FROM {{ ref('stg_northwind__products') }} p
    LEFT JOIN categories c
    ON p.category_id = c.category_id
)
SELECT * FROM prod_joined_cate
