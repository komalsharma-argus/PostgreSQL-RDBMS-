--SAMPLE DATA INSERTION--

INSERT INTO departments(name, location) VALUES
('HR', 'Delhi'),
('IT', 'Bangalore'),
('Finance', 'Mumbai'),
('Marketing', 'Pune');

INSERT INTO projects(name, description) VALUES
('Apollo', 'ERP Development'),
('Titan', 'Mobile Application'),
('Mercury', 'Cloud Migration'),
('WebPanditJi', 'Website Development'),
('Phoenix', 'HR Portal');

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Raj','Sharma','Male','1998-05-10','9876543210',
'raj@gmail.com','Developer','2022-01-15',id
FROM departments WHERE name='IT';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Priya','Singh','Female','1999-08-20','9876543211',
'priya@gmail.com','HR Executive','2021-06-12',id
FROM departments WHERE name='HR';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Amit','Patel','Male','1995-11-01','9876543212',
'amit@gmail.com','Developer','2023-02-01',id
FROM departments WHERE name='IT';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Neha','Verma','Female','1997-01-18','9876543213',
'neha@gmail.com','Accountant','2020-09-15',id
FROM departments WHERE name='Finance';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Rohit','Das','Male','1994-02-15','9876543214',
'rohit@gmail.com','Developer','2024-03-11',id
FROM departments WHERE name='IT';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Kiran','Joshi','Female','1996-07-12','9876543215',
'kiran@gmail.com','HR Manager','2019-05-20',id
FROM departments WHERE name='HR';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Vikas','Mehta','Male','1988-09-30','9876543216',
'vikas@gmail.com','Project Manager','2018-02-18',id
FROM departments WHERE name='IT';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Anjali','Roy','Female','1993-03-17','9876543217',
'anjali@gmail.com','Marketing Executive','2022-08-08',id
FROM departments WHERE name='Marketing';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Suresh','Kumar','Male','1992-12-09','9876543218',
'suresh@gmail.com','Developer','2021-04-10',id
FROM departments WHERE name='IT';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Pooja','Nair','Female','1998-06-25','9876543219',
'pooja@gmail.com','HR Executive','2023-07-14',id
FROM departments WHERE name='HR';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Rakesh','Gupta','Male','1985-04-15','9876543220',
'rakesh@gmail.com','Finance Manager','2018-06-15',id
FROM departments WHERE name='Finance';

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,contact_number,email,job_profile,hire_date,department_id)
SELECT
'Sneha','Kapoor','Female','1989-09-12','9876543221',
'sneha@gmail.com','Marketing Manager','2019-03-20',id
FROM departments WHERE name='Marketing';

--Manager Assignment--
UPDATE employees 
SET manager_id = (
    SELECT id FROM employees WHERE first_name = 'Vikas'
) WHERE job_profile = 'Developer';

UPDATE employees
SET manager_id = (
    SELECT id FROM employees WHERE first_name = 'Kiran'
) WHERE job_profile = 'HR Executive';

UPDATE employees
SET manager_id = (
    SELECT id FROM employees WHERE first_name = 'Rakesh'
) WHERE job_profile = 'Accountant';

UPDATE employees
SET manager_id = (
    SELECT id FROM employees WHERE first_name = 'Sneha'
) WHERE job_profile = 'Marketing Executive';

--INSERTION INTO salaries--

INSERT INTO salaries (employee_id, salary, effective_date)
SELECT id,
       CASE job_profile
           WHEN 'Project Manager' THEN 120000
           WHEN 'HR Manager' THEN 95000
           WHEN 'Finance Manager' THEN 105000
           WHEN 'Marketing Manager' THEN 100000
           WHEN 'Developer' THEN 70000
           WHEN 'HR Executive' THEN 50000
           WHEN 'Accountant' THEN 60000
           WHEN 'Marketing Executive' THEN 55000
       END,
       '2025-01-01'
FROM employees;

--INSERTION IN employee_projects--
--CURRENT PROJECTS--

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date)
SELECT
    e.id,
    p.id,
    'current',
    '2025-01-10'
FROM employees e
JOIN projects p
ON p.name = 'Apollo'
WHERE e.first_name IN ('Vikas', 'Raj', 'Amit');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date)
SELECT
    e.id,
    p.id,
    'current',
    '2025-02-01'
FROM employees e
JOIN projects p
ON p.name = 'Neptune'
WHERE e.first_name IN ('Rohit', 'Rakesh', 'Neha');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date)
SELECT
    e.id,
    p.id,
    'current',
    '2025-03-01'
FROM employees e
JOIN projects p
ON p.name = 'Mercury'
WHERE e.first_name = 'Suresh';

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date)
SELECT
    e.id,
    p.id,
    'current',
    '2025-01-20'
FROM employees e
JOIN projects p
ON p.name = 'Phoenix'
WHERE e.first_name IN ('Kiran', 'Priya');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date)
SELECT
    e.id,
    p.id,
    'current',
    '2025-02-15'
FROM employees e
JOIN projects p
ON p.name = 'Titan'
WHERE e.first_name IN ('Sneha', 'Anjali');

--PAST PROJECTS--
INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date, completed_date)
SELECT
    e.id,
    p.id,
    'past',
    '2024-01-01',
    '2024-12-31'
FROM employees e
JOIN projects p
ON p.name = 'Apollo'
WHERE e.first_name IN ('Rohit', 'Rakesh', 'Anjali');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date, completed_date)
SELECT
    e.id,
    p.id,
    'past',
    '2024-02-01',
    '2024-11-30'
FROM employees e
JOIN projects p
ON p.name = 'Mercury'
WHERE e.first_name IN ('Vikas', 'Priya', 'Sneha');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date, completed_date)
SELECT
    e.id,
    p.id,
    'past',
    '2024-03-01',
    '2024-10-31'
FROM employees e
JOIN projects p
ON p.name = 'Neptune'
WHERE e.first_name = 'Amit';

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date, completed_date)
SELECT
    e.id,
    p.id,
    'past',
    '2024-04-01',
    '2024-09-30'
FROM employees e
JOIN projects p
ON p.name = 'Phoenix'
WHERE e.first_name IN ('Raj', 'Neha');

INSERT INTO employee_projects
(employee_id, project_id, project_type, assigned_date, completed_date)
SELECT
    e.id,
    p.id,
    'past',
    '2024-05-01',
    '2024-12-15'
FROM employees e
JOIN projects p
ON p.name = 'Titan'
WHERE e.first_name = 'Suresh';