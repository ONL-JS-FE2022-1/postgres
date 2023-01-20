DROP TABLE orders;

CREATE TABLE orders(
    id serial PRIMARY KEY,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    customer_id int REFERENCES users(id)
);

ALTER TABLE users
ADD COLUMN id serial PRIMARY KEY;

CREATE TABLE orders_to_products (
    order_id int REFERENCES orders(id),
    product_id int REFERENCES products(id),
    quantity int,
    PRIMARY KEY(order_id, product_id)
);

INSERT INTO orders (customer_id) VALUES(4);

INSERT INTO orders_to_products (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(1, 4, 1);