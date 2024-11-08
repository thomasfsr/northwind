with 
grouped_od (
    select 
    order_id,
    SUM(quantity),
    SUM(raw_price),
    SUM(price),
    SUM(discount),
    SUM(quantity) 
    from {{ ref('stg_northwind_order__details') }}
    group by order_id
),
ord_merged (
    select * 
    from grouped_od god
    left join {{ ref('stg_northwind__orders') }} o
    on god.order_id = o.order_id
)
select * from ord_merged
