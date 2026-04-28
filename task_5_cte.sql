WITH order_totals AS (
SELECT
oi.order_id,
SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM order_items oi
GROUP BY oi.order_id
)
SELECT
c.name,
COUNT(o.id) AS orders_count,
SUM(ot.calculated_total) AS total_spent
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_totals ot ON ot.order_id = o.id
GROUP BY c.name
HAVING SUM(ot.calculated_total) > 500
ORDER BY total_spent DESC;
