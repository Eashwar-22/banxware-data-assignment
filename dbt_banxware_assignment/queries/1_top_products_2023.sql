-- What are the top 5 products by total sales amount in the year 2023?
SELECT 
    product_id, 
    SUM(total_sales_amount) as total_revenue
FROM transformed_sales_data
WHERE order_year = 2023
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;
