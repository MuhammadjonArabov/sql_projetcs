/* 
1. Select all students.
2. Select students from Toshkent.
3. Select students older than 20.
4. Select students with grades above 80.
5. Select the first 5 students.
6. Sort students by age in ascending order.
7. Sort students by grade in descending order.
8. Count the total number of students.
9. Find the youngest student's age.
10. Find the highest grade.
11. Calculate the sum of all grades.
12. Calculate the average grade.
13. Select students whose first name starts with 'A'.
14. Select students from Toshkent or Andijon.
15. Select students aged between 18 and 20.
16. Select students not from Toshkent.
17. Select students with grades above 70 and from Toshkent.
18. Select students with grades below 60 or above 90.
19. Select first name and last name as fname and lname aliases.
20. Select the top 3 students by grade.
 */

----------- 1 ---------
SELECT * FROM students;

----------- 2 ---------
SELECT * FROM students WHERE city = 'Toshkent'

----------- 3 ---------
SELECT * FROM students WHERE age > 20;

----------- 4 ---------
SELECT * FROM students WHERE grade > 80;

----------- 5 ---------
SELECT * FROM students LIMIT 5;

----------- 6 ---------
SELECT * FROM students ORDER BY age ASC;

----------- 7 ---------
SELECT * FROM students ORDER BY grade DESC;

----------- 8 ---------
SELECT COUNT(*) AS total_students FROM students;

----------- 9 ---------
SELECT MIN(age) AS youngest_students FROM students;

----------- 10 --------
SELECT MAX(grade) AS max_grade FROM students;

----------- 11 --------
SELECT SUM(grade) AS sum_grade FROM students;

----------- 12 --------
SELECT AVG(grade) AS average_grade FROM students;

----------  13 --------
SELECT * FROM students WHERE first_name LIKE 'A%';

---------- 14 ----------
SELECT * FROM students WHERE city = 'Toshkent' OR city = 'Andijon';
SELECT * FROM starts WHERE city IN ('Toshkent', 'Andijon');

---------- 15 ----------
SELECT * FROM students WHERE age BETWEEN 18 AND 20;
SELECT * FROM students WHERE age >= 18 AND age <= 20;

---------- 16 ----------
SELECT * FROM students WHERE NOT city = 'Toshkent';
SELECT * FROM student WHERE city != 'Toshkent';

---------- 17 ----------
SELECT * FROM students WHERE city = 'Toshkent' AND grade > 70;

--------- 18 -----------
SELECT * FROM students WHERE grade < 60 OR grade > 90;

--------- 20 -----------
SELECT * FROM students ORDER BY grade DESC LIMIT 3;





