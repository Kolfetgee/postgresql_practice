DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
order_date DATE NOT NULL,
total DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE order_items (
id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
product_name VARCHAR(100) NOT NULL,
quantity INTEGER NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(8, 2) NOT NULL CHECK (unit_price > 0)
);

INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice@example.com
'),
('Bob Smith', 'bob@example.com
'),
('Charlie Brown', 'charlie@example.com
');

INSERT INTO orders (customer_id, order_date, total) VALUES
(1, '2023-10-01', 150.00),
(1, '2023-10-05', 75.50),
(2, '2023-10-03', 200.00),
(3, '2023-10-07', 100.00);

INSERT INTO order_items (order_id, product_name, quantity, unit_price) VALUES
(1, 'Laptop', 1, 1000.00),
(1, 'Mouse', 2, 25.00),
(2, 'Book', 3, 25.17),
(3, 'Phone', 1, 800.00),
(3, 'Case', 1, 50.00),
(4, 'Tablet', 1, 300.00);

SELECT
c.name,
o.id AS order_id,
o.order_date,
o.total,
oi.product_name,
oi.quantity,
oi.unit_price
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
ORDER BY c.id, o.id, oi.id;
