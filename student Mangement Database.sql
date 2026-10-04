-- UNIT 4: STUDENT COURSE MANAGEMENT SYSTEM

-- 1. Create and select database
CREATE DATABASE IF NOT EXISTS u4;
USE u4;

-- 2. Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Major VARCHAR(50)
);

-- 3. Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT
);

-- 4. Create Enrollments table
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- 5. Create Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15)
);

-- 6. Create Course_Instructors table
CREATE TABLE Course_Instructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- 7. Insert Students
INSERT INTO Students VALUES
(101, 'Rahul', 'CSE'),
(102, 'Priya', 'AIML'),
(103, 'Arjun', 'ECE'),
(104, 'Sneha', 'AIML');

-- 8. Insert Courses
INSERT INTO Courses VALUES
(201, 'Database Management Systems', 4),
(202, 'Operating Systems', 4),
(203, 'Machine Learning', 3),
(204, 'Computer Networks', 3);

-- 9. Insert Enrollments
INSERT INTO Enrollments VALUES
(101, 201, '2026-07-01'),
(101, 202, '2026-07-01'),
(102, 201, '2026-07-02'),
(102, 203, '2026-07-02'),
(103, 204, '2026-07-03'),
(104, 203, '2026-07-03');

-- 10. Insert Instructors
INSERT INTO Instructors VALUES
(301, 'Dr. Kumar', '9876543210'),
(302, 'Dr. Anitha', '9876543211'),
(303, 'Dr. Ramesh', '9876543212');

-- 11. Insert Course_Instructors
INSERT INTO Course_Instructors VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 301);

-- 12. Display all Students
SELECT * FROM Students;

-- 13. Display all Courses
SELECT * FROM Courses;

-- 14. Display AIML Students
SELECT StudentID, StudentName
FROM Students
WHERE Major = 'AIML';

-- 15. Display Student Names with Course Names
SELECT S.StudentID, S.StudentName, C.CourseName
FROM Students S
JOIN Enrollments E
ON S.StudentID = E.StudentID
JOIN Courses C
ON E.CourseID = C.CourseID;

-- 16. Display Course Names with Instructor Names
SELECT C.CourseName, I.InstructorName
FROM Courses C
JOIN Course_Instructors CI
ON C.CourseID = CI.CourseID
JOIN Instructors I
ON CI.InstructorID = I.InstructorID;

-- 17. Display Enrollment Details
SELECT S.StudentName, C.CourseName, E.EnrollmentDate
FROM Students S
JOIN Enrollments E
ON S.StudentID = E.StudentID
JOIN Courses C
ON E.CourseID = C.CourseID;

-- 18. Display all tables
SHOW TABLES;

-- 19. Create database user
CREATE USER IF NOT EXISTS 'u4_user'@'localhost'
IDENTIFIED BY 'U4user@123';

-- 20. Grant SELECT privilege
GRANT SELECT
ON u4.Students
TO 'u4_user'@'localhost';

-- 21. Display Students
SELECT * FROM Students;

-- 22. Grant SELECT, INSERT and UPDATE privileges
GRANT SELECT, INSERT, UPDATE
ON u4.Students
TO 'u4_user'@'localhost';

-- 23. Grant all privileges on database
GRANT ALL PRIVILEGES
ON u4.*
TO 'u4_user'@'localhost';

-- 24. Revoke UPDATE privilege
REVOKE UPDATE
ON u4.Students
FROM 'u4_user'@'localhost';

-- 25. Revoke INSERT privilege
REVOKE INSERT
ON u4.Students
FROM 'u4_user'@'localhost';

-- 26. Grant SELECT privilege again
GRANT SELECT
ON u4.Students
TO 'u4_user'@'localhost';

-- 27. Display Students (Admin session)
SELECT * FROM Students;

-- 28. Revoke SELECT privilege
REVOKE SELECT
ON u4.Students
FROM 'u4_user'@'localhost';

-- 29. Verify user privileges
SHOW GRANTS FOR 'u4_user'@'localhost';