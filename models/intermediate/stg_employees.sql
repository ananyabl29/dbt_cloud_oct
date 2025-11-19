
with source as (
    select * from {{ source('new_src', 'stg_employees') }}
),
changed as (
    select
    -- seqpay.nextVal as employee_key,
    EMP_ID as id,
    {{jodo('firstname','lastname')}} as name,
    street as address,
    city as city,
    state as state,
    zip,
    mobile,
    {{phone('fixed')}} as employee_fixedline,
    email,
    {{gender('gender')}} as gender,
    age,
    {{age_group('age')}} as age_group,
    position,
    dealership_id,
    salary,
    region

     from source
)

select * from changed