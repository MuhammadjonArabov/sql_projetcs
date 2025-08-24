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


---- 39. Xodimlarning ismlarining birinchi 3 harfini chiqaring.
SELECT LEFT(first_name, 3) AS name_part FROM employees;


---- 40. Bugungi kunga nisbatan xodimlarning ish stajini (yillarda) hisoblang.
SELECT first_name, EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_data))::int AS years_employed FROM employees;


---- 41. Xodimlarning maosh darajasini belgilang: 4000 dan past - 'Low', 4000-6000 - 'Medium', 6000 dan yuqori - 'High'.
SELECT first_name, 
    CASE  
        WHEN salary < 4000 THEN 'Low'
        WHEN salary BETWEEN 4000 AND 6000 THEN 'Medium'
        ELSE 'Hight'
    END AS salary_level FROM employees;   


---- 42. Loyihalarni tugash sanasiga qarab 'Active' yoki 'Completed' deb belgilang.
SELECT project_name,
    CASE
        WHEN end_date > CURRENT_DATE THEN 'Active'
        ELSE 'Completed'
    END AS status FROM employees;  


---- 43. Maoshi o'rtacha maoshdan yuqori bo'lgan xodimlarni chiqaring
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);


---- 44. Har bir bo'limdagi eng yuqori maosh oluvchi hodimni chiqaring
SELECT d.deparment_name, e.first_name, e.salary FROM employees e JOIN deparments d
ON d.deparment_id = e.deparment_id 
WHERE (e.deparment_id, e.salary) IN (
    SELECT deparment_id, MAX(salary) FROM employees
    GROUP BY deparment_id
);


---- 45. Loyihalarni byudjetiga qarab guruhlang: 10000 dan past - 'Small', 10000-20000 - 'Medium', 20000 dan yuqori - 'Large'.
SELECT project_name,
    CASE
        WHEN budget < 10000 THEN 'Small'
        WHEN budget BETWEEN 10000 and 20000 THEN 'Medium'
        ELSE 'Large'
    END AS project_category 
FROM projects    


---- 46. Xodimlarning ishga qabul qilingan yiliga qarab 'Old' (2020 dan oldin) yoki 'New' deb belgilang
SELECT first_name, 
    CASE 
       WHEN EXTRACT(YEAR FROM hire_data) < 2020 THEN 'Old'
       ELSE 'New'
    END AS employe_status
SELECT employees;       