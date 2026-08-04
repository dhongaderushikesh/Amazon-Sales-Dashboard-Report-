create database ECOMM_DATA;
use ecomm_data;

show tables;

select * from customer;

-- -- 1. Find total sales and profit for each category.
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM customer
GROUP BY category;

-- 2. Find the top 5 customers by sales.
SELECT
    customer_name,
    SUM(sales) AS total_sales
FROM customer
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;

-- 3. Find customers with more than 10 orders.
SELECT
    customer_name,
    COUNT(order_id) AS total_orders
FROM customer
GROUP BY customer_name
HAVING COUNT(order_id) > 10;

-- 4. Find average profit by market.
SELECT
    market,
    AVG(profit) AS avg_profit
FROM customer
GROUP BY market;

-- 5. Find products with sales greater than ₹10,000.

SELECT
    product_name,
    SUM(sales) AS total_sales
FROM customer
GROUP BY product_name
HAVING SUM(sales) > 10000;

-- 6. Find total sales by year.
SELECT
    year,
    SUM(sales) AS total_sales
FROM customer
GROUP BY year
ORDER BY year;

-- 7. Find the highest-profit product in each category.
SELECT
    category,
    product_name,
    SUM(profit) AS total_profit
FROM customer
GROUP BY category, product_name
ORDER BY category, total_profit DESC;

-- 8. Find cities where total sales exceed ₹50,000.

SELECT
    city,
    SUM(sales) AS total_sales
FROM customer
GROUP BY city
HAVING SUM(sales) > 50000;

-- 9. Find orders with profit less than 0.
SELECT *
FROM customer
WHERE profit < 0;

-- 10. Find total sales by ship mode.
SELECT
    ship_mode,
    SUM(sales) AS total_sales
FROM customer
GROUP BY ship_mode;



