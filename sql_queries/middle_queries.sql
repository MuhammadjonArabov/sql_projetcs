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


---- 47. Bo'limlarni xodimlar soniga qarab 'Small' (2 dan kam), 'Medium' (2-3), 'Large' (3 dan ko'p) deb tasniflang.
SELECT d.deparment_name
    CASE 
       WHEN COUNT(e.employe_id) < 2 THEN 'Small'
       WHEN COUNT(e.employe_id) BETWEEN 2 AND 3 THEN 'Medium'
       ELSE 'Large'
    END AS deparment_size
FROM deparments d LEFT JOIN employees e 
ON d.deparment_id = e.deparment_id ORDER BY d.deparment_name;     


---- 48. Maoshi eng yuqori 3 xodimni chiqaring
SELECT first_name, salary FROM employees ORDER BY salary DESC LIMIT 3;


---- 49. Loyihalarni davomiyligiga qarab 'Short' (<6 oy) yoki 'Long' deb belgilang.
SELECT project_name,
    CASE
        WHEN (end_date - start_date) < INTERVAL '6 month' THEN 'Sort',
        ELSE 'Long'
    END AS project_status
FROM projects;    


---- 50. Xodimlarning email manzillari uzunligiga qarab 'Short' (<20) yoki 'Long' deb belgilang.
SELECT first_name, email
    CASE 
       WHEN LENGTH(email) < 20 THEN 'Short'
       ELSE 'Long'
    END AS employe_email_long
FROM employees;       


---- 51. IT bo‘limida ishlaydigan va maoshi 5000 dan yuqori xodimlarni chiqaring.
SELECT first_name, salary FROM employees WHERE deparment_id = (
    SELECT deparment_id FROM deparments WHERE deparment_name = 'IT'
) AND salary > 5000;

SELECT e.first_name, e.salary, d.deparment_name FROM employees e JOIN deparments d
ON e.deparment_id = d.deparment_id WHERE e.salary > 5000 AND d.deparment_name = 'IT';


---- 52. Loyihasi bo'lgan bo'limlarda ishlaydigan xodimlarni chiqaring
