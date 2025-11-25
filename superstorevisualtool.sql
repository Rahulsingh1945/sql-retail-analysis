SELECT 
    s.item_code,
    i.item_name,
    ROUND(SUM(s.quantity_sold * s.selling_price), 2) AS total_sales_value
FROM sales s
JOIN items i 
    ON CAST(s.item_code AS VARCHAR) = CAST(i.item_code AS VARCHAR)
GROUP BY s.item_code, i.item_name
ORDER BY total_sales_value DESC
LIMIT 5;
