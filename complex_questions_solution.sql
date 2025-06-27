/*
1. Select students with grades between 60 and 80, not from Toshkent, sorted by age.
2. Count students with grades above 70 per city.
3. Calculate the average grade of students aged 18 or 19 from Samarqand or Namangan.
4. Select the top 3 cities by average grade.
5. Find the highest and lowest grades per age group.
7. Count students with grades above 80 and from cities not starting with 'T'.
8. Select students with 'a' in their first name and grades between 70 and 90.
9. Calculate the sum of grades for students aged 20 or older from Toshkent or Andijon.
10. Select the top 2 students per city by grade.
11. Find cities with more than 2 students.
12. Select students with grades above the overall average, sorted by city and grade.
13. Calculate the average age of students with grades above 80, grouped by city.
14. Select students not in the top 3 grades.
15. Find the difference between the highest and lowest grades per city.
16. Select students with first names longer than 5 characters and grades above 70.
17. Find cities where the average grade is above the overall average grade.
18. Select students in the top 50% of grades in their city.
19. Count students with grades at least 60 per age group, sorted by count.
20. Select students whose grades are within 10 points of their city’s average grade.
*/

---------- 1 ----------
SELECT * FROM students WHERE grade BETWEEN 60 AND 80 AND city != 'Toshkent' ORDER BY age ASC;


---------- 2 ----------
SELECT city, COUNT(*) AS count_city FROM students WHERE grade > 70 GROUP BY city;


---------- 3 ----------
SELECT AVG(grade) AS avg_grade FROM students WHERE city IN ('Samarqand', 'Namangan') AND age IN (18, 19);


---------- 4 ---------- 
SELECT city, AVG(grade) AS average_city FROM students GROUP BY city ORDER BY city DESC LIMIT 3;


---------- 5 ----------
SELECT age, MAX(grade) AS max_grade, MIN(grade) AS min_grade FROM students GROUP BY age;


---------- 6 ----------
SELECT COUNT(*) AS count_students FROM students WHERE grade > 80 AND city NOT LIKE 'T%';


---------- 7 ----------
SELECT * FROM students WHERE first_name LIKE '%a%' AND grade BETWEEN 70 AND 90;


