{{ config(materialized='table') }}

SELECT
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    o.Product_ID,
    p.Product_Name,
    o.Quantity,
    {{extract_date('Order_Date')}} as order_date
FROM
    raw.orders o
LEFT JOIN
    {{ ref("stg_customers") }} c ON o.Customer_ID = c.Customer_ID
LEFT JOIN
    raw.products p ON o.Product_ID = p.Product_ID


