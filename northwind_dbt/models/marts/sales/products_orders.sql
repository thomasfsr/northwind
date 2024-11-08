with 
product_joined_cat (
    select 
    product_id, 
    product_name,
    discontinued,
    category_name,
    category_description
    from {{ ref('int_products_joined_category') }}
)
select * from {{ ref('stg_northwind_order_details') }} od
left join product_joined_cat p 
on od.product_id = p.product_id