
DATABASE_NAME=tutos
POSTGRES_USER=tuto
HOST=localhost

sudo docker exec -it postgres_tuto psql -U "$POSTGRES_USER" -d "$DATABASE_NAME" -c "

INSERT INTO products (product_id, name, price, quantity) VALUES
(1, 'T-shirt', 15.99, 100),
(2, 'Jeans', 29.99, 80),
(3, 'Sneakers', 49.99, 50),
(4, 'Hoodie', 39.99, 60),
(5, 'Backpack', 24.99, 70),
(6, 'Trousers', 34.99, 56),
(7, 'Socks', 4.99, 80),
(8, 'Dress', 55.99, 90),
(9, 'Speaker', 199.99, 25),
(10, 'Desk Lamp', 39.99, 45),
(11, 'Notebook', 2.99, 100),
(12, 'Pen', 1.49, 150),
(13, 'USB Cable', 5.99, 80),
(14, 'Charger', 19.99, 65),
(15, 'Backpack', 49.99, 35);

INSERT INTO customers (customer_id, name, address) VALUES
(1, 'John Smith', '123 Main St, New York, NY'),
(2, 'Jane Doe', '456 Elm St, Los Angeles, CA'),
(3, 'Bob Johnson', '789 Oak St, Chicago, IL'),
(4, 'Emily Davis', '101 Pine St, Houston, TX'),
(5, 'Michael Brown', '202 Maple St, Miami, FL'),
(6, 'David Green', '303 Ash St, San Francisco, CA'),
(7, 'Eve Brown', '404 Cedar St, New York, NY'),
(8, 'Frank Wright', '505 Birch St, New York, NY'),
(9, 'Grace Hall', '606 Elm St, San Diego, CA'),
(10, 'Henry Ford', '707 Walnut St, New York, NY'),
(11, 'Irene Clark', '808 Willow St, Pomona, CA'),
(12, 'Jack Stone', '909 Maple St, Claremont City, CA'),
(13, 'Kelly Adams', '110 Oak St, Redwood, CA'),
(14, 'Larry Page', '211 Pine St, Palo Alto, CA'),
(15, 'Megan Hill', '312 Spruce St, Evanston, IL');

INSERT INTO salespeople (salesperson_id, name, region) VALUES
(1, 'Alice Johnson', 'New York'),
(2, 'David Lee', 'Los Angeles'),
(3, 'Sarah Smith', 'Chicago'),
(4, 'Mike Wilson', 'Houston'),
(5, 'Emma Garcia', 'Miami'),
(6, 'Isabella Martinez', 'New York'),
(7, 'Ethan Brown', 'Los Angeles'),
(8, 'Sophia Wilson', 'Bay Area'),
(9, 'Aiden Moore', 'Nevada'),
(10, 'Olivia Taylor', 'Las Vegas'),
(11, 'Liam Jones', 'Portland'),
(12, 'Emma Garcia', 'Seattle'),
(13, 'Jacob White', 'Texas'),
(14, 'Ava Lopez', 'New York'),
(15, 'William Davis', 'New York');

INSERT INTO sales (sale_id, product_id, customer_id, salesperson_id, sale_date, quantity) VALUES
(1, 1, 1, 1, '2023-10-01', 2),
(2, 2, 2, 2, '2023-10-02', 1),
(3, 3, 3, 3, '2023-10-03', 3),
(4, 4, 4, 4, '2023-10-04', 1),
(5, 5, 5, 5, '2023-10-05', 5),
(6, 6, 6, 6, '2023-10-06', 2),
(7, 7, 7, 7, '2023-10-07', 1),
(8, 8, 8, 8, '2023-10-08', 2),
(9, 9, 9, 9, '2023-10-09', 3),
(10, 10, 10, 10, '2023-10-10', 1),
(11, 11, 11, 11, '2023-10-11', 10),
(12, 12, 12, 12, '2023-10-12', 15),
(13, 13, 13, 13, '2023-10-13', 5),
(14, 14, 14, 14, '2023-10-14', 4),
(15, 15, 15, 15, '2023-10-15', 3);

INSERT INTO product_suppliers (supplier_id, product_id, supply_price) VALUES
(1, 1, 800.00),
(2, 2, 500.00),
(3, 3, 300.00),
(4, 4, 200.00),
(5, 5, 30.00),
(6, 6, 15.00),
(7, 7, 70.00),
(8, 8, 45.00),
(9, 9, 150.00),
(10, 10, 20.00),
(11, 11, 1.50),
(12, 12, 0.99),
(13, 13, 3.50),
(14, 14, 12.00),
(15, 15, 30.00);
"
