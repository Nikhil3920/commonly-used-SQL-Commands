-- Create a new database named COLLAGE
CREATE DATABASE COLLAGE;

-- Use the COLLAGE database
USE COLLAGE;

-- Create a STUDENT table with specified columns
CREATE TABLE STUDENT(
    ROLLNO INT PRIMARY KEY, -- Primary key for student identification
    NAME VARCHAR(50),      -- Student's name
    MARKS INT NOT NULL,    -- Marks scored by the student, cannot be null
    GRADE VARCHAR(10),     -- Grade based on marks
    CITY VARCHAR(25)       -- City where the student resides
);

-- Insert multiple records into the STUDENT table
INSERT INTO STUDENT (ROLLNO, NAME, MARKS, GRADE, CITY) VALUES
(101, 'John Doe', 85, 'A', 'New York'),
(102, 'Jane Smith', 92, 'A+', 'Los Angeles'),
(103, 'Robert Brown', 76, 'B+', 'Chicago'),
(104, 'Emily Davis', 64, 'C', 'Houston'),
(105, 'Michael Johnson', 88, 'A', 'Phoenix'),
(106, 'Linda Taylor', 95, 'A+', 'Philadelphia'),
(107, 'David Miller', 70, 'B', 'San Antonio'),
(108, 'Jessica Wilson', 82, 'A', 'San Diego'),
(109, 'Christopher Moore', 55, 'D', 'Dallas'),
(110, 'Sarah Anderson', 78, 'B+', 'San Jose');

-- Select names and marks of all students
SELECT NAME, MARKS FROM STUDENT;

-- Select distinct cities from the STUDENT table
SELECT DISTINCT CITY FROM STUDENT;

-- Select all student records where marks are greater than 80
SELECT * FROM STUDENT WHERE MARKS > 80;

-- Select all student records from New York
SELECT * FROM STUDENT WHERE CITY = 'New York';

-- Select students from New York with marks greater than 80
SELECT * FROM STUDENT WHERE CITY = 'New York' AND MARKS > 80;

-- Select students who are not from New York
SELECT * FROM STUDENT WHERE CITY NOT IN ('New York');

-- Select the first 3 students with marks greater than 80
SELECT * FROM STUDENT WHERE MARKS > 80 LIMIT 3;

-- Order all student records by city in ascending order
SELECT * FROM STUDENT ORDER BY CITY ASC;

-- Order the first 5 student records by city in ascending order
SELECT * FROM STUDENT ORDER BY CITY ASC LIMIT 5;

-- Get the maximum marks scored by any student
SELECT MAX(MARKS) FROM STUDENT;

-- Get the average marks of all students
SELECT AVG(MARKS) FROM STUDENT;

-- Count the number of students in each city
SELECT CITY, COUNT(ROLLNO) FROM STUDENT GROUP BY CITY;

-- Calculate the average marks for students in each city
SELECT CITY, AVG(MARKS) FROM STUDENT GROUP BY CITY;

-- Calculate the average marks for each city and order by average marks in descending order
SELECT CITY, AVG(MARKS) FROM STUDENT GROUP BY CITY ORDER BY AVG(MARKS) DESC;

-- Count the number of students in each city with max marks greater than 90
SELECT COUNT(NAME), CITY FROM STUDENT GROUP BY CITY HAVING MAX(MARKS) > 90;

-- Update all students with grade A+ to a new grade "0"
UPDATE STUDENT SET GRADE = '0' WHERE GRADE = 'A+';

-- Disable safe updates for the session
SET SQL_SAFE_UPDATES = 0;

-- Increase marks of all students by 2
UPDATE STUDENT SET MARKS = MARKS + 2;

-- Create DEPARTMENT table with ID and NAME
CREATE TABLE DEPARTMENT(
    ID INT PRIMARY KEY,   -- Primary key for department identification
    NAME VARCHAR(50)     -- Department name
);

-- Create TEACHER table with a foreign key to DEPARTMENT
CREATE TABLE TEACHER(
    ID INT PRIMARY KEY,   -- Primary key for teacher identification
    NAME VARCHAR(50),     -- Teacher's name
    DEPTID INT,          -- Foreign key linking to DEPARTMENT table
    FOREIGN KEY(DEPTID) REFERENCES DEPARTMENT(ID) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

-- Create STUDENT2 table with specified columns
CREATE TABLE student2 (
    std_id INT PRIMARY KEY, -- Primary key for student identification
    name VARCHAR(100),      -- Student's name
    age INT,               -- Student's age
    marks INT              -- Marks scored by the student
);

-- Insert multiple records into STUDENT2 table
INSERT INTO student2 (std_id, name, age, marks) VALUES
(1, 'Aarav Sharma', 18, 85),
(2, 'Ishita Patel', 19, 90),
(3, 'Rohit Mehra', 17, 78),
(4, 'Simran Kaur', 18, 88),
(5, 'Vikram Rao', 20, 65),
(6, 'Neha Gupta', 19, 92),
(7, 'Arjun Verma', 21, 75),
(8, 'Sanya Iyer', 18, 80),
(9, 'Manish Singh', 22, 70),
(10, 'Pooja Nair', 20, 95);

-- Drop the age column from STUDENT2 table
ALTER TABLE student2 DROP COLUMN age;

-- Rename the STUDENT2 table to details_of_students
ALTER TABLE student2 RENAME TO details_of_students; 

-- Rename details_of_students back to STUDENT2
ALTER TABLE details_of_students RENAME TO student2; 

-- Empty the STUDENT2 table
TRUNCATE TABLE student2;

-- Select all records from STUDENT2
SELECT * FROM student2;

-- Insert new records into STUDENT2
INSERT INTO student2 (std_id, name, marks) VALUES
(1, 'Aarav Sharma', 85),
(2, 'Ishita Patel', 90),
(3, 'Rohit Mehra', 78),
(4, 'Simran Kaur', 88),
(5, 'Vikram Rao', 65),
(6, 'Neha Gupta', 92),
(7, 'Arjun Verma', 75),
(8, 'Sanya Iyer', 80),
(9, 'Manish Singh', 70),
(10, 'Pooja Nair', 95);

-- Change column name from name to full_name in STUDENT2
ALTER TABLE student2 CHANGE name full_name VARCHAR(50);

-- Delete records from STUDENT2 where marks are less than 80
DELETE FROM student2 WHERE marks < 80;

-- Creating the BOOKS table
CREATE TABLE books (
    book_id INT PRIMARY KEY, -- Primary key for book identification
    title VARCHAR(100),      -- Title of the book
    author_id INT,          -- Foreign key linking to the authors table
    publication_year INT     -- Year of publication
);

-- Creating the AUTHORS table
CREATE TABLE authors (
    author_id INT PRIMARY KEY, -- Primary key for author identification
    name VARCHAR(100),         -- Author's name
    country VARCHAR(50)        -- Country of the author
);

-- Inserting values into the BOOKS table
INSERT INTO books (book_id, title, author_id, publication_year) VALUES
(1, 'The Guide', 1, 1958),
(2, 'MYSQL', 1, 1943),
(3, 'BA', 2, 1997),
(4, 'DATA ANALYTICS', 3, 1956),
(5, 'PYTHON', 4, 2008);

-- Inserting values into the AUTHORS table
INSERT INTO authors (author_id, name, country) VALUES
(1, 'NIKHIL', 'India'),
(2, 'NAVENDU', 'India'),
(3, 'RAHUL', 'India'),
(4, 'PREM', 'India');

-- Query to INNER JOIN the BOOKS and AUTHORS tables to get all records
SELECT *
FROM books 
INNER JOIN authors ON books.author_id = authors.author_id;

-- Query to LEFT JOIN BOOKS and AUTHORS tables
SELECT *
FROM books
LEFT JOIN authors ON books.author_id = authors.author_id;

-- Query to RIGHT JOIN BOOKS and AUTHORS tables
SELECT *
FROM books
RIGHT JOIN authors ON books.author_id = authors.author_id;

-- FULL JOIN using UNION to combine results from both LEFT and RIGHT joins
SELECT *
FROM books
LEFT JOIN authors ON books.author_id = authors.author_id
UNION
SELECT *
FROM books
RIGHT JOIN authors ON books.author_id = authors.author_id;

-- Creating the first table: STUDENTS_BATCH1
CREATE TABLE students_batch1 (
    student_id INT,         -- Student ID
    name VARCHAR(100),      -- Student's name
    age INT                 -- Student's age
);

-- Creating the second table: STUDENTS_BATCH2
CREATE TABLE students_batch2 (
    student_id INT,         -- Student ID
    name VARCHAR(100),      -- Student's name
    age INT                 -- Student's age
);

-- Inserting values into STUDENTS_BATCH1
INSERT INTO students_batch1 (student_id, name, age) VALUES
(1, 'Aarav Sharma', 18),
(2, 'Ishita Patel', 19),
(3, 'Rohit Mehra', 17);

-- Inserting values into STUDENTS_BATCH2
INSERT INTO students_batch2 (student_id, name, age) VALUES
(4, 'Simran Kaur', 18),
(5, 'Vikram Rao', 20),
(6, 'Neha Gupta', 19);

-- UNION to combine results from both student batches
SELECT student_id, name, age
FROM students_batch1
UNION ALL
SELECT student_id, name, age
FROM students_batch2;

-- Create the DEPARTMENT table again
CREATE TABLE DEPARTMENT(
    ID INT PRIMARY KEY,     -- Primary key for department identification
    NAME VARCHAR(50)       -- Department name
);

-- Create the TEACHER table again
CREATE TABLE TEACHER(
    ID INT PRIMARY KEY,     -- Primary key for teacher identification
    NAME VARCHAR(50),       -- Teacher's name
    DEPTID INT,             -- Foreign key linking to DEPARTMENT table
    FOREIGN KEY(DEPTID) REFERENCES DEPARTMENT(ID) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

-- Drop the TEACHER table
DROP TABLE TEACHER;

-- Insert departments into the DEPARTMENT table
INSERT INTO DEPARTMENT VALUES 
(101, "IT"),
(102, "ENGLISH");

-- Insert teachers into the TEACHER table
INSERT INTO TEACHER VALUES 
(101, "ADAM", 101),
(102, "SMITH", 102);

-- Update the department ID for English department
UPDATE DEPARTMENT SET ID = 104 WHERE ID = 102;

-- Select all records from the DEPARTMENT table
SELECT * FROM DEPARTMENT;

-- Select all records from the TEACHER table
SELECT * FROM TEACHER;

-- veiws
-- Create a STUDENTS table to store student information
CREATE TABLE STUDENTS10 (
    student_id INT PRIMARY KEY,   -- Unique identifier for each student
    name VARCHAR(100),            -- Student's name (up to 100 characters)
    age INT,                      -- Student's age
    grade VARCHAR(10)             -- Grade of the student
);

-- Create a COURSES table to store course information
CREATE TABLE COURSES (
    course_id INT PRIMARY KEY,    -- Unique identifier for each course
    course_name VARCHAR(100),     -- Name of the course (up to 100 characters)
    credits INT                   -- Number of credits for the course
);

-- Create an ENROLLMENTS table to associate students with courses
CREATE TABLE ENROLLMENTS (
    enrollment_id INT PRIMARY KEY, -- Unique identifier for each enrollment
    student_id INT,                -- Foreign key referencing STUDENTS
    course_id INT,                 -- Foreign key referencing COURSES
    FOREIGN KEY (student_id) REFERENCES STUDENTS10(student_id)
        ON DELETE CASCADE,         -- If a student is deleted, their enrollments are also deleted
    FOREIGN KEY (course_id) REFERENCES COURSES(course_id)
        ON DELETE CASCADE          -- If a course is deleted, associated enrollments are also deleted
);

-- Insert sample data into the STUDENTS table
INSERT INTO STUDENTS10 (student_id, name, age, grade) VALUES
(1, 'Alice', 20, 'A'),
(2, 'Bob', 21, 'B'),
(3, 'Charlie', 19, 'A'),
(4, 'Daisy', 22, 'C');

-- Insert sample data into the COURSES table
INSERT INTO COURSES (course_id, course_name, credits) VALUES
(1, 'Mathematics', 3),
(2, 'Physics', 4),
(3, 'Chemistry', 3),
(4, 'Biology', 2);

-- Insert sample data into the ENROLLMENTS table
INSERT INTO ENROLLMENTS (enrollment_id, student_id, course_id) VALUES
(1, 1, 1),  -- Alice is enrolled in Mathematics
(2, 1, 2),  -- Alice is also enrolled in Physics
(3, 2, 3),  -- Bob is enrolled in Chemistry
(4, 3, 1),  -- Charlie is enrolled in Mathematics
(5, 4, 4);  -- Daisy is enrolled in Biology

-- Create a view to display student names and their grades
CREATE VIEW StudentGrades AS
SELECT name, grade
FROM STUDENTS10;

-- Create a view to display students and their enrolled courses
CREATE VIEW StudentCourses AS
SELECT s.name AS StudentName, c.course_name AS CourseName
FROM STUDENTS10 s
JOIN ENROLLMENTS e ON s.student_id = e.student_id
JOIN COURSES c ON e.course_id = c.course_id;

-- Query the StudentGrades view to see student names and their grades
SELECT * FROM StudentGrades;

-- Query the StudentCourses view to see which courses each student is enrolled in
SELECT * FROM StudentCourses;
-- Create a view to display students with grade 'A'
CREATE VIEW A_Students AS
SELECT name, grade
FROM STUDENTS10
WHERE grade = 'A';

-- Create a view to display students who are older than 20 years
CREATE VIEW Older_Students AS
SELECT name, age
FROM STUDENTS10
WHERE age > 20;

