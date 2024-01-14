CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_firstname VARCHAR(255) NOT NULL,
    student_lastname VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    residency_status ENUM('PR', 'Citizen', 'International'),
    department_id INT,
    email VARCHAR(100) UNIQUE,
    enrollment_date DATE
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY ,
    department_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    professor_firstname VARCHAR(255) NOT NULL,
    professor_lastname VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    joining_date DATE,
    department_id INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    professor_id INT,
    semester ENUM('Spring', 'Autumn', 'Winter'),
    registration_date DATE
);

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    registration_id INT,
    grade DECIMAL(5, 2) CHECK (grade >= 0)
);

-- Foreign key and other constrain
ALTER TABLE Students
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id);

ALTER TABLE Professors
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id);

ALTER TABLE Registrations
ADD FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD FOREIGN KEY (course_id) REFERENCES Courses(course_id),
ADD FOREIGN KEY (professor_id) REFERENCES Professors(professor_id);

ALTER TABLE Grades
ADD FOREIGN KEY (registration_id) REFERENCES Registrations(registration_id);


-- Do we need to add this table?
-- this one could be included in Course table
CREATE TABLE TimeSlot (
    timeslot_id
    days
    start_time
    end_date
);

-- query：
- List all students enrolled in a specific department.
- Display the highest and lowest grades for each course.
- Find courses with a high registration count.
-- Retrieve a list of students and their enrolled courses.
-- Retrieve a count of students enrolled in each course.
-- Retrieve a list of courses with no enrolled students.
-- Retrieve students who have not enrolled in any course.
