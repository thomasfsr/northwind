with 
source as (
    select * from {{ source('northwind','categories')}}
),
renamed as (
    select "description" as category_description,
    category_name,
    category_id
    from source
)

select * from renamed