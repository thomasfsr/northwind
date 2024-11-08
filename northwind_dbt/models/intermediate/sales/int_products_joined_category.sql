with 
categories (
    select 
    category_id,
    category_name,
    category_description
    from {{ ref('stg_northwind_categories') }}
),
prod_joined_cate(
    select * 
    from {{ ref('stg_northwind__products') }} p
    left join categories c
    on p.category_id = c.category_id
)
select * from prod_joined_cate
