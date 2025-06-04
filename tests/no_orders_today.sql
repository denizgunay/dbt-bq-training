-- Test to check if there are any orders from today

select 1
from {{ ref('stg_orders') }}
where Order_Date = CURRENT_DATE
limit 1








