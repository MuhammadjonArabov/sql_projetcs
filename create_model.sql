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
