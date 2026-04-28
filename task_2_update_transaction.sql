BEGIN;

UPDATE orders
SET total = 1050.00
WHERE id = 1;

UPDATE orders
SET total = 300.00
WHERE id = 4;

UPDATE order_items
SET quantity = 2
WHERE product_name = 'Phone'
AND order_id = 3;

COMMIT;

SELECT * FROM orders
WHERE id IN (1, 4)
ORDER BY id;

SELECT * FROM order_items
WHERE product_name = 'Phone'
AND order_id = 3;
