--1. Fetch all details of employees.

SELECT * FROM employees;

-- 2. Get names and job profiles of all employees.

SELECT first_name, last_name, job_profile FROM employees;

-- 3. Retrieve names of all employees in the 'HR' department.

SELECT first_name, last_name FROM employees 
WHERE department_id = (SELECT id FROM departments WHERE name = 'HR');

-- 4. List employees hired after 2021.

SELECT * FROM employees
WHERE hire_date > '2021-12-31';

-- 5. Get contact number and email of an employee named 'Raj'.

SELECT contact_number, email FROM employees WHERE first_name = 'Raj';

-- 6. Show employees whose job title is 'Developer'.

SELECT * FROM employees WHERE job_title = 'Developer';

-- 7. List all employees born before the year 2000.

SELECT * FROM employees WHERE date_of_birth < '2000-01-01';

-- 8. Fetch the department name for each employee.

SELECT e.id, e.first_name, e.last_name, d.name 
FROM employees e
INNER JOIN departments d ON (e.department_id = d.id);

-- 9. List all employees working on a project named 'Apollo'.

SELECT e.first_name, e.last_name FROM employees e
INNER JOIN employee_projects ep ON (e.id = ep.employee_id)
INNER JOIN projects p ON (ep.project_id = p.id) 
WHERE p.name = 'Apollo' AND ep.project_type = 'current';

-- 10. Get names of employees who don’t have a manager assigned.

SELECT first_name,last_name FROM employees
WHERE manager_id IS NULL;

-- 11. Retrieve names of employees who are working on more than one project.

SELECT e.first_name, e.last_name FROM employees e
INNER JOIN employee_projects ep
ON e.id = ep.employee_id
GROUP BY e.id, e.first_name, e.last_name
HAVING COUNT(DISTINCT ep.project_id) > 1;

-- 12. Get the name and salary of all employees.

SELECT e.first_name, e.last_name, s.salary FROM employees e
INNER JOIN salaries s ON (e.id = s. employee_id);

-- 13. Show employees hired in the month of January (any year).

SELECT first_name, last_name,hire_date FROM employees 
WHERE EXTRACT(MONTH FROM hire_date) = 1;

-- 14. Find employees who have not been assigned to any project.

SELECT e.first_name, e.last_name FROM employees e 
LEFT JOIN employee_projects ep ON (e.id = ep.employee_id)
WHERE ep.employee_id IS NULL;

-- 15. List all employees and their current project names.

SELECT e.first_name, e.last_name, p.name AS current_project 
FROM employees e
INNER JOIN employee_projects ep ON (e.id = ep.employee_id)
INNER JOIN projects p ON (p.id = ep.project_id)
ORDER BY e.first_name;
