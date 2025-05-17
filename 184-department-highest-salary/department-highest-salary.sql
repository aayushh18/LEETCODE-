-- Write your PostgreSQL query statement below
WITH
EmployeesWithSalaryInDepartment As(
    Select 
    Department.name AS department ,
    Employee.name AS employee,
    Employee.salary,
    MAX(Employee.salary) OVER (
        PARTITION BY Employee.departmentId
    ) AS max_salary
    FROM Employee
    LEFT JOIN Department
    ON (Employee.departmentId = Department.id)
)
select
department AS Department,
employee AS Employee,
salary AS Salary
FROM EmployeesWithSalaryInDepartment
WHERE salary=max_salary;