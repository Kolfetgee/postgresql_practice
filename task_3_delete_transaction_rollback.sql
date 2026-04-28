-- Demonstration of DELETE with ROLLBACK

BEGIN;

DELETE FROM order_items
WHERE product_name = 'Book'
AND order_id = 2;

DELETE FROM customers
WHERE id = 3;

SELECT * FROM order_items WHERE product_name = 'Book';
SELECT * FROM customers WHERE id = 3;
SELECT * FROM orders WHERE customer_id = 3;
SELECT * FROM order_items WHERE order_id = 4;

ROLLBACK;

SELECT * FROM order_items WHERE product_name = 'Book';
SELECT * FROM customers WHERE id = 3;
SELECT * FROM orders WHERE customer_id = 3;
SELECT * FROM order_items WHERE order_id = 4;

-- Correct DELETE with COMMIT

BEGIN;

DELETE FROM order_items
WHERE product_name = 'Book'
AND order_id = 2;

DELETE FROM customers
WHERE id = 3;

COMMIT;

SELECT * FROM order_items WHERE product_name = 'Book';
SELECT * FROM customers WHERE id = 3;
SELECT * FROM orders WHERE customer_id = 3;
SELECT * FROM order_items WHERE order_id = 4;
