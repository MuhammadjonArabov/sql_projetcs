CREATE TABLE deparments (
    deparment_id SERIAL PRIMARY KEY,
    deparment_name VARCHAR(50) NOT NULL,
    location VARCHAR(100)
);

INSERT INTO deparments (deparment_name, location) VALUES
(1, 'IT', 'Toshkent'),
(2, 'HR', 'Samarqand'),
(3, 'Finance', 'Buxoro'),
(4, 'Marketing', 'Fargona'),
(5, 'Sales', 'Andijon');


CREATE TABLE employees (
    employe_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 0),
    email VARCHAR(100) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary >= 0),
    deparment_id INT REFERENCES deparments(deparment_id)
);

INSERT INTO employees (employe_id, first_name, last_name, email, hire_data, salary, deparment_id) VALUES
(1, 'Ali', 'Valiyev', 'ali.valiyev@email.com', '2020-01-15', 5000.00, 1),
(2, 'Nodira', 'Aliyeva', 'nodira.aliyeva@email.com', '2019-03-22', 4500.00, 2),
(3, 'Kamron', 'Hakimov', 'kamron.hakimov@email.com', '2021-06-10', 6000.00, 1),
(4, 'Zilola', 'Qodirova', 'zilola.qodirova@email.com', '2018-11-05', 4000.00, 3),
(5, 'Shaxzod', 'Toshmatov', 'shaxzod.toshmatov@email.com', '2022-02-20', 3500.00, 4),
(6, 'Diyor', 'Rahimov', 'diyor.rahimov@email.com', '2023-01-30', 3000.00, 5),
(7, 'Malika', 'Sobirova', 'malika.sobirova@email.com', '2020-07-12', 4800.00, 2),
(8, 'Farhod', 'Nurmatov', 'farhod.nurmatov@email.com', '2017-09-01', 7000.00, 1),
(9, 'Gulnora', 'Yusupova', 'gulnora.yusupova@email.com', '2021-04-15', 4200.00, 3),
(10, 'Jasur', 'Mirzayev', 'jasur.mirzayev@email.com', '2019-08-25', 3900.00, 4);


CREATE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12, 2),
    deparment_id INT,
    FOREIGN KEY (deparment_id) REFERENCES deparments(deparment_id)
)

INSERT INTO projects (project_id, project_name, start_date, end_date, budget, deparment_id) VALUES
(1, 'Website Redesign', '2023-01-01', '2023-06-30', 15000.00, 1),
(2, 'Employee Training', '2022-05-15', '2022-12-31', 8000.00, 2),
(3, 'Financial Audit', '2023-03-01', '2023-09-30', 12000.00, 3),
(4, 'Marketing Campaign', '2023-07-01', '2023-12-31', 20000.00, 4),
(5, 'Sales App', '2023-02-01', '2023-10-15', 18000.00, 5),
(6, 'Database Migration', '2023-04-01', '2023-11-30', 25000.00, 1),
(7, 'Recruitment System', '2023-06-01', '2024-01-31', 10000.00, 2);

