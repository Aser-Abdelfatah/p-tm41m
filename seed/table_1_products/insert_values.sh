
DATABASE_NAME=tutos
POSTGRES_USER=tuto
HOST=localhost

sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "

INSERT INTO products (product_id, name, price, quantity) VALUES
(1, 'T-shirt', 15.99, 100),
(2, 'Jeans', 29.99, 80),
(3, 'Sneakers', 49.99, 50),
(4, 'Hoodie', 39.99, 60),
(5, 'Backpack', 24.99, 70);

INSERT INTO customers (customer_id, name, address) VALUES
(1, 'John Smith', '123 Main St, New York, NY'),
(2, 'Jane Doe', '456 Elm St, Los Angeles, CA'),
(3, 'Bob Johnson', '789 Oak St, Chicago, IL'),
(4, 'Emily Davis', '101 Pine St, Houston, TX'),
(5, 'Michael Brown', '202 Maple St, Miami, FL');

INSERT INTO salespeople (salesperson_id, name, region) VALUES
(1, 'Alice Johnson', 'New York'),
(2, 'David Lee', 'Los Angeles'),
(3, 'Sarah Smith', 'Chicago'),
(4, 'Mike Wilson', 'Houston'),
(5, 'Emma Garcia', 'Miami');

INSERT INTO sales (sale_id, product_id, customer_id, salesperson_id, sale_date, quantity) VALUES
(1, 1, 1, 1, '2024-04-01', 5),
(2, 2, 2, 2, '2024-04-02', 3),
(3, 3, 3, 3, '2024-04-03', 2),
(4, 4, 4, 4, '2024-04-04', 4),
(5, 5, 5, 5, '2024-04-05', 6);

INSERT INTO product_suppliers (supplier_id, product_id, supply_price) VALUES
(1, 1, 10.00),
(2, 2, 20.00),
(3, 3, 30.00),
(4, 4, 25.00),
(5, 5, 15.00);
"
