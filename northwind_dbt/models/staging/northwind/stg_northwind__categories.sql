with 
source as (
    select * from {{ source('northwind','categories')}}
)
renamed as (
    select "description" as category_description, * from source
)

select * from renamed except "description"