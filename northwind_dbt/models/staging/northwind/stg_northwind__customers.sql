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
        *
    FROM source
)

SELECT * FROM renamed_source
EXCEPT
SELECT company_name, city, region, country;
