{{ config(materialized='table') }}

with stg_customers AS (
   SELECT
      customer_id,
      CONCAT(first_name, ' ', last_name) as customer_name,
      email as email_address,
      address as billing_address
   FROM raw.customers
)

select * from stg_customers
