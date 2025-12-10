{{ config(materialized='table') }}

WITH raw_sales AS (
    SELECT * FROM {{ ref('raw_sales_data') }}
),

parsed_sales AS (
    SELECT
        order_id,
        customer_id,
        product_id,
        -- Convert text to DATE object
        TO_DATE(order_date, 'MM/DD/YYYY') as formatted_order_date,
        order_status,
        quantity,
        price
    FROM raw_sales
),

transformed AS (
    SELECT
        order_id,
        customer_id,
        product_id,
        formatted_order_date as order_date,
        order_status,
        
        -- Task 1: Extracting year, month and day from order date
        EXTRACT(YEAR FROM formatted_order_date) AS order_year,
        EXTRACT(MONTH FROM formatted_order_date) AS order_month,
        EXTRACT(DAY FROM formatted_order_date) AS order_day,

        -- Task 2: Calculating total sales
        (quantity * price) AS total_sales_amount

    FROM parsed_sales
    WHERE order_status = 'Completed' -- Applying filter for valid orders
)

SELECT * FROM transformed