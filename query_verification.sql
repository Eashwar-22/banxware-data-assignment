--Code used on Snowflake for testing
USE SCHEMA home_assignment.public;

-- What are the top 5 products by total sales amount in the year 2023?
SELECT 
    product_id, 
    SUM(total_sales_amount) as total_revenue
FROM transformed_sales_data
WHERE order_year = 2023
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;

--What are the names of the top 5 customers by total sales amount in the year 2023?
SELECT 
    c.name, 
    SUM(t.total_sales_amount) as total_spent
FROM transformed_sales_data t
JOIN raw_customer_data c ON t.customer_id = c.id
WHERE t.order_year = 2023
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

--What is the average order value for each month in the year 2023?
SELECT 
    order_month, 
    AVG(total_sales_amount) as avg_order_value
FROM transformed_sales_data
WHERE order_year = 2023
GROUP BY order_month
ORDER BY order_month;

--- Which customer had the highest order volume in the month of October 2023?
SELECT 
    c.name, 
    COUNT(t.order_id) as order_count
FROM transformed_sales_data t
JOIN raw_customer_data c ON t.customer_id = c.id
WHERE t.order_year = 2023 
  AND t.order_month = 10
GROUP BY c.name
ORDER BY order_count DESC
LIMIT 1;