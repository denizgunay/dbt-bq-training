{{ config(materialized='table') }}

SELECT
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    o.Product_ID,
    p.Product_Name,
    o.Quantity,
    o.Order_Date
FROM
    raw.orders o
LEFT JOIN
    {{ ref("stg_customers") }} c ON o.Customer_ID = c.Customer_ID
LEFT JOIN
    raw.products p ON o.Product_ID = p.Product_ID



