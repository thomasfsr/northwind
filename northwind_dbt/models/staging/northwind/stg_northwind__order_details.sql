with 
source as (
    select * from {{ source('northwind','order_details')}}
),

renamed as (
    select 
    discount as percent_discount, 
    * 
    from source
),

cleaned as (
    select * from renamed Except select discount
),

calculate_price AS (
    SELECT 
        *,
        unit_price * quantity AS raw_price,
        (unit_price * quantity) * (1 - percent_discount) AS price,
        raw_price - price AS discount
    FROM cleaned
)

SELECT * FROM calculate_price;