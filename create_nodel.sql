CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT, 
    phone VARCHAR(15)
);

INSERT INTO user (first_name, last_name, age, phone) VALUES
("Ali", "Hakimov", 20, "+998912345678"),
("Bobur", "Bozorov", 19, "+998921232332"),
("Sobir", "Jalilov", 21, "+998981235677"),
("Halimjon", "Qabulov", 23, "+998939991233");
