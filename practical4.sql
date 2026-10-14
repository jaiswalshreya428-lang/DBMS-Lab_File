-- Create Database
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Create Project Table
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Budget DECIMAL(12,2)
);

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2),
    DeptID INT,
    ProjectID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

-- Insert Department Records
INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert Project Records
INSERT INTO Project VALUES
(101, 'Website Development', 500000),
(102, 'Mobile Application', 400000),
(103, 'Payroll System', 300000),
(104, 'Data Analysis', 250000),
(105, 'Cloud Migration', 600000),
(106, 'Recruitment Portal', 200000),
(107, 'Sales Automation', 350000),
(108, 'Cyber Security', 450000);

-- Insert 30 Employee Records
INSERT INTO Employee VALUES
(1, 'Aarav', 45000, 1, 101),
(2, 'Vivaan', 55000, 1, 102),
(3, 'Aditya', 60000, 1, 105),
(4, 'Arjun', 50000, 1, 108),
(5, 'Reyansh', 40000, 1, 104),
(6, 'Ananya', 35000, 2, 106),
(7, 'Diya', 42000, 2, 106),
(8, 'Ishita', 38000, 2, 103),
(9, 'Myra', 45000, 2, 106),
(10, 'Saanvi', 40000, 2, 103),
(11, 'Rohan', 50000, 3, 103),
(12, 'Rahul', 65000, 3, 104),
(13, 'Karan', 55000, 3, 103),
(14, 'Priya', 60000, 3, 104),
(15, 'Sneha', 48000, 3, 103),
(16, 'Ishaan', 40000, 4, 101),
(17, 'Kavya', 45000, 4, 107),
(18, 'Meera', 50000, 4, 101),
(19, 'Aditi', 42000, 4, 107),
(20, 'Riya', 48000, 4, 104),
(21, 'Kabir', 35000, 5, 107),
(22, 'Yash', 40000, 5, 107),
(23, 'Manav', 45000, 5, 101),
(24, 'Tanvi', 38000, 5, 107),
(25, 'Nisha', 42000, 5, 102),
(26, 'Dev', 70000, 1, 105),
(27, 'Pooja', 52000, 2, 106),
(28, 'Aman', 58000, 3, 108),
(29, 'Simran', 47000, 4, 102),
(30, 'Varun', 39000, 5, 108);

-- Display All Records
SELECT * FROM Department;
SELECT * FROM Project;
SELECT * FROM Employee;


-- 1. Selection
SELECT * FROM Employee
WHERE Salary > 50000;


-- 2. Projection
SELECT EmpName, Salary
FROM Employee;


-- 3. Aggregate Functions
SELECT COUNT(*) AS TotalEmployees,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary,
       MIN(Salary) AS MinimumSalary,
       MAX(Salary) AS MaximumSalary
FROM Employee;


-- 4. GROUP BY
SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID;


-- 5. HAVING
SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY DeptID
HAVING COUNT(*) > 5;


-- 6. CASE Expression
SELECT EmpName, Salary,
CASE
    WHEN Salary >= 60000 THEN 'High'
    WHEN Salary >= 40000 THEN 'Medium'
    ELSE 'Low'
END AS SalaryCategory
FROM Employee;


-- 7. ORDER BY
SELECT EmpName, Salary
FROM Employee
ORDER BY Salary DESC;


-- 8. EXCEPT
-- Employees in Dept 1 except those earning above 50000
SELECT EmpID FROM Employee
WHERE DeptID = 1
EXCEPT
SELECT EmpID FROM Employee
WHERE Salary > 50000;


-- 9. INTERSECT
-- Employees in Dept 1 who earn above 50000
SELECT EmpID FROM Employee
WHERE DeptID = 1
INTERSECT
SELECT EmpID FROM Employee
WHERE Salary > 50000;


-- 10. INNER JOIN
SELECT E.EmpName, D.DeptName
FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID;


-- 11. LEFT JOIN
SELECT D.DeptName, E.EmpName
FROM Department D
LEFT JOIN Employee E
ON D.DeptID = E.DeptID;


-- 12. SELF JOIN
-- Employees working in the same department
SELECT E1.EmpName AS Employee1,
       E2.EmpName AS Employee2,
       E1.DeptID
FROM Employee E1
JOIN Employee E2
ON E1.DeptID = E2.DeptID
AND E1.EmpID < E2.EmpID;


-- 13. THREE-WAY JOIN
-- Display employee, department and project details
SELECT E.EmpName, D.DeptName, P.ProjectName
FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID
INNER JOIN Project P
ON E.ProjectID = P.ProjectID;


-- 14. CORRELATED SUBQUERY
-- Employees earning more than their department average
SELECT E.EmpName, E.Salary, E.DeptID
FROM Employee E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employee E2
    WHERE E2.DeptID = E.DeptID
);

