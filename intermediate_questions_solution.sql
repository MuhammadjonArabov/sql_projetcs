/* 
1. Select students from Toshkent, sorted by grade in descending order.
2. Count students older than 19.
3. Find the lowest grade among students from Andijon.
4. Find the oldest age among students with grades above 80.
5. Calculate the average age of students from Namangan.
6. Calculate the sum of grades for students aged 20.
7. Select students whose last name ends with 'ov' or 'ova'.
8. Select students from Samarqand or Buxoro with grades above 50.
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