/***/
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

/***/
SELECT
    d.department_name,
    COUNT(e.student_id)
FROM
    UMS.Enrollments e
    JOIN UMS.Departments d ON e.department_id = d.department_id
GROUP by
    e.department_id;

/***/
SELECT
    *
FROM
    Students s
    JOIN UMS.Enrollments e ON s.student_id = e.student_id
WHERE
    s.student_id = 2;

/***/
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

/***/
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

/***/
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

/***/
SELECT
    d.department_name,
    COUNT(p.professor_id)
FROM
    UMS.Professors p
    JOIN UMS.Departments d ON p.department_id = d.department_id
GROUP BY
    p.department_id;

/***/
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

/***/
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

/***/
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

/***/
SELECT
    c.course_name,
    COUNT(r.student_id)
FROM
    UMS.Registrations r
    JOIN UMS.Courses c ON c.course_id = r.course_id
    JOIN UMS.Enrollments e ON e.student_id = r.student_id
GROUP BY
    r.course_id;

/***/
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

/***/
SELECT
    d.department_name,
    c.course_name,
    p.first_name,
    p.last_name,
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