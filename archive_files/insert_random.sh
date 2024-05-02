#!/bin/bash

DATABASE_NAME=tutos
POSTGRES_USER=tuto
HOST=localhost

# Insert random data into the users table
function insert_users() {
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO users (  received_at) VALUES
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}

# Insert random data into the product table
function insert_product() {
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO product (  received_at) VALUES
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    (NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}


# Insert random data into the orders table
function insert_orders() {
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO orders (amount, user_id,   received_at) VALUES
   (ROUND((RANDOM() * (500-10) + 10)::numeric, 2), (SELECT id FROM users ORDER BY RANDOM() LIMIT 1),    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
   (ROUND((RANDOM() * (500-10) + 10)::numeric, 2), (SELECT id FROM users ORDER BY RANDOM() LIMIT 1),    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
   (ROUND((RANDOM() * (500-10) + 10)::numeric, 2), (SELECT id FROM users ORDER BY RANDOM() LIMIT 1),    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
   (ROUND((RANDOM() * (500-10) + 10)::numeric, 2), (SELECT id FROM users ORDER BY RANDOM() LIMIT 1),    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
   (ROUND((RANDOM() * (500-10) + 10)::numeric, 2),  (SELECT id FROM users ORDER BY RANDOM() LIMIT 1),    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);

    "
}

# Insert random data into the items table
function insert_items() {
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO items (product_id, qty, size, color,   received_at) VALUES
    ((SELECT id FROM product ORDER BY RANDOM() LIMIT 1), (ROUND((RANDOM() * 100)::int)),
    SUBSTRING('SML' FROM (ROUND((RANDOM() * 2) + 1))::int FOR 1), SUBSTRING('RGBY' FROM (ROUND((RANDOM() * 3) + 1))::int FOR 1), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM product ORDER BY RANDOM() LIMIT 1), (ROUND((RANDOM() * 100)::int)),
    SUBSTRING('SML' FROM (ROUND((RANDOM() * 2) + 1))::int FOR 1), SUBSTRING('RGBY' FROM (ROUND((RANDOM() * 3) + 1))::int FOR 1), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM product ORDER BY RANDOM() LIMIT 1), (ROUND((RANDOM() * 100)::int)),
    SUBSTRING('SML' FROM (ROUND((RANDOM() * 2) + 1))::int FOR 1), SUBSTRING('RGBY' FROM (ROUND((RANDOM() * 3) + 1))::int FOR 1), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM product ORDER BY RANDOM() LIMIT 1), (ROUND((RANDOM() * 100)::int)),
    SUBSTRING('SML' FROM (ROUND((RANDOM() * 2) + 1))::int FOR 1), SUBSTRING('RGBY' FROM (ROUND((RANDOM() * 3) + 1))::int FOR 1), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM product ORDER BY RANDOM() LIMIT 1), (ROUND((RANDOM() * 100)::int)),
    SUBSTRING('SML' FROM (ROUND((RANDOM() * 2) + 1))::int FOR 1), SUBSTRING('RGBY' FROM (ROUND((RANDOM() * 3) + 1))::int FOR 1), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}



# Insert random data into the order_items table
function insert_order_items() {
sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO order_items (order_id, item_id, purchase_amount, qty,   received_at) VALUES
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1),
    ROUND((RANDOM() * (200-20) + 20)::numeric, 2), (ROUND((RANDOM() * 10)::int)),
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1),
    ROUND((RANDOM() * (200-20) + 20)::numeric, 2), (ROUND((RANDOM() * 10)::int)),
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1),
    ROUND((RANDOM() * (200-20) + 20)::numeric, 2), (ROUND((RANDOM() * 10)::int)),
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1),
    ROUND((RANDOM() * (200-20) + 20)::numeric, 2), (ROUND((RANDOM() * 10)::int)),
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1),
    ROUND((RANDOM() * (200-20) + 20)::numeric, 2), (ROUND((RANDOM() * 10)::int)),
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}

# Insert random data into the refunds table
function insert_refunds() {
 sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME"  -c "
    INSERT INTO refunds (order_id, amount,   received_at) VALUES
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), ROUND((RANDOM() * (100-1) + 1)::numeric, 2),
     NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), ROUND((RANDOM() * (100-1) + 1)::numeric, 2),
     NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), ROUND((RANDOM() * (100-1) + 1)::numeric, 2),
     NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), ROUND((RANDOM() * (100-1) + 1)::numeric, 2),
     NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM orders ORDER BY RANDOM() LIMIT 1), ROUND((RANDOM() * (100-1) + 1)::numeric, 2),
     NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}


# Insert random data into the refund_items table
function insert_refund_items() {
   sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "
    INSERT INTO refund_items (refund_id, item_id, refund_amount, qty,   received_at) VALUES
    ((SELECT id FROM refunds ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1), 
    ROUND((RANDOM() * (50-5) + 5)::numeric, 2), (ROUND((RANDOM() * 5)::int)), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM refunds ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1), 
    ROUND((RANDOM() * (50-5) + 5)::numeric, 2), (ROUND((RANDOM() * 5)::int)), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM refunds ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1), 
    ROUND((RANDOM() * (50-5) + 5)::numeric, 2), (ROUND((RANDOM() * 5)::int)), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM refunds ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1), 
    ROUND((RANDOM() * (50-5) + 5)::numeric, 2), (ROUND((RANDOM() * 5)::int)), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval),
    ((SELECT id FROM refunds ORDER BY RANDOM() LIMIT 1), (SELECT id FROM items ORDER BY RANDOM() LIMIT 1), 
    ROUND((RANDOM() * (50-5) + 5)::numeric, 2), (ROUND((RANDOM() * 5)::int)), 
    NOW() - (ROUND(RANDOM() * 30)::int || ' days')::interval);
    "
}

# Call the functions to insert data
insert_users
insert_product
insert_orders
insert_items
insert_order_items
insert_refunds
insert_refund_items

echo "Data insertion complete."


