-- LOAD DATAS
INSERT INTO movies(id, title, release_year, genre, price)
VALUES
    (1, 'The Shaw shank Redemption', 1994, 'HORROR', 15.99),
    (2, 'Ant Man', 2019, 'ADVENTURE', 15.00),
    (3, 'Fallen', 1996, 'HORROR', 23.99),
    (4, 'The barbershop', 2006, 'COMEDY', 6.50),
    (5, 'The last dance', 2021, 'SPORTS', 55.99),
    (6, 'Peter Pan', 2004, 'ADVENTURE', 15.99),
    (7, 'Fast & Furious 7', 2018, 'ACTION', 36.00),
    (8, 'Harry Potter', 2000, 'ACTION', 26.50),
    (9, 'Jungle book', 2004, 'ADVENTURE', 25.00);

-- Insert sample data into products table
INSERT INTO products (product_id, name, price, quantity) VALUES
(1, 'T-shirt', 15.99, 100),
(2, 'Jeans', 29.99, 80),
(3, 'Sneakers', 49.99, 50),
(4, 'Hoodie', 39.99, 60),
(5, 'Backpack', 24.99, 70);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, name, address) VALUES
(1, 'John Smith', '123 Main St, New York, NY'),
(2, 'Jane Doe', '456 Elm St, Los Angeles, CA'),
(3, 'Bob Johnson', '789 Oak St, Chicago, IL'),
(4, 'Emily Davis', '101 Pine St, Houston, TX'),
(5, 'Michael Brown', '202 Maple St, Miami, FL');

-- Insert sample data into salespeople table
INSERT INTO salespeople (salesperson_id, name, region) VALUES
(1, 'Alice Johnson', 'New York'),
(2, 'David Lee', 'Los Angeles'),
(3, 'Sarah Smith', 'Chicago'),
(4, 'Mike Wilson', 'Houston'),
(5, 'Emma Garcia', 'Miami');

-- Insert sample data into sales table
INSERT INTO sales (sale_id, product_id, customer_id, salesperson_id, sale_date, quantity) VALUES
(1, 1, 1, 1, '2024-04-01', 5),
(2, 2, 2, 2, '2024-04-02', 3),
(3, 3, 3, 3, '2024-04-03', 2),
(4, 4, 4, 4, '2024-04-04', 4),
(5, 5, 5, 5, '2024-04-05', 6);

-- Insert sample data into product_suppliers table
INSERT INTO product_suppliers (supplier_id, product_id, supply_price) VALUES
(1, 1, 10.00),
(2, 2, 20.00),
(3, 3, 30.00),
(4, 4, 25.00),
(5, 5, 15.00);
