CREATE DATABASE srms;
USE srms;

-- Student Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(20),
    full_name VARCHAR(100),
    date_of_birth DATE,
    email VARCHAR(100),
    program VARCHAR(50),
    semester VARCHAR(10)
);

-- Course Table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT,
    department VARCHAR(100)
);

-- Subject Table
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100),
    course_id INT,
    full_marks INT,
    pass_marks INT,
    credit INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Exam Table
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_name VARCHAR(100),
    exam_date DATE,
    session VARCHAR(20),
    semester VARCHAR(10)
);

-- Result Table
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_id INT,
    marks_obtained INT,
    grade VARCHAR(2),
    gpa_point DECIMAL(3,2),
    status VARCHAR(10),
    published_on DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

-- User Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(255),
    role VARCHAR(20),
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Grade Logic (Optional View)
CREATE VIEW result_summary AS
SELECT 
    s.full_name,
    sub.subject_name,
    r.marks_obtained,
    r.grade,
    r.gpa_point,
    r.status
FROM results r
JOIN students s ON r.student_id = s.student_id
JOIN subjects sub ON r.subject_id = sub.subject_id;
