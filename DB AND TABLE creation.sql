DROP DATABASE IF EXISTS employeedb;
CREATE DATABASE employeedb;
USE employeedb;

-- 1. FIRST TABLE : EMPLOYEES
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    dob DATE,
    hire_date DATE,
    dept_id INT
);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 'M', '1990-03-12', '2015-05-10', 101),
(2, 'Jane', 'Smith', 'F', '1985-07-25', '2012-08-21', 102),
(3, 'Michael', 'Brown', 'M', '1992-11-05', '2018-03-12', 101),
(4, 'Emily', 'Davis', 'F', '1995-02-17', '2020-01-10', 103),
(5, 'David', 'Wilson', 'M', '1988-06-23', '2010-09-30', 102),
(6, 'Olivia', 'Taylor', 'F', '1993-10-11', '2017-04-15', 104),
(7, 'James', 'Moore', 'M', '1991-12-19', '2014-11-20', 104),
(8, 'Sophia', 'Martin', 'F', '1989-04-03', '2016-06-05', 101),
(9, 'Chris', 'Lee', 'M', '1994-08-14', '2019-10-01', 103),
(10, 'Emma', 'Clark', 'F', '1990-01-30', '2013-02-18', 104);


-- 2. SECOND TABLE: departments
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'Engineering', 'New York'),
(102, 'Human Resources', 'Chicago'),
(103, 'Marketing', 'San Francisco'),
(104, 'Finance', 'Boston');

-- 3. THIRD TABLE: salaries
CREATE TABLE salaries (
    emp_id INT,
    month VARCHAR(10),
    salary INT,
    PRIMARY KEY (emp_id, month),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salaries VALUES
(1, 'Jan', 7000), (1, 'Feb', 7000), (1, 'Mar', 7100),
(2, 'Jan', 8500), (2, 'Feb', 8500), (2, 'Mar', 8500),
(3, 'Jan', 6200), (3, 'Feb', 6300), (3, 'Mar', 6300),
(4, 'Jan', 5800), (4, 'Feb', 5800), (4, 'Mar', 5800),
(5, 'Jan', 9000), (5, 'Feb', 9100), (5, 'Mar', 9100),
(6, 'Jan', 7500), (6, 'Feb', 7500), (6, 'Mar', 7600),
(7, 'Jan', 6500), (7, 'Feb', 6500), (7, 'Mar', 6500),
(8, 'Jan', 7200), (8, 'Feb', 7200), (8, 'Mar', 7200),
(9, 'Jan', 5000), (9, 'Feb', 5100), (9, 'Mar', 5100),
(10, 'Jan', 6700), (10, 'Feb', 6700), (10, 'Mar', 6700);

-- 4. FOURTH TABLE: performance_reviews
CREATE TABLE performance_reviews (
    emp_id INT,
    year INT,
    rating VARCHAR(2),
    feedback TEXT,
    PRIMARY KEY (emp_id, year),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO performance_reviews VALUES
(1, 2023, 'A', 'Excellent team player'),
(2, 2023, 'A-', 'Strong leadership'),
(3, 2023, 'B+', 'Consistent performer'),
(4, 2023, 'B', 'Good potential'),
(5, 2023, 'A', 'Strategic thinker'),
(6, 2023, 'A-', 'Very reliable'),
(7, 2023, 'B+', 'Solid work ethic'),
(8, 2023, 'B', 'Improved significantly'),
(9, 2023, 'C+', 'Needs improvement'),
(10, 2023, 'A-', 'Dedicated and consistent');

SHOW TABLES;





