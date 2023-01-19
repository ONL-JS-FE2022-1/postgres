CREATE TABLE products (
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL CHECK(brand != ''),
    model varchar(300) NOT NULL CHECK(model != ''),
    description text,
    category varchar(200) NOT NULL CHECK(category != ''),
    price numeric(10, 2) NOT NULL CHECK(price > 0),
    discounted_price numeric(10, 2) CHECK(discounted_price <= price)
);

INSERT INTO products (brand, model, category, price) VALUES
('Samsung', 'S10', 'smartphones', 200),
('iPhone', '5', 'smartphones', 500),
('Realme', '6', 'smartphones', 100),
('Asus', 'idoasid', 'laptop', 1500),
('Lenovo', 'Idepad....', 'laptop', 1350);

INSERT INTO products (brand, model, category, price) VALUES
('Samsung', 'S10', 'smartphones', 200),
('iPhone', '5', 'smartphones', 500);

ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand, model);

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK(quantity >= 0);

ALTER TABLE products
DROP CONSTRAINT "products_quantity_check";

ALTER TABLE products
ADD COLUMN quantity int;

