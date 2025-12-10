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