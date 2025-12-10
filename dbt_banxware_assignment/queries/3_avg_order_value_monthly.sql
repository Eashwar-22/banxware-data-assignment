--What is the average order value for each month in the year 2023?
SELECT 
    order_month, 
    AVG(total_sales_amount) as avg_order_value
FROM transformed_sales_data
WHERE order_year = 2023
GROUP BY order_month
ORDER BY order_month;