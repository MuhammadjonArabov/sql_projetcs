/* 
1. Select students from Toshkent, sorted by grade in descending order.
2. Count students older than 19.
3. Find the lowest grade among students from Andijon.
4. Find the oldest age among students with grades above 80.
5. Calculate the average age of students from Namangan.
6. Calculate the sum of grades for students aged 20.
7. Select students whose last name ends with 'ov' or 'ova'.
8. Select students from Samarqand or Buxoro with grades above 40.
9. Select students not from Toshkent or Andijon.
10. Select students with grades between 70 and 90, sorted by age.
11. Count students with first names containing 'sh'.
12. Select the top 2 students from Toshkent by grade.
13. Calculate the average grade of students not aged 19.
14. Select students with grades above the overall average grade.
15. Count the number of students per city.
16. Find the highest grade per city.
17. Select students with grades above 80 and not from Toshkent.
18. Select students aged 19 or 20, sorted by grade in descending order, limited to 4.
19. Select first name, last name, and grade as performance alias.
20. Find the youngest age of students with last names starting with 'S'.
*/

---------- 1 ----------
SELECT * FROM WHERE city = 'Toshkent' ORDER BY grade DESC;


---------- 2 ----------
SELECT COUNT(*) FROM students WHERE age > 19;


---------- 3 ----------
SELECT MIN(grade) AS min_grade_in_andijan FROM students WHERE city = 'Toshkent';


---------- 4 ----------
SELECT MAX(age) AS max_age FROM students WHERE age > 80;


---------- 5 ----------
SELECT AVG(age) AS avg_age FROM students WHERE city = 'Nmanagan';


---------- 6 ----------
SELECT SUM(grade) AS sum_grade FROM students WHERE age = 20;


---------- 7 ----------
SELECT * FROM students WHERE last_name LIKE '%ov' OR last_name LIKE '%ova';


---------- 8 ----------
SELECT * FROM students WHERE city IN ('Samarqand', 'Buxoro') AND grade > 40;


---------- 9 ----------
SELECT * FROM students WHERE city NOT IN ('Toshkent', 'Andijon');


---------- 10 ----------
SELECT * FROM students WHERE grade BETWEEN 70 AND 90 ORDER BY age ASC;


---------- 11 ----------
SELECT COUNT(*) AS count_sh FROM students WHERE first_name LIKE '%sh%';

