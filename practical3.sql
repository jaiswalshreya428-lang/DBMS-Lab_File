-- EXPERIMENT 3
-- Employee–Department–Project Database

-- 1. Use the database provided by the execution environment

-- 2. Create Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- 3. Create Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- 4. Create Project Table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(12,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- 5. Insert Departments
INSERT INTO Department VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Bangalore');

-- 6. Insert Projects
INSERT INTO Project VALUES
(101, 'Cloud Migration', 800000, 1),
(102, 'AI Platform', 1200000, 1),
(103, 'Cyber Security', 950000, 1),
(104, 'Employee Portal', 500000, 2),
(105, 'Recruitment System', 650000, 2),
(106, 'Payroll System', 700000, 2),
(107, 'Financial Analytics', 1000000, 3),
(108, 'Budget Management', 750000, 3);

-- 7. Insert 30 Employees
INSERT INTO Employee VALUES
(1, 'Aarav', 55000, '2022-01-10', 1),
(2, 'Ananya', 62000, '2021-03-15', 1),
(3, 'Rahul', 48000, '2023-05-20', 1),
(4, 'Priya', 70000, '2020-07-11', 1),
(5, 'Rohan', 58000, '2022-09-05', 1),
(6, 'Sneha', 75000, '2019-11-21', 1),
(7, 'Aditya', 52000, '2023-01-18', 1),
(8, 'Kavya', 68000, '2021-12-01', 1),
(9, 'Arjun', 61000, '2022-06-14', 1),
(10, 'Neha', 59000, '2023-03-25', 1),

(11, 'Simran', 45000, '2022-02-12', 2),
(12, 'Pooja', 52000, '2021-05-17', 2),
(13, 'Karan', 48000, '2023-08-10', 2),
(14, 'Megha', 60000, '2020-10-19', 2),
(15, 'Nisha', 55000, '2022-11-08', 2),
(16, 'Vikas', 63000, '2019-04-15', 2),
(17, 'Tanya', 49000, '2023-02-20', 2),
(18, 'Manish', 57000, '2021-09-13', 2),
(19, 'Riya', 51000, '2022-12-05', 2),
(20, 'Amit', 65000, '2020-06-30', 2),

(21, 'Vivek', 72000, '2021-01-22', 3),
(22, 'Isha', 68000, '2022-04-18', 3),
(23, 'Ravi', 59000, '2023-07-09', 3),
(24, 'Shreya', 76000, '2019-08-16', 3),
(25, 'Mohit', 64000, '2021-11-27', 3),
(26, 'Divya', 70000, '2020-03-12', 3),
(27, 'Varun', 58000, '2023-06-21', 3),
(28, 'Ayesha', 62000, '2022-10-10', 3),
(29, 'Sahil', 67000, '2021-07-05', 3),
(30, 'Komal', 54000, '2023-09-14', 3);

-- 8. Selection
SELECT *
FROM Employee
WHERE salary > 60000;

-- 9. Projection
SELECT emp_name, salary
FROM Employee;

-- 10. Sorting using ORDER BY
SELECT emp_name, salary
FROM Employee
ORDER BY salary DESC;

-- 11. Aggregate Functions
SELECT 
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employee;

-- 12. GROUP BY
SELECT dept_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id;

-- 13. GROUP BY with Average
SELECT dept_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY dept_id;

-- 14. HAVING
SELECT dept_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 9;

-- 15. CASE Expression
SELECT 
    emp_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 55000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM Employee;

-- 16. Employee with Department Name
SELECT 
    e.emp_name,
    d.dept_name,
    e.salary
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id;

-- 17. Departments with Average Salary Greater Than 60000
SELECT 
    dept_id,
    AVG(salary) AS average_salary
FROM Employee
GROUP BY dept_id
HAVING AVG(salary) > 60000;

-- 18. Projects Sorted by Budget
SELECT project_name, budget
FROM Project
ORDER BY budget DESC;

