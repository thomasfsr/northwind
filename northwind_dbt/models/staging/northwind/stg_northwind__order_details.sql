with 
source as (
    select * from {{ source('northwind','order_details')}}
),

calculate_price AS (
    SELECT 
        *,
        unit_price * quantity AS raw_price,
        (unit_price * quantity) * (1 - discount) AS price
    FROM source
),
calculate_brute_discount AS (
    SELECT
    *,
    raw_price - price AS brute_discount
    FROM calculate_price
)

SELECT * FROM calculate_brute_discount