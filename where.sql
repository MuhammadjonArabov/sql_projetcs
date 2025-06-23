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

--------------------------------------------------------------------------

SELECT first_name FROM students WHERE grade > 70;

--------------------------------------------------------------------------

SELECT * FROM students WHERE age = 20;

--------------------------------------------------------------------------

SELECT first_name, last_name, age, city FROM students WHERE city = 'Toshkent';

