# JAC-Database-Project

Data Tables: 
Students, Professors, Courses, Departments, Registrations, Enrollments(Grade),Semesters. 


![Entity-Relation Diagram](https://raw.githubusercontent.com/vcfmtl2077/JAC-Database-Project/main/ERD.png)

## Students Data Scenarios

List all information related with students.

- List all students info in a specific department.
``` 
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    s.date_of_birth,
    s.email,
    d.department_name
FROM
    UMS.Students s
    JOIN UMS.Enrollments e ON s.student_id = e.student_id
    JOIN UMS.Departments d ON e.department_id = d.department_id
WHERE
    e.department_id = 1;
  ```
- List total number of enrolled students for each department.
``` 
SELECT
    d.department_name,
    COUNT(e.student_id)
FROM
    UMS.Enrollments e
    JOIN UMS.Departments d ON e.department_id = d.department_id
GROUP by
    e.department_id;
  ```  
- List a specific student and his enrollment info.
``` 
SELECT
    *
FROM
    Students s
    JOIN UMS.Enrollments e ON s.student_id = e.student_id
WHERE
    s.student_id = 2;
  ```  

- List a specific student and his course registration info.
```
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    c.credit,
    c.hours,
    se.`year`,
    se.semester
FROM
    Students s
    JOIN UMS.Registrations r ON s.student_id = r.student_id
    JOIN UMS.Courses c ON r.course_id = c.course_id
    JOIN UMS.Semesters se ON se.semester_id = r.semester_id
WHERE
    s.student_id = 2;
```

- List a specific student and his total registered course credit info.
```
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    SUM(c.credit),
    SUM(c.hours)
FROM
    Students s
    JOIN UMS.Registrations r ON s.student_id = r.student_id
    JOIN UMS.Courses c ON r.course_id = c.course_id
WHERE
    s.student_id = 2;
```

## Professors Data Scenarios
List all information related with professors.

- List all professors info in a specific department.
```
SELECT
    p.professor_id,
    p.first_name,
    p.last_name,
    p.email,
    p.date_of_birth,
    d.department_name
FROM
    UMS.Professors p
    JOIN UMS.Departments d ON p.department_id = d.department_id
WHERE
    p.department_id = 3;
```

- List total professor number of each department.
```
SELECT
    d.department_name,
    COUNT(p.professor_id)
FROM
    UMS.Professors p
    JOIN UMS.Departments d ON p.department_id = d.department_id
GROUP BY
    p.department_id;
```
- List a specific professor and his courses info.
```
SELECT
    p.professor_id,
    p.first_name,
    p.last_name,
    p.email,
    c.course_name,
    c.credit,
    c.hours
FROM
    UMS.Professors p
    JOIN UMS.Courses c ON p.professor_id = c.professor_id
WHERE
    p.professor_id = 3;
```
- List a specific professor and his total courses hours info.
```
SELECT
    p.professor_id,
    p.first_name,
    p.last_name,
    p.email,
    SUM(c.credit),
    SUM(c.hours)
FROM
    UMS.Professors p
    JOIN UMS.Courses c ON p.professor_id = c.professor_id
WHERE
    p.professor_id = 3;
```

## Courses & Grades Data Scenarios
List all information related with courses and grades.

- List highest and lowest grade of each course.
```
SELECT
    c.course_name,
    MIN(e.grade),
    MAX(e.grade)
FROM
    UMS.Registrations r
    JOIN UMS.Courses c ON c.course_id = r.course_id
    JOIN UMS.Enrollments e ON e.student_id = r.student_id
GROUP BY
    r.course_id;
```
- Find course with its total registration count.
```
SELECT
    c.course_name,
    COUNT(r.student_id)
FROM
    UMS.Registrations r
    JOIN UMS.Courses c ON c.course_id = r.course_id
    JOIN UMS.Enrollments e ON e.student_id = r.student_id
GROUP BY
    r.course_id;
```
- Find course with its total registration count for each department.
```
SELECT
    d.department_name,
    c.course_name,
    COUNT(r.registration_id)
FROM
    UMS.Courses c
    JOIN UMS.Professors p ON p.professor_id = c.professor_id
    JOIN UMS.Departments d ON d.department_id = c.professor_id
    JOIN UMS.Registrations r ON r.course_id = c.course_id
GROUP BY
    d.department_id,
    c.course_name;
```
- List total student registration count by grade for each course group each department.
```
SELECT
    d.department_name,
    c.course_name,
    p.first_name,
    p.last_name ,
    COUNT(r.registration_id),
    e.grade
FROM
    UMS.Courses c
    JOIN UMS.Professors p ON p.professor_id = c.course_id
    JOIN UMS.Departments d ON d.department_id = p.department_id
    JOIN UMS.Registrations r ON r.course_id = c.course_id
    JOIN UMS.Enrollments e ON e.student_id = r.student_id
GROUP BY
    d.department_id,
    c.course_id,
    e.grade;
```

## Security Measures
Associated with the application are developer and administrator accounts that create and maintain the application.

Developers need full access to the database. Some users only need read permissions, and some users need read/write permissions.

To clearly distinguish a role's permissions, create the role as the name of the required permission set. User accounts can easily be granted the required permissions by authorizing the appropriate roles.

To create a role, use CREATE ROLE, then to assign permissions to a role, use the same syntax as assigning permissions to a user:

```
-- create roles
CREATE ROLE 'app_developer', 'app_read', 'app_write';

-- grant privilege to role
GRANT ALL ON UMS.* TO 'app_developer';  
GRANT SELECT ON UMS.* TO 'app_read';  
GRANT INSERT, UPDATE, DELETE ON UMS.* TO 'app_write';

-- create users and grant privilege to users
CREATE USER 'dev1'@'localhost' IDENTIFIED BY 'dev1pass';  
CREATE USER 'read_user1'@'localhost' IDENTIFIED BY 'read_user1pass';  
CREATE USER 'read_user2'@'localhost' IDENTIFIED BY 'read_user2pass';  
CREATE USER 'rw_user1'@'localhost' IDENTIFIED BY 'rw_user1pass';

GRANT 'app_developer' TO 'dev1'@'localhost';  
GRANT 'app_read' TO 'read_user1'@'localhost', 'read_user2'@'localhost';  
GRANT 'app_read', 'app_write' TO 'rw_user1'@'localhost';

```


