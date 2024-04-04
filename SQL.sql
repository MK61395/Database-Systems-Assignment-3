 CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(255) NOT NULL,
    City VARCHAR(255),
    Town VARCHAR(255),
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNo VARCHAR(50) UNIQUE NOT NULL,
    EstbDate DATE
);

CREATE TABLE Users(userid INT PRIMARY KEY,
password VARCHAR(50)
);

CREATE TABLE roles(roleid INT PRIMARY KEY,
rolename VARCHAR(100)
);

CREATE TABLE Credentials(credentilaid INT PRIMARY KEY,
userid int,
roleid int
FOREIGN KEY(userid) REFERENCES Users(userid),
FOREIGN KEY(roleid) REFERENCES roles(roleid)
);

CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    AdminName VARCHAR(255) NOT NULL,
    ColID INT,
	userid INT,
    FOREIGN KEY (ColID) REFERENCES Colleges(CollegeID),
	FOREIGN KEY (userid) REFERENCES Users(userid)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(255) NOT NULL,
    ColID INT,
    AdminID INT,
    FOREIGN KEY (ColID) REFERENCES Colleges(CollegeID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Salary INT,
    Password VARCHAR(50),
    HireDate DATE,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNo VARCHAR(50) UNIQUE NOT NULL,
    DepID INT,
    HodID INT,
    FOREIGN KEY (DepID) REFERENCES Departments(DeptID),
    FOREIGN KEY (HodID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Password VARCHAR(50),
    AdmissionDate DATE,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNo VARCHAR(50) UNIQUE NOT NULL,
    DepID INT,
    City VARCHAR(255),
    Town VARCHAR(255),
    HouseNo VARCHAR(50),
    FOREIGN KEY (DepID) REFERENCES Departments(DeptID)
);

CREATE TABLE FacultySchedule (
    Day VARCHAR(50),
    ScheduleType VARCHAR(50),
    FacID INT,
    Timeslot VARCHAR(255),
    FOREIGN KEY (FacID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    CrHrs INT,
    DepID INT,
    FOREIGN KEY (DepID) REFERENCES Departments(DeptID)
);

CREATE TABLE AcademicProgram (
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(255),
    DepID INT,
    FOREIGN KEY (DepID) REFERENCES Departments(DeptID)
);

CREATE TABLE CourseCancel (
    CancelID INT PRIMARY KEY,
    CancelDate DATE,
    FacID INT,
    CourseID INT,
    FOREIGN KEY (FacID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
    CourseID INT,
    StudID INT,
    EnrollType VARCHAR(255),
    EnrollDate DATE,
    Status VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (StudID) REFERENCES Students(StudentID)
);

CREATE TABLE Teaches (
    CourseID INT,
    FacID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (FacID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE ProgramCourse (
    CourseID INT,
    PrID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (PrID) REFERENCES AcademicProgram(ProgramID)
);

CREATE TABLE Dashboard (
    DashboardID INT PRIMARY KEY,
    NoofFacultyAssignments INT,
    NoofEnrollment INT,
    ProgramEffectiveness INT,
    ResourceAllocations VARCHAR(255),
    AdminID INT,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

CREATE TABLE CourseSchedule (
    Day VARCHAR(50),
    CourseID INT,
    Timeslot VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Insert into Colleges
INSERT INTO Colleges (CollegeID, CollegeName, City, Town, Email, PhoneNo, EstbDate)
VALUES 
(1, 'College Name 1', 'City 1', 'Town 1', 'email1@example.com', '1234567890', '2023-01-01'),
(2, 'College Name 2', 'City 2', 'Town 2', 'email2@example.com', '1234567891', '2023-01-02'),
(10, 'College Name 10', 'City 10', 'Town 10', 'email10@example.com', '1234567899', '2023-01-10');

-- Insert into Users
INSERT INTO Users (userid, password)
VALUES 
(1, 'password1'),
(2, 'password2'),
(10, 'password10');

-- Insert into roles
INSERT INTO roles (roleid, rolename)
VALUES 
(1, 'role name 1'),
(2, 'role name 2'),
(10, 'role name 10');

-- Insert into Credentials
INSERT INTO Credentials (credentilaid, userid, roleid)
VALUES 
(1, 1, 1),
(2, 2, 2),
(10, 10, 10);

-- Insert into Admin
INSERT INTO Admin (AdminID, AdminName, ColID, userid)
VALUES 
(1, 'Admin Name 1', 1, 1),
(2, 'Admin Name 2', 2, 2),
(10, 'Admin Name 10', 10, 10);

-- Insert into Departments
INSERT INTO Departments (DeptID, DeptName, ColID, AdminID)
VALUES 
(1, 'Department Name 1', 1, 1),
(2, 'Department Name 2', 2, 2),
(10, 'Department Name 10', 10, 10);

-- Insert into Faculty
INSERT INTO Faculty (FacultyID, LastName, FirstName, Salary, Password, HireDate, Email, PhoneNo, DepID, HodID)
VALUES 
(1, 'Last Name 1', 'First Name 1', 50000, 'password1', '2023-01-01', 'email1@example.com', '1234567890', 1, NULL),
(2, 'Last Name 2', 'First Name 2', 50000, 'password2', '2023-01-02', 'email2@example.com', '1234567891', 2, NULL),
(10, 'Last Name 10', 'First Name 10', 50000, 'password10', '2023-01-10', 'email10@example.com', '1234567899', 10, NULL);

-- Insert into Students
INSERT INTO Students (StudentID, LastName, FirstName, Password, AdmissionDate, Email, PhoneNo, DepID, City, Town, HouseNo)
VALUES 
(1, 'Last Name 1', 'First Name 1', 'password1', '2023-01-01', 'email1@example.com', '1234567890', 1, 'City 1', 'Town 1', '1'),
(2, 'Last Name 2', 'First Name 2', 'password2', '2023-01-02', 'email2@example.com', '1234567891', 2, 'City 2', 'Town 2', '2'),
(10, 'Last Name 10', 'First Name 10', 'password10', '2023-01-10', 'email10@example.com', '1234567899', 10, 'City 10', 'Town 10', '10');

-- Insert into FacultySchedule
INSERT INTO FacultySchedule (Day, ScheduleType, FacID, Timeslot)
VALUES 
('Monday', 'Schedule Type 1', 1, '9:00-10:00'),
('Tuesday', 'Schedule Type 2', 2, '10:00-11:00'),
('Friday', 'Schedule Type 10', 10, '18:00-19:00');

-- Insert into Courses
INSERT INTO Courses (CourseID, CourseName, CrHrs, DepID)
VALUES 
(1, 'Course Name 1', 3, 1),
(2, 'Course Name 2', 3, 2),
(10, 'Course Name 10', 3, 10);

-- Insert into AcademicProgram
INSERT INTO AcademicProgram (ProgramID, ProgramName, DepID)
VALUES 
(1, 'Program Name 1', 1),
(2, 'Program Name 2', 2),
(10, 'Program Name 10', 10);

-- Insert into CourseCancel
INSERT INTO CourseCancel (CancelID, CancelDate, FacID, CourseID)
VALUES 
(1, '2023-01-01', 1, 1),
(2, '2023-01-02', 2, 2),
(10, '2023-01-10', 10, 10);

-- Insert into Enrollment
INSERT INTO Enrollment (EnrollID, CourseID, StudID, EnrollType, EnrollDate, Status)
VALUES 
(1, 1, 1, 'Enroll Type 1', '2023-01-01', 'Status 1'),
(2, 2, 2, 'Enroll Type 2', '2023-01-02', 'Status 2'),
(10, 10, 10, 'Enroll Type 10', '2023-01-10', 'Status 10');

-- Insert into Teaches
INSERT INTO Teaches (CourseID, FacID)
VALUES 
(1, 1),
(2, 2),
(10, 10);

-- Insert into ProgramCourse
INSERT INTO ProgramCourse (CourseID, PrID)
VALUES 
(1, 1),
(2, 2),
(10, 10);

-- Insert into Dashboard
INSERT INTO Dashboard (DashboardID, NoofFacultyAssignments, NoofEnrollment, ProgramEffectiveness, ResourceAllocations, AdminID)
VALUES 
(1, 10, 100, 90, 'Resource Allocations 1', 1),
(2, 20, 200, 80, 'Resource Allocations 2', 2),
(10, 100, 1000, 0, 'Resource Allocations 10', 10);

-- Insert into CourseSchedule
INSERT INTO CourseSchedule (Day, CourseID, Timeslot)
VALUES 
('Monday', 1, '9:00-10:00'),
('Tuesday', 2, '10:00-11:00'),
('Friday', 10, '18:00-19:00');



----QUERIES

----1
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, e.EnrollDate
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Departments d ON c.DepID = d.DeptID
JOIN Colleges col ON d.ColID = col.CollegeID
WHERE col.CollegeName LIKE 'Edwrd College'


-- 2
SELECT c.CourseName as 'Course Name',
c.CrHrs as 'Credit Hours',
d.DeptName as 'Department Name', 
col.CollegeName as 'College Name'
FROM Courses c
JOIN Departments d ON c.DepID = d.DeptID
JOIN Colleges col ON d.ColID = col.CollegeID
WHERE d.DeptName = 'Computer Science';


-- 3
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, e.EnrollDate
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Data Structures'
AND e.EnrollType IN ('daily', 'monthly', 'weekly'); 


----4

SELECT c.CourseName, cs.Timeslot FROM Courses c
JOIN CourseSchedule cs ON c.CourseID=cs.CourseID
WHERE Timeslot LIKE '%'; -- Enter timeslot


----5
SELECT DISTINCT f1.FirstName,f1.LastName
FROM Faculty f1
JOIN Faculty f2 ON f1.DepID=f2.DepID;


---- 6

SELECT TOP 1 f.FirstName, f.LastName, d.DeptName, COUNT(fs.FacID) as NumberOfAssignments
FROM Faculty f
JOIN FacultySchedule fs ON f.FacultyID = fs.FacID
JOIN Departments d ON f.DepID = d.DeptID
WHERE d.DeptName = 'Computer Science'
GROUP BY f.FirstName, f.LastName, d.DeptName
ORDER BY NumberOfAssignments ASC

-- 7

SELECT TOP 1 f.FirstName, f.LastName, d.DeptName, COUNT(fs.FacID) as NumberOfAssignments
FROM Faculty f
JOIN FacultySchedule fs ON f.FacultyID = fs.FacID
JOIN Departments d ON f.DepID = d.DeptID
WHERE d.DeptName = 'Chemistry'
GROUP BY f.FirstName, f.LastName, d.DeptName
ORDER BY NumberOfAssignments DESC




----8
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName, COUNT(e.CourseID) as NumberOfEnrollments
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudID
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY s.StudentID, c.CourseID, s.FirstName, s.LastName, c.CourseName
HAVING COUNT(e.CourseID) > 1;


----9
SELECT s.StudentID, s.FirstName, s.LastName, COUNT(DISTINCT e.CourseID) as NumberOfCourses
FROM Students s
JOIN Enrollment e ON s.StudentID = e.StudID
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT e.CourseID) > 1;


----10
INSERT INTO Users (userid, password)
VALUES
(11, 'pass');


INSERT INTO roles (roleid, rolename)
VALUES
(11, 'role');


INSERT INTO Credentials 
VALUES
(11, 11, 11);


INSERT INTO Admin (AdminID, AdminName, ColID, userid)
VALUES
(11, 'AdminNum', 6, 11);



INSERT INTO Faculty (FacultyID, LastName, FirstName, Salary, Password, HireDate, Email, PhoneNo, DepID, HodID)
VALUES
(12, 'ahmed', 'farhan', 60000, '12334455', '2023-01-01', 'farhan@gamil.com', '1234567890', 1, NULL);



INSERT INTO Students (StudentID, LastName, FirstName, Password, AdmissionDate, Email, PhoneNo, DepID, City, Town, HouseNo)
VALUES
(301, 'cavill', 'henry', 'pass', '2023-01-01', 'cavill@gamil.com', '9876543210', 1, 'NewCity', 'NewTown', '456');



