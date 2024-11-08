with 
source as (
    select * from {{ source('northwind','employees')}}
),
employees as (
    select 
    employee_id,
    last_name,
    first_name,
    title,
    title_of_courtesy,
    birth_date,
    hire_date,
    "address",
    city,
    region,
    postal_code,
    country,
    home_phone,
    extension,
    notes
    from source
)
select * from employees