CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    gpa NUMERIC(3,2) CHECK (gpa >= 0 AND gpa <= 4),
    department_id INT REFERENCES departments(department_id)
);
