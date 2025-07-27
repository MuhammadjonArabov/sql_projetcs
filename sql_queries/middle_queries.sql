---- 31.  Xodimlarning to‘liq ismini (first_name va last_name) birlashtirib chiqaring.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;


---- 32.  Xodimlarning email manzillarining domen qismini chiqaring.
SELECT SUBSTRING(email FROM POSITION('@' IN email) + 1) domain FROM employees;


---- 33.  Xodimlarning ishga qabul qilingan yilini chiqaring
SELECT first_name, EXTRACT(YEAR FROM hire_data) AS hire_year FROM employees;


---- 34. Loyiha davomiyligini (kunlarda) hisoblang
SELECT first_name, (end_date - start_date) AS duration_days FROM projects;


---- 35. Ismi 5 harfdan uzun bo'lgan xodimlarni chiqaring.
SELECT first_name FROM employees WHERE LENGTH(first_name) > 5;


---- 36. Loyihalarni oy nomi bo'yicha tartiblang
SELECT project_name, TO_CHAR(start_date, 'Month') AS FROM projects ORDER BY EXTRACT(MONTH FROM start_date);


---- 37. Xodimlarning email manzillarini katta harfga aylantiring
SELECT UPPER(email) AS upper_email FROM employees;



---- 38. Loyihalarni boshlanish yili bo'yicha guruhlang
SELECT EXTRACT(YEAR FROM start_date)::INT AS start_year , COUNT(*) AS project_count FROM projects
GROUP BY EXTRACT(YEAR FROM start_date) ORDER BY start_year;