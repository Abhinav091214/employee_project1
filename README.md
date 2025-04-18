# Employee Database SQL Project

## Overview
This project involves managing and analyzing an **Employee Database** using SQL. It includes four tables: `employees`, `departments`, `salaries`, and `performance reviews`. The goal is to practice and implement various SQL concepts like joins, aggregate functions, subqueries, and ranking functions, among others. The database contains dummy data and covers a range of business questions that can be solved using SQL queries.

## Database Schema

The database consists of the following four tables:

1. **Employees**
   - `emp_id` (INT) - Employee ID (Primary Key)
   - `first_name` (VARCHAR) - Employee's first name
   - `last_name` (VARCHAR) - Employee's last name
   - `dob` (DATE) - Employee's date of birth
   - `dept_id` (INT) - Department ID (Foreign Key referencing `departments`)

2. **Departments**
   - `dept_id` (INT) - Department ID (Primary Key)
   - `dept_name` (VARCHAR) - Name of the department

3. **Salaries**
   - `emp_id` (INT) - Employee ID (Foreign Key referencing `employees`)
   - `salary` (DECIMAL) - Salary amount
   - `month` (VARCHAR) - Month of salary record

4. **Performance Reviews**
   - `emp_id` (INT) - Employee ID (Foreign Key referencing `employees`)
   - `year` (INT) - Year
   - `rating` (VARCHAR(2)) - Rating of employee (A, A-, B, B+, C+)
   - `feedback` (TEXT) - General feedback regarding performance of employees

## Data Example
### Run the DB AND TABLE CREATION.sql file and the database along with tables will be created

## SQL Queries
Here are some SQL queries you can practice with this database: (ALL SQL queries can be found in the Queries.sql file along with solutions)

1. **List full names of all employees with department name.**

2. **Find average salary in February across all employees.**

3. **Count employees in each department.**

4. **List employees earning more than 8000 in any month.**

5. **What is the average salary of each department?**

6. **Show salary trend (Jan to Mar) for employee John Doe.**

7. **Which employee has the highest average salary over 3 months?**

8. **Find employees who have a rating of 'A' or 'A-'.**

9. **List employees born before 1990.**

10. **Count how many employees joined after 2015.**

11. **List departments that have employees with salary above 9000.**

12. **Show each department with number of employees and average salary.**

13. **Find employees who didn’t get a performance rating of 'B' or higher.**

14. **What is the average performance rating per department?** (use CASE WHEN)

15. **Show department-wise total salary paid in March.**

16. **Who has the lowest salary in Jan?**

17. **Which employees work in the same department as ‘Jane Smith’?**

18. **List employees whose salary increased from Jan to Mar.**

19. **Who has a consistent salary (same for all 3 months)?**

20. **Which department has the highest total salary payout?**

21. **Show employees with feedback containing the word "consistent".**

22. **Find departments without any employee born after 1990.**

23. **What’s the total number of unique salaries paid in March?**

24. **Create a view showing each employee's average 3-month salary.**

25. **Show top 3 earning employees based on March salary.**

26. **Show top 3 earning employees for each month.**

## How to Use

To use this project and run the SQL queries locally:

1. **Clone the repository** to your local machine:

    ```bash
    git clone https://github.com/Abhinav091214/employee_project1.git
    ```

2. **Set up the database** by running the provided SQL scripts to create tables and insert data.
3. **Execute the SQL queries** to analyze and extract useful insights from the data.

## Setup Instructions

1. Install a local SQL server or use a cloud service.
2. Run the SQL script to create and populate the database.
3. Once the database is set up, use your SQL client to run the queries.
