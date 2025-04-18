USE employeedb;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM performance_reviews;

-- Questions:
-- 1. List full names of all employees with department name.
SELECT CONCAT(e.first_name,' ',e.last_name) AS full_name,d.dept_name 
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 2. Find average salary in February across all employees.
SELECT ROUND(AVG(salary),2) AS avg_feb
FROM salaries
WHERE month = 'Feb';

-- 3. Count employees in each department.
SELECT d.dept_name,d.dept_id,count(*) AS num_employees
	FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    GROUP BY d.dept_name,d.dept_id
    ORDER BY num_employees DESC;
    
-- 4. List employees earning more than 8000 in any month.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.month,s.salary
	FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    WHERE salary > 8000;
    
-- 5. What is the average salary of each department?
SELECT d.dept_name, ROUND(AVG(s.salary),2) AS avg_salary
	FROM employees e
    JOIN salaries s ON e.emp_id=s.emp_id
    JOIN departments d ON e.dept_id = d.dept_id
    GROUP BY d.dept_name
    ORDER BY avg_salary DESC;

-- 6. Show salary trend (Jan to Mar) for employee John Doe
SELECT s.month,s.salary
	FROM employees e
	JOIN salaries s ON e.emp_id = s.emp_id
	WHERE CONCAT(e.first_name,' ',e.last_name) = 'John Doe'
	ORDER BY s.month ASC;
    
-- 7. Which employee has the highest average salary over 3 months?
SELECT full_name, avg_salary
FROM (
    SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, AVG(s.salary) AS avg_salary
    FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    GROUP BY e.emp_id, e.first_name, e.last_name
) AS avg_salaries
ORDER BY avg_salary DESC
LIMIT 1;

-- 8. Find employees who have a rating of 'A' or 'A-'.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, p.rating AS performance
FROM employees e
JOIN performance_reviews p ON e.emp_id = p.emp_id
WHERE p.rating IN ('A', 'A-');

-- 9. List employees born before 1990.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,e.dob
FROM employees e
WHERE YEAR(dob) < 1990
ORDER BY e.dob ASC;

-- 10. Count how many employees joined after 2015.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, e.hire_date
FROM employees e
WHERE YEAR(e.hire_date) > 2015
ORDER BY e.hire_date ASC;

-- 11. List departments that have employees with salary above 9000.
SELECT DISTINCT d.dept_name
	FROM employees e
	JOIN salaries s ON e.emp_id = s.emp_id
	JOIN departments d ON e.dept_id = d.dept_id
	WHERE s.salary > 9000;

-- 12. Show each department with number of employees and average salary
SELECT 
    d.dept_name, 
    COUNT(DISTINCT e.emp_id) AS num_employees, 
    AVG(s.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

-- 13. Find employees who didn’t get a performance rating of 'B' or higher.
SELECT CONCAT(e.first_name, ' ',e.last_name) AS full_name,p.rating
	FROM employees e
    JOIN performance_reviews p ON e.emp_id = p.emp_id
    WHERE p.rating NOT IN ('A','A-','B+');
    
-- 14. What is the average performance rating per department? (use CASE WHEN)
SELECT 
    d.dept_name,
    AVG(
        CASE p.rating
            WHEN 'A' THEN 5
            WHEN 'A-' THEN 4.5
            WHEN 'B' THEN 4
            WHEN 'C' THEN 3
            WHEN 'D' THEN 2
            WHEN 'F' THEN 1
            ELSE NULL
        END
    ) AS avg_rating
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN performance_reviews p ON e.emp_id = p.emp_id
GROUP BY d.dept_name;

-- 15. Show department-wise total salary paid in March.
SELECT d.dept_name,SUM(s.salary) AS sum_march
	FROM departments d
    JOIN employees e ON d.dept_id = e.dept_id
    JOIN salaries s ON e.emp_id = s.emp_id
    WHERE s.month = 'Mar'
    GROUP BY d.dept_name
    ORDER BY sum_march DESC;
    
-- 16. Who has the lowest salary in Jan?
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    s.salary,
    s.month
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.salary = (
    SELECT MIN(s2.salary)
    FROM salaries s2
    WHERE s2.month = 'Jan'
);

-- 17. Which employees work in the same department as ‘Jane Smith’?
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = (
    SELECT d2.dept_name
    FROM employees e2
    JOIN departments d2 ON e2.dept_id = d2.dept_id
    WHERE CONCAT(e2.first_name, ' ', e2.last_name) = 'Jane Smith'
);

-- 18. List employees whose salary increased from Jan to Mar.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    jan.salary AS jan_salary,
    mar.salary AS mar_salary
FROM employees e
JOIN salaries jan ON e.emp_id = jan.emp_id AND jan.month = 'Jan'
JOIN salaries mar ON e.emp_id = mar.emp_id AND mar.month = 'Mar'
WHERE mar.salary > jan.salary;

-- 19 . Who has a consistent salary (same for all 3 months)?
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    jan.salary AS jan_salary,
    feb.salary AS feb_salary,
    mar.salary AS mar_salary
FROM employees e
JOIN salaries jan ON e.emp_id = jan.emp_id AND jan.month = 'Jan'
JOIN salaries feb ON e.emp_id = feb.emp_id AND feb.month = 'Feb'
JOIN salaries mar ON e.emp_id = mar.emp_id AND mar.month = 'Mar'
WHERE jan.salary = feb.salary 
  AND feb.salary = mar.salary;


-- 20. Which department has the highest total salary payout?
SELECT d.dept_name,SUM(s.salary) AS tot_salary
	FROM departments d
    JOIN employees e ON e.dept_id = d.dept_id
    JOIN salaries s ON e.emp_id = s.emp_id
    GROUP BY d.dept_name
    ORDER BY tot_salary DESC
    LIMIT 1;
    
-- 21. Show employees with feedback containing the word "consistent".
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name,p.feedback
FROM performance_reviews p
JOIN employees e ON p.emp_id = e.emp_id
WHERE p.feedback LIKE '%Consistent%';

-- 22. Find departments without any employee born after 1990.
SELECT dept_name
FROM departments
WHERE dept_id NOT IN (
    SELECT DISTINCT dept_id
    FROM employees
    WHERE YEAR(dob) >= 1990
);

-- 23. What’s the total number of unique salaries paid in March?

SELECT COUNT(DISTINCT salary) AS unique_salaries
FROM salaries
WHERE month = 'Mar';

-- 24. Create a view showing each employee's average 3-month salary.
-- 24. Create a view showing each employee's average 3-month salary
CREATE VIEW employee_avg_salary AS
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    ROUND(AVG(s.salary), 2) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY CONCAT(e.first_name, ' ', e.last_name);
SELECT * FROM employee_avg_salary;

-- 25. Show top 3 earning employees based on March salary

SELECT CONCAT(e.first_name, ' ',e.last_name) AS full_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.month = 'Mar'
ORDER BY s.salary DESC
LIMIT 3;

-- 26. Show top 3 earning employees for each month
SELECT 
    rs.month,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    rs.salary
FROM (
    SELECT 
        emp_id,
        month,
        salary,
        RANK() OVER (PARTITION BY month ORDER BY salary DESC) AS salary_rank
    FROM salaries
) rs
JOIN employees e ON e.emp_id = rs.emp_id
WHERE rs.salary_rank <= 3
ORDER BY rs.month, rs.salary_rank;

