CREATE DATABASE IF NOT EXISTS `UMS`;

USE `UMS`;

--
-- Table structure for table `Courses`
--
DROP TABLE IF EXISTS `Courses`;

CREATE TABLE `Courses` (
    `course_id` int NOT NULL,
    `course_name` varchar(45) NOT NULL,
    `professor_id` int NOT NULL,
    `credit` int NOT NULL,
    `hours` double NOT NULL,
    PRIMARY KEY (`course_id`),
    KEY `Course_Professor_FK_idx` (`professor_id`),
    CONSTRAINT `Course_Professor_FK` FOREIGN KEY (`professor_id`) REFERENCES `Professors` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Courses`
VALUES
    (1, 'Introduction to Computer Science', 1, 3, 45),
    (2, 'Calculus I', 2, 4, 60),
    (3, 'Physics for Beginners', 3, 3, 45),
    (4, 'Biology Fundamentals', 4, 3, 45),
    (5, 'Chemistry 101', 5, 4, 60),
    (6, 'Advanced Programming', 1, 4, 60),
    (7, 'Statistics and Probability', 2, 3, 45),
    (8, 'Organic Chemistry', 3, 4, 60),
    (9, 'Microbiology', 4, 3, 45),
    (10, 'Data Structures', 5, 4, 60);

--
-- Table structure for table `Departments`
--
DROP TABLE IF EXISTS `Departments`;

CREATE TABLE `Departments` (
    `department_id` int NOT NULL,
    `department_name` varchar(45) NOT NULL,
    PRIMARY KEY (`department_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Departments`
VALUES
    (1, 'Computer Science'),
    (2, 'Mathematics'),
    (3, 'Physics'),
    (4, 'Biology'),
    (5, 'Chemistry');

--
-- Table structure for table `Enrollments`
--
DROP TABLE IF EXISTS `Enrollments`;

CREATE TABLE `Enrollments` (
    `enrollment_id` int NOT NULL,
    `enroll_date` date NOT NULL,
    `department_id` int NOT NULL,
    `semester_id` int NOT NULL,
    `grade` varchar(50) NOT NULL,
    `student_id` int NOT NULL,
    PRIMARY KEY (`enrollment_id`),
    KEY `Enrollment_Semester_FK_idx` (`semester_id`),
    KEY `Enrollment_Department_FK_idx` (`department_id`),
    KEY `Enrollment_Student_FK_idx` (`student_id`),
    CONSTRAINT `Enrollment_Department_FK` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Enrollment_Semester_FK` FOREIGN KEY (`semester_id`) REFERENCES `Semesters` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Enrollment_Student_FK` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Enrollments`
VALUES
    (1, '2023-08-15', 1, 1, 'A', 1),
    (2, '2023-08-15', 2, 1, 'B', 2),
    (3, '2023-08-15', 3, 1, 'C', 3),
    (4, '2023-08-15', 4, 1, 'B', 4),
    (5, '2023-08-15', 5, 1, 'A', 5),
    (6, '2023-08-15', 1, 2, 'A', 6),
    (7, '2023-08-15', 2, 2, 'B', 7),
    (8, '2023-08-15', 3, 2, 'C', 8),
    (9, '2023-08-15', 4, 2, 'A', 9),
    (10, '2023-08-15', 5, 2, 'B', 10),
    (11, '2023-08-15', 1, 3, 'B', 11),
    (12, '2023-08-15', 2, 3, 'C', 12),
    (13, '2023-08-15', 3, 3, 'A', 13),
    (14, '2023-08-15', 4, 3, 'A', 14),
    (15, '2023-08-15', 5, 3, 'B', 15),
    (16, '2023-08-15', 1, 4, 'A', 16),
    (17, '2023-08-15', 2, 4, 'B', 17),
    (18, '2023-08-15', 3, 4, 'C', 18),
    (19, '2023-08-15', 4, 4, 'B', 19),
    (20, '2023-08-15', 5, 4, 'A', 20),
    (21, '2023-08-15', 1, 5, 'C', 21),
    (22, '2023-08-15', 2, 5, 'B', 22),
    (23, '2023-08-15', 3, 5, 'A', 23),
    (24, '2023-08-15', 4, 5, 'B', 24),
    (25, '2023-08-15', 5, 5, 'A', 25);

--
-- Table structure for table `Professors`
--
DROP TABLE IF EXISTS `Professors`;

CREATE TABLE `Professors` (
    `professor_id` int NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `email` varchar(45) NOT NULL,
    `date_of_birth` date NOT NULL,
    `department_id` int NOT NULL,
    PRIMARY KEY (`professor_id`),
    KEY `Professor_Department_FK_idx` (`department_id`),
    CONSTRAINT `Professor_Department_FK` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Professors`
VALUES
    (
        1,
        'Professor',
        'Smith',
        'prof.smith@email.com',
        '1975-05-10',
        1
    ),
    (
        2,
        'Professor',
        'Johnson',
        'prof.johnson@email.com',
        '1980-02-20',
        2
    ),
    (
        3,
        'Professor',
        'Brown',
        'prof.brown@email.com',
        '1978-09-15',
        3
    ),
    (
        4,
        'Professor',
        'Garcia',
        'prof.garcia@email.com',
        '1982-03-08',
        4
    ),
    (
        5,
        'Professor',
        'Lee',
        'prof.lee@email.com',
        '1985-11-30',
        5
    ),
    (
        6,
        'Professor',
        'Taylor',
        'prof.taylor@email.com',
        '1983-08-12',
        1
    ),
    (
        7,
        'Professor',
        'Martinez',
        'prof.martinez@email.com',
        '1979-04-25',
        2
    ),
    (
        8,
        'Professor',
        'Hall',
        'prof.hall@email.com',
        '1987-10-30',
        3
    ),
    (
        9,
        'Professor',
        'Adams',
        'prof.adams@email.com',
        '1976-02-15',
        4
    ),
    (
        10,
        'Professor',
        'Perez',
        'prof.perez@email.com',
        '1980-06-05',
        5
    );

--
-- Table structure for table `Registrations`
--
DROP TABLE IF EXISTS `Registrations`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `Registrations` (
    `registration_id` int NOT NULL,
    `student_id` int NOT NULL,
    `course_id` int NOT NULL,
    `semester_id` int NOT NULL,
    `registration_date` date NOT NULL,
    PRIMARY KEY (`registration_id`),
    KEY `Registration_Student_FK_idx` (`student_id`),
    KEY `Registration_Course_FK_idx` (`course_id`),
    KEY `Registration_Semester_FK_idx` (`semester_id`),
    CONSTRAINT `Registration_Course_FK` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Registration_Semester_FK` FOREIGN KEY (`semester_id`) REFERENCES `Semesters` (`semester_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Registration_Student_FK` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Registrations`
VALUES
    (1, 1, 1, 1, '2023-01-10'),
    (2, 2, 2, 1, '2023-01-15'),
    (3, 3, 3, 1, '2023-01-20'),
    (4, 4, 4, 1, '2023-01-25'),
    (5, 5, 5, 1, '2023-02-01'),
    (6, 6, 1, 2, '2023-02-10'),
    (7, 7, 2, 2, '2023-02-15'),
    (8, 8, 3, 2, '2023-02-20'),
    (9, 9, 4, 2, '2023-02-25'),
    (10, 10, 5, 2, '2023-03-01'),
    (11, 11, 1, 3, '2023-03-10'),
    (12, 12, 2, 3, '2023-03-15'),
    (13, 13, 3, 3, '2023-03-20'),
    (14, 14, 4, 3, '2023-03-25'),
    (15, 15, 5, 3, '2023-04-01'),
    (16, 16, 1, 4, '2023-04-10'),
    (17, 17, 2, 4, '2023-04-15'),
    (18, 18, 3, 4, '2023-04-20'),
    (19, 19, 4, 4, '2023-04-25'),
    (20, 20, 5, 4, '2023-05-01'),
    (21, 21, 1, 5, '2023-05-10'),
    (22, 22, 2, 5, '2023-05-15'),
    (23, 23, 3, 5, '2023-05-20'),
    (24, 24, 4, 5, '2023-05-25'),
    (25, 25, 5, 5, '2023-06-01'),
    (26, 11, 6, 1, '2023-01-10'),
    (27, 12, 7, 1, '2023-01-15'),
    (28, 13, 8, 1, '2023-01-20'),
    (29, 14, 9, 1, '2023-01-25'),
    (30, 15, 10, 1, '2023-02-01'),
    (31, 16, 1, 2, '2023-02-10'),
    (32, 17, 2, 2, '2023-02-15'),
    (33, 18, 3, 2, '2023-02-20'),
    (34, 19, 4, 2, '2023-02-25'),
    (35, 20, 5, 2, '2023-03-01'),
    (36, 21, 6, 3, '2023-03-10'),
    (37, 22, 7, 3, '2023-03-15'),
    (38, 23, 8, 3, '2023-03-20'),
    (39, 24, 9, 3, '2023-03-25'),
    (40, 25, 10, 3, '2023-04-01'),
    (41, 1, 6, 4, '2023-04-10'),
    (42, 2, 7, 4, '2023-04-15'),
    (43, 3, 8, 4, '2023-04-20'),
    (44, 4, 9, 4, '2023-04-25'),
    (45, 5, 10, 4, '2023-05-01');

--
-- Table structure for table `Semesters`
--
DROP TABLE IF EXISTS `Semesters`;

CREATE TABLE `Semesters` (
    `semester_id` int NOT NULL,
    `year` year NOT NULL,
    `semester` varchar(45) NOT NULL,
    PRIMARY KEY (`semester_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Semesters`
VALUES
    (1, 2023, 'Spring'),
    (2, 2023, 'Summer'),
    (3, 2023, 'Fall'),
    (4, 2024, 'Spring'),
    (5, 2024, 'Summer');

--
-- Table structure for table `Students`
--
DROP TABLE IF EXISTS `Students`;

CREATE TABLE `Students` (
    `student_id` int NOT NULL,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `date_of_birth` date NOT NULL,
    `email` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`student_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO
    `Students`
VALUES
    (
        1,
        'John',
        'Doe',
        '2000-01-15',
        'john.doe@email.com'
    ),
    (
        2,
        'Jane',
        'Smith',
        '2001-03-22',
        'jane.smith@email.com'
    ),
    (
        3,
        'Alice',
        'Johnson',
        '1999-12-05',
        'alice.johnson@email.com'
    ),
    (
        4,
        'Bob',
        'Wilson',
        '2002-05-10',
        'bob.wilson@email.com'
    ),
    (
        5,
        'Emma',
        'Brown',
        '2000-09-15',
        'emma.brown@email.com'
    ),
    (
        6,
        'Michael',
        'Lee',
        '1998-07-30',
        'michael.lee@email.com'
    ),
    (
        7,
        'Sophia',
        'Garcia',
        '2001-11-28',
        'sophia.garcia@email.com'
    ),
    (
        8,
        'David',
        'Harris',
        '1999-04-18',
        'david.harris@email.com'
    ),
    (
        9,
        'Olivia',
        'Martinez',
        '2003-02-10',
        'olivia.martinez@email.com'
    ),
    (
        10,
        'William',
        'Wang',
        '2000-03-25',
        'william.wang@email.com'
    ),
    (
        11,
        'Emily',
        'Anderson',
        '2002-08-05',
        'emily.anderson@email.com'
    ),
    (
        12,
        'Liam',
        'Chen',
        '2001-09-12',
        'liam.chen@email.com'
    ),
    (
        13,
        'Ava',
        'Gonzalez',
        '1998-06-20',
        'ava.gonzalez@email.com'
    ),
    (
        14,
        'James',
        'Kim',
        '2003-01-04',
        'james.kim@email.com'
    ),
    (
        15,
        'Mia',
        'Nguyen',
        '1999-10-07',
        'mia.nguyen@email.com'
    ),
    (
        16,
        'Benjamin',
        'Singh',
        '2000-07-15',
        'benjamin.singh@email.com'
    ),
    (
        17,
        'Charlotte',
        'Patel',
        '2002-12-22',
        'charlotte.patel@email.com'
    ),
    (
        18,
        'Henry',
        'Lopez',
        '1998-04-02',
        'henry.lopez@email.com'
    ),
    (
        19,
        'Amelia',
        'Wu',
        '2001-06-13',
        'amelia.wu@email.com'
    ),
    (
        20,
        'Daniel',
        'Brown',
        '1999-03-17',
        'daniel.brown@email.com'
    ),
    (
        21,
        'Sophia',
        'Davis',
        '2000-05-27',
        'sophia.davis@email.com'
    ),
    (
        22,
        'Logan',
        'Thompson',
        '2003-09-08',
        'logan.thompson@email.com'
    ),
    (
        23,
        'Evelyn',
        'Hall',
        '1998-12-14',
        'evelyn.hall@email.com'
    ),
    (
        24,
        'Jackson',
        'Lewis',
        '2002-07-23',
        'jackson.lewis@email.com'
    ),
    (
        25,
        'Ethan',
        'Garcia',
        '2003-02-20',
        'ethan.garcia@email.com'
    );