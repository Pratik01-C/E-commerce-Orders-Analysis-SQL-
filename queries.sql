-- Sample SQL Queries

-- 1. Repeat Customers
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Revenue by Category
SELECT p.category, SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 3. Cart Abandonment Rate
SELECT COUNT(*) AS abandoned,
       (SELECT COUNT(*) FROM orders) AS completed,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS abandonment_rate
FROM cart_abandoned;
