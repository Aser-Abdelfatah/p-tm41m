#!/bin/bash

# Replace 'postgres_user' and 'your_database_name' with your PostgreSQL username and desired database name.

DATABASE_NAME=tutos
POSTGRES_USER=tuto


# Connect to PostgreSQL and execute the database and table creation commands
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d postgres -c "DROP DATABASE IF EXISTS $DATABASE_NAME;"
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE $DATABASE_NAME;"

# Execute the table creation in the new database
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c"
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    -- ... other user details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE product (
    id BIGSERIAL PRIMARY KEY,
    -- ... other product details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    amount NUMERIC(32,2),
    user_id BIGINT REFERENCES users(id),
    -- ... other order details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE items (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGINT REFERENCES product(id),
    qty INT,
    size CHAR(4),
    color CHAR(6),
    -- ... other item details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE order_items (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES orders(id),
    item_id BIGINT REFERENCES items(id),
    purchase_amount NUMERIC(32,2),
    qty INT,
    -- ... other order item details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE refunds (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES orders(id),
    amount NUMERIC(32,2),
    -- ... other refund details here ...
    received_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE refund_items (
    id BIGSERIAL PRIMARY KEY,
    refund_id BIGINT REFERENCES refunds(id),
    item_id BIGINT REFERENCES items(id),
    refund_amount NUMERIC(32,2),
    qty INT,
    -- ... other refund item details here ...
    received_at TIMESTAMP WITH TIME ZONE
);
"

echo "Database and tables created successfully!"

