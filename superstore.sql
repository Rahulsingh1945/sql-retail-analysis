CREATE TABLE items (
    item_code VARCHAR(50),
    item_name VARCHAR(200),
    category_code VARCHAR(50),
    category_name VARCHAR(200)
);

CREATE TABLE sales (
    sale_date DATE,
    sale_time TIME(3),
    item_code BIGINT,
    quantity_sold NUMERIC(10,3),
    selling_price NUMERIC(10,2),
    sale_status TEXT,
    discount_status TEXT
);

CREATE TABLE wholesale (
    sale_date DATE,
    item_code BIGINT,
    wholesale_price NUMERIC(10,2)
);

CREATE TABLE loss_rate (
    item_code BIGINT,
    item_name TEXT,
    loss_rate NUMERIC(10,3)
);

SELECT 
    item_code,
    SUM(quantity_sold * selling_price) AS total_revenue
FROM sales
GROUP BY item_code
ORDER BY total_revenue DESC
LIMIT 5;

SELECT 
    s.item_code,
    i.item_name,
    SUM(s.quantity_sold * s.selling_price) AS total_revenue
FROM sales s
JOIN items i ON s.item_code = i.item_code::BIGINT
GROUP BY s.item_code, i.item_name
ORDER BY total_revenue DESC
LIMIT 5;

SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(sales) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;




