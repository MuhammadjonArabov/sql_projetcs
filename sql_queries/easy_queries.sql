/**
1. Barcha xodimlarning ismlari va maoshlarini chiqaring.
2. IT bo‘limidagi xodimlar ro‘yxatini chiqaring.
3. Maoshi 4000 dan yuqori bo‘lgan xodimlarni tartiblangan holda chiqaring.
4. Eng yuqori maosh oluvchi xodimni toping.
5. Oxirgi 3 yilda ishga qabul qilingan xodimlarni chiqaring.
6. Ismi 'A' harfi bilan boshlanadigan xodimlarni chiqaring.
7. Toshkentda joylashgan bo‘limlarni chiqaring.
8. Barcha loyihalarni boshlanish sanasi bo‘yicha tartiblang.
9. Eng past maosh oluvchi xodimni toping.
10. Farg‘ona yoki Andijon bo‘limlarida ishlaydigan xodimlarni chiqaring.
11. Har bir bo‘limdagi xodimlar sonini chiqaring.
12. Barcha xodimlarning umumiy maoshini hisoblang.



19. 2023-yilda boshlangan loyihalar sonini toping.
21. Har bir bo‘limdagi o‘rtacha maoshni va xodimlar sonini chiqaring.
22. Har bir xodimning bo‘limi nomini chiqaring.
23. IT bo‘limidagi loyihalar va ularning boshlanish sanasini chiqaring.
24. Hech qanday loyihasi bo‘lmagan bo‘limlarni chiqaring.
25. Barcha bo‘limlar va ulardagi xodimlar ro‘yxatini chiqaring (xodimi bo‘lmasa ham).
26. Xodimlari va loyihalari bo‘lgan bo‘limlarni chiqaring.
27. IT va HR bo‘limlaridagi xodimlar va loyihalarni birlashtiring.
28. Barcha loyihalarni va ularning bo‘lim nomlarini chiqaring.
29. Maoshi 5000 dan yuqori bo‘lgan xodimlarning bo‘limlarini chiqaring.
30. Har bir loyiha uchun bo‘lim joylashuvini chiqaring.
31. Xodimlari bo‘lmagan bo‘limlarni chiqaring.
**/


-------- 1 ---------
SELECT first_name, salary FROM employees;


-------- 2 ---------
SELECT * FROM employees WHERE deparment_id = 1;


-------- 3 ---------
SELECT * FROM employees WHERE salary > 4000 ORDER BY salary DESC;


-------- 4 ---------
SELECT * FROM employees ORDER BY salary DESC LIMIT 1;


-------- 5 ---------
SELECT * FROM employees WHERE hire_data >= CURRENT_DATE  - INTERVAL '3 years';


-------- 6 ---------
SELECT * FROM employees WHERE first_name LIKE 'A%';


-------- 7 ---------
SELECT deparment_name FROM deparments WHERE location = 'Toshkent';


-------- 8 ---------
SELECT * FROM projects ORDER BY start_date;


-------- 9 ---------
SELECT * FROM employees ORDER BY salary ASC LIMIT 1;


-------- 10 --------
  -- 1 - variant
SELECT e.first_name, e.last_name, d.deparment_name, d.location FROM employees e 
JOIN deparment d ON e.deparment_id = d.deparment_id 
WHERE D.location IN ('Fargona', 'Andijon');

  -- 2 - variant
SELECT * FROM employees WHERE deparment_id IN (
    SELECT deparment_id FROM deparments WHERE location IN ('Fargona', 'Andijon');
)  


-------- 11 --------
-- 1 - variant
SELECT d.deparment_name, COUNT(e.deparment_id) AS employee_count
FROM deparments d LEFT JOIN ermployees e ON d.deparment_id = e.deparment_id
GROUP BY d.deparment_name;

-- 2 - variant
SELECT d.deparment_name, (
    SELECT COUNT(*)
    FROM employees e WHERE e.deparment_id  = d.deparment_id
) FROM deparments d;


-------- 12 --------
SELECT SUM(salary) AS total_salary FROM employees;


---- 13. IT bo‘limidagi xodimlarning o‘rtacha maoshini toping.
-- 1 - variant
SELECT AVG(salary) AS avg_salary FROM ermployees WHERE deparment_id = 1;

-- 2 - variant
SELECT AVG(e.salary) AS avg_salary FROM employees e 
JOIN deparments d ON e.deparment_id = d.deparment_id
WHERE d.deparment_name = 'IT';


---- 14. Eng katta byudjetli loyihani toping.
SELECT * FROM projects WHERE budget = (SELECT MAX(budget) FROM projects);


---- 15. Har bir bo‘limdagi loyihalarning umumiy byudjetini chiqaring.
-- 1 - variant
SELECT d.deparment_name, SUM(p.budget) AS total_budget FROM deparments d 
JOIN projects p ON d.deparment_id = p.deparment_id
GROUP BY d.deparment_name;

--2 - variant
SELECT deparment_name, (
  SELECT SUM(budget) FROM projects WHERE projects.deparment_id = deparments.deparment_id
) AS totla_budget FROM deparments;


---- 16. Kamida 2 ta xodimi bor bo‘lgan bo'limlarni chiqaring.
SELECT d.deparment_name, COUNT(e.employe_id) FROM deparments d 
JOIN employees e ON deparments.deparment_id = e.deparment_id
GROUP BY d.deparment_name HAVING COUNT(e.employe_id) >= 2;


---- 17. Eng kichik loyiha byudjetini toping.
SELECT peoject_name, budget FROM projects WHERE budget = (
  SELECT MIN(budget) FROM projects
);


---- 18. Har bir bo‘limdagi eng yuqori maoshni chiqaring.
SELECT d.deparment_name MAX(e.salary) FROM deparments d 
JOIN employees e ON d.deparment_id = e.deparment_id
GROUP BY d.deparment_name;
