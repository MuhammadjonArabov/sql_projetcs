CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT, 
    phone VARCHAR(15)
);

INSERT INTO users (first_name, last_name, age, phone) VALUES
('Ali', 'Hakimov', 20, '+998912345678'),
('Bobur', 'Bozorov', 19, '+998921232332'),
('Sobir', 'Jalilov', 21, '+998981235677'),
('Halimjon', 'Qabulov', 23, '+998939991233');


CREATE TABLE passport (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id), 
    passport_number VARCHAR(20),
    issue_date DATE,
    expiry_date DATE
);

INSERT INTO passport (user_id, passport_number, issue_date, expiry_date) VALUES
(1, 'AC1234544', '1989-01-02', '1990-02-02'),
(2, 'AC1234344', '1981-01-02', '1995-02-02'),
(3, 'AC1234514', '1982-01-02', '1998-02-02');


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id), 
    product_name VARCHAR(25),
    order_date DATE
);

INSERT INTO orders (user_id, product_name, order_date) VALUES 
(1, 'Olma', '1990-02-02'),
(2, 'Nok', '1990-02-03'),
(3, 'Behi', '1990-02-04'),
(4, 'Shaftoli', '1990-02-05');


CREATE TABLE addresses(
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(id),
	address_line TEXT,
	city VARCHAR(50),
	region VARCHAR(50),
	postal_code VARCHAR(10),
	address_type VARCHAR(10)
);

INSERT INTO addresses (user_id, address_line, city, region, postal_code, address_type) VALUES 
	(1, 'Shaxrisabz ko‘chasi, 12-uy', 'Toshkent', 'Toshkent', '100011', 'home'),
	(1, 'Universitet ko‘chasi, 8-uy', 'Toshkent', 'Toshkent', '100017', 'work'),
	(2, 'Amir Temur ko‘chasi, 3-uy', 'Samarqand', 'Samarqand', '140100', 'home');



CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(20)  
);

INSERT INTO payments (order_id, amount, payment_date, payment_method) VALUES
(1, 250.00, '2025-09-23', 'card'),
(2, 120.50, '2024-08-12', 'cash'),
(3, 145.75, '2025-09-05', 'online');


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES
('Olma', 234),
('Nok', 234), 
('Behi', 456), 
('shaftoli', 123);




SERIAL u.first_name, u.last_name, a.city FROM users u 
JOIN addresses a ON u.id = a.user_id
WHERE a.city = 'Toshkent';


UPDATE products SET phone = '+998941112277' WHERE name = 'Olma';

ALTER TABLE users ADD COLUMN email VARCHAR(100);

CREATE INDEX index_users_phone ON users(phone);

DROP INDEX index_users_phone;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade FLOAT,
    city VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, city) VALUES
('Ali', 'Karimov', 20, 85.5, 'Toshkent'),
('Dilshod', 'Saidov', 19, 72.0, 'Andijon'),
('Malika', 'Yuldasheva', 21, 90.0, 'Namangan'),
('Sardor', 'Bekmurodov', 18, 66.5, 'Samarqand'),
('Aziza', 'Shamsiyeva', 20, 48.0, 'Buxoro'),
('Jamshid', 'Xolmatov', 22, 95.0, 'Toshkent'),
('Zarnigor', 'Xidirova', 17, 55.5, 'Farg‘ona'),
('Otabek', 'Qo‘chqorov', 19, 80.0, 'Xorazm'),
('Shahnoza', 'Rustamova', 20, 77.7, 'Toshkent'),
('Bobur', 'Nasriddinov', 23, 60.0, 'Qashqadaryo'),
('Muhammad', 'Salimov', 21, 82.2, 'Andijon'),
('Laylo', 'Azimova', 19, 68.4, 'Namangan');


