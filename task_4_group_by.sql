SELECT
c.name,
COUNT(o.id) AS orders_count,
ROUND(AVG(o.total), 2) AS average_order_total
FROM customers c
JOIN orders o ON o.customer_id = c.id
GROUP BY c.name
ORDER BY average_order_total DESC;
