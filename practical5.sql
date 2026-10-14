USE CompanyDB;

-- Add manager ID (run only once)
ALTER TABLE Employee
ADD ManagerID INT NULL;


-- Set reporting relationships
UPDATE Employee SET ManagerID = NULL WHERE EmpID = 1;

UPDATE Employee SET ManagerID = 1
WHERE EmpID IN (2, 3, 4, 5);

UPDATE Employee SET ManagerID = 2
WHERE EmpID IN (6, 7, 8, 9, 10);

UPDATE Employee SET ManagerID = 3
WHERE EmpID IN (11, 12, 13, 14, 15);

UPDATE Employee SET ManagerID = 4
WHERE EmpID IN (16, 17, 18, 19, 20);

UPDATE Employee SET ManagerID = 5
WHERE EmpID IN (21, 22, 23, 24, 25);

UPDATE Employee SET ManagerID = 1
WHERE EmpID IN (26, 27, 28, 29, 30);


-- 1. Department Salary Summary View
CREATE VIEW DeptSalarySummary AS
SELECT D.DeptName,
       COUNT(E.EmpID) AS TotalEmployees,
       SUM(E.Salary) AS TotalSalary,
       AVG(E.Salary) AS AverageSalary
FROM Department D
JOIN Employee E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;

SELECT * FROM DeptSalarySummary;


-- 2. Employee Hierarchy View
CREATE VIEW EmployeeHierarchy AS
SELECT E.EmpName AS Employee,
       M.EmpName AS Manager
FROM Employee E
LEFT JOIN Employee M
ON E.ManagerID = M.EmpID;

SELECT * FROM EmployeeHierarchy;


-- 3. Test View Updatability
CREATE VIEW EmployeeView AS
SELECT EmpID, EmpName, Salary
FROM Employee;

SELECT * FROM EmployeeView;

UPDATE EmployeeView
SET Salary = 46000
WHERE EmpID = 1;

SELECT * FROM EmployeeView
WHERE EmpID = 1;


-- 4. Recursive CTE for Reporting Chains
WITH RECURSIVE ReportingChain AS (
    SELECT EmpID, EmpName, ManagerID, 1 AS Level
    FROM Employee
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT E.EmpID, E.EmpName, E.ManagerID,
           R.Level + 1
    FROM Employee E
    JOIN ReportingChain R
    ON E.ManagerID = R.EmpID
)
SELECT EmpName, ManagerID, Level
FROM ReportingChain
ORDER BY Level, EmpID;


-- 5. Test Summary View Updatability
-- This command is expected to fail
UPDATE DeptSalarySummary
SET AverageSalary = 50000
WHERE DeptName = 'IT';