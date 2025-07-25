---- 31.  Xodimlarning to‘liq ismini (first_name va last_name) birlashtirib chiqaring.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;


---- 32.  Xodimlarning email manzillarining domen qismini chiqaring.
SELECT SUBSTRING(email FROM POSITION('@' IN email) + 1) domain FROM employees;


---- 33.  Xodimlarning ishga qabul qilingan yilini chiqaring
SELECT first_name, EXTRACT(YEAR FROM hire_data) AS hire_year FROM employees;


---- 34. Loyiha davomiyligini (kunlarda) hisoblang
SELECT first_name, (end_date - start_date) AS duration_days FROM projects;


---- 35. 