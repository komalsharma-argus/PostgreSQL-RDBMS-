-- CREATE TABLE student_courses (
--     student_id INT,
--     student_name VARCHAR(100),
--     student_email VARCHAR(100),
--     student_phone VARCHAR(15),
--     course_id INT,
--     course_name VARCHAR(100),
--     instructor_name VARCHAR(100),
--     instructor_email VARCHAR(100),
--     enrollment_date DATE,
--     grade VARCHAR(2)
-- );

CREATE TABLE students(
    id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR(15)
);

CREATE TABLE instructors(
    id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE courses(
    id INTEGER PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	instructor_id INTEGER NOT NULL,
	FOREIGN KEY(instructor_id) REFERENCES instructors(id)
);

CREATE TABLE enrollments(
    student_id INTEGER,
	course_id INTEGER,
	enrollment_date DATE,
	grade VARCHAR(2),

	PRIMARY KEY(student_id, course_id),

	FOREIGN KEY(student_id) REFERENCES students(id),
	FOREIGN KEY(course_id) REFERENCES courses(id)
);


-- INSERT INTO student_courses VALUES
-- (1, 'John Doe', 'john@email.com', '555-0101', 101, 'Math 101', 'Dr. Smith', 'smith@college.edu', '2024-01-15', 'A'),
-- (1, 'John Doe', 'john@email.com', '555-0101', 102, 'Physics 101', 'Dr. Johnson', 'johnson@college.edu', '2024-01-15', 'B'),
-- (2, 'Jane Smith', 'jane@email.com', '555-0102', 101, 'Math 101', 'Dr. Smith', 'smith@college.edu', '2024-01-16', 'A'),
-- (2, 'Jane Smith', 'jane@email.com', '555-0102', 103, 'Chemistry', 'Dr. Brown', 'brown@college.edu', '2024-01-16', 'B+'),
-- (3, 'Bob Wilson', 'bob@email.com', '555-0103', 102, 'Physics 101', 'Dr. Johnson', 'johnson@college.edu', '2024-01-17', 'C'),
-- (4, 'Alice Green', 'alice@email.com', '555-0104', 101, 'Math 101', 'Dr. Smith', 'smith@college.edu', '2024-01-18', 'A-'),
-- (4, 'Alice Green', 'alice@email.com', '555-0104', 104, 'History 101', 'Dr. White', 'white@college.edu', '2024-01-18', 'B'),
-- (5, 'Mike Brown', 'mike@email.com', '555-0105', 103, 'Chemistry', 'Dr. Brown', 'brown@college.edu', '2024-01-19', 'B+'),
-- (5, 'Mike Brown', 'mike@email.com', '555-0105', 104, 'History 101', 'Dr. White', 'white@college.edu', '2024-01-19', 'A');

INSERT INTO students(id, name, email, phone) VALUES
(1, 'John Doe','john@email.com', '555-0101'),
(2, 'Jane Smith', 'jane@email.com', '555-0102'),
(3, 'Bob Wilson', 'bob@email.com', '555-0103'),
(4, 'Alice Green', 'alice@email.com', '555-0104'),
(5, 'Mike Brown', 'mike@email.com', '555-0105');

INSERT INTO instructors(id, name, email) VALUES
(1, 'Dr. Smith', 'smith@college.edu'),
(2, 'Dr. Johnson', 'johnson@college.edu'),
(3, 'Dr. Brown', 'brown@college.edu'),
(4, 'Dr. White', 'white@college.edu');

INSERT INTO courses(id, name, instructor_id) VALUES
(101, 'Math 101', 1),
(102, 'Physics 101', 2),
(103, 'Chemistry', 3),
(104, 'History 101', 4);

INSERT INTO enrollments(student_id, course_id, enrollment_date, grade) VALUES
(1,101,'2024-01-15','A'),
(1,102,'2024-01-15','B'),
(2,101,'2024-01-16','A'),
(2,103,'2024-01-16','B+'),
(3,102,'2024-01-17','C'),
(4,101,'2024-01-18','A-'),
(4,104,'2024-01-18','B'),
(5,103,'2024-01-19','B+'),
(5,104,'2024-01-19','A');

-- SELECT query with JOINs: Write a JOIN query to recreate the original denormalized view

SELECT s.id, s.name, s.email, s.phone, c.id, c.name, i.name, i.email, e.enrollment_date, e.grade 
FROM students s
INNER JOIN enrollments e ON (s.id = e.student_id)
INNER JOIN courses c ON (e.course_id = c.id)
INNER JOIN instructors i ON (c.instructor_id = i.id);
