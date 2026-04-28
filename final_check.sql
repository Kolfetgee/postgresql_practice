SELECT
c.id AS customer_id,
c.name,
c.email,
o.id AS order_id,
o.order_date,
o.total,
oi.id AS item_id,
oi.product_name,
oi.quantity,
oi.unit_price,
oi.quantity * oi.unit_price AS item_total
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
ORDER BY c.id, o.id, oi.id;
