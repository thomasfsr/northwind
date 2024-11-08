WITH 
source AS (
    SELECT * FROM {{ source('northwind', 'customers') }}
),

renamed_source AS (
    SELECT 
        company_name AS customer_company_name,
        city AS customer_city,
        region AS customer_region,
        country AS customer_country,
        customer_id
    FROM source
)

SELECT * FROM renamed_source