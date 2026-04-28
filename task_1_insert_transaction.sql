BEGIN;

WITH new_customer AS (
INSERT INTO customers (name, email)
VALUES ('Diana Prince', 'diana@example.com')
RETURNING id
),
new_order AS (
INSERT INTO orders (customer_id, order_date, total)
SELECT id, '2023-10-10', 0.00
FROM new_customer
RETURNING id
)
INSERT INTO order_items (order_id, product_name, quantity, unit_price)
SELECT id, 'Headphones', 1, 150.00 FROM new_order
UNION ALL
SELECT id, 'Charger', 2, 20.00 FROM new_order;

COMMIT;

SELECT
c.name,
c.email,
o.id AS order_id,
o.order_date,
o.total,
oi.product_name,
oi.quantity,
oi.unit_price
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
WHERE c.email = 'diana@example.com'
ORDER BY o.id, oi.id;
