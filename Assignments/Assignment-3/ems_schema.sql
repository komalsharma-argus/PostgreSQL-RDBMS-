CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE gender AS ENUM(
    'Male', 'Female', 'Others'
);

CREATE TYPE project_type AS ENUM(
    'current', 'past'
);

CREATE TABLE departments(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	name VARCHAR(20) UNIQUE NOT NULL,
	location VARCHAR(50)
);

CREATE TABLE employees(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender gender NOT NULL,
	date_of_birth DATE NOT NULL,
	contact_number VARCHAR(15) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	job_profile VARCHAR(100),
	hire_date DATE NOT NULL,
	department_id UUID NOT NULL,
	manager_id UUID,

	FOREIGN KEY(department_id) REFERENCES departments(id),
	FOREIGN KEY(manager_id) REFERENCES employees(id)
);

CREATE TABLE projects(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	name VARCHAR(100) UNIQUE NOT NULL,
	description TEXT
);

CREATE TABLE employee_projects(
    employee_id UUID NOT NULL,
	project_id UUID,
	project_type project_type NOT NULL,
	assigned_date DATE NOT NULL,
    completed_date DATE,

	PRIMARY KEY(employee_id, project_id,project_type),

	FOREIGN KEY(employee_id) REFERENCES employees(id),
	FOREIGN KEY(project_id) REFERENCES projects(id)
);

CREATE TABLE salaries(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	employee_id UUID NOT NULL,
	salary NUMERIC(10,2) NOT NULL,
	effective_date DATE NOT NULL,

	FOREIGN KEY(employee_id) REFERENCES employees(id)
);
