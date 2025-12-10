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