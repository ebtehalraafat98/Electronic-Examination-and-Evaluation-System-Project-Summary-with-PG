CREATE TABLE Department (
    Dep_id INT PRIMARY KEY,
    Dep_name VARCHAR(100) NOT NULL,
    head_id INT
);

CREATE TABLE Professor (
    Prof_id INT PRIMARY KEY,
    Dep_id INT NOT NULL REFERENCES Department(Dep_id),
    Prof_name VARCHAR(100) NOT NULL,
    prof_email VARCHAR(100) UNIQUE
);

CREATE TABLE Student (
    Std_id INT PRIMARY KEY,
    Std_name VARCHAR(100) NOT NULL,
    Level VARCHAR(50),
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Degree VARCHAR(50),
    Faculty VARCHAR(100)
);

CREATE TABLE Course (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(100) NOT NULL,
    Dep_id INT NOT NULL REFERENCES Department(Dep_id)
);

CREATE TABLE Exam (
    Exam_id INT PRIMARY KEY,
    Course_id INT NOT NULL REFERENCES Course(Course_id),
    Total_mark NUMERIC(5,2),
    Exam_date DATE,
    Pass_score NUMERIC(5,2)
);

CREATE TABLE Question (
    Ques_id INT PRIMARY KEY,
    Correct_ans TEXT,
    Mark_ques NUMERIC(5,2) NOT NULL,
    Content TEXT
);

CREATE TABLE Course_Prof (
    Course_id INT REFERENCES Course(Course_id),
    Prof_id INT REFERENCES Professor(Prof_id),
    PRIMARY KEY (Course_id, Prof_id)
);

CREATE TABLE Exam_Question (
    Exam_id INT REFERENCES Exam(Exam_id),
    Ques_id INT REFERENCES Question(Ques_id),
    PRIMARY KEY (Exam_id, Ques_id)
);

CREATE TABLE Answer (
    Answer_id SERIAL PRIMARY KEY,
    Std_id INT NOT NULL REFERENCES Student(Std_id),
    Exam_id INT NOT NULL REFERENCES Exam(Exam_id),
    Ques_id INT NOT NULL REFERENCES Question(Ques_id),
    Mark_obtained NUMERIC(5,2),
    Is_correct BOOLEAN,
    Select_ans TEXT,
    UNIQUE (Std_id, Exam_id, Ques_id)
);

CREATE TABLE Evaluation (
    Evaluation_id SERIAL PRIMARY KEY,
    Prof_id INT NOT NULL REFERENCES Professor(Prof_id),
    Course_id INT NOT NULL REFERENCES Course(Course_id),
    Std_id INT NOT NULL REFERENCES Student(Std_id),
    Professor_rating INT CHECK (Professor_rating >= 1 AND Professor_rating <= 10),
    Course_rating INT CHECK (Course_rating >= 1 AND Course_rating <= 10),
    UNIQUE (Std_id, Prof_id, Course_id)
);

CREATE TABLE Course_Student (
    Course_id INT REFERENCES Course(Course_id),
    Std_id INT REFERENCES Student(Std_id),
    PRIMARY KEY (Course_id, Std_id)
);

CREATE TABLE Exam_Student (
    Exam_id INT REFERENCES Exam(Exam_id),
    Std_id INT REFERENCES Student(Std_id),
    PRIMARY KEY (Exam_id, Std_id)
);

ALTER TABLE Department
ADD CONSTRAINT fk_department_head
FOREIGN KEY (head_id)
REFERENCES Professor(Prof_id)
ON DELETE RESTRICT;

-- =======================
-- Departments
-- =======================
INSERT INTO Department (Dep_id, Dep_name, head_id) VALUES
(1, 'Computer Science', NULL),
(2, 'Information Systems', NULL),
(3, 'Artificial Intelligence', NULL),
(4, 'Data Science', NULL),
(5, 'Cyber Security', NULL)
ON CONFLICT (Dep_id) DO NOTHING;

-- =======================
-- Professors
-- =======================
INSERT INTO Professor (Prof_id, Dep_id, Prof_name, prof_email) VALUES
(101, 1, 'Dr. Ahmed Hassan', 'ahmed@uni.edu'),
(102, 2, 'Dr. Mariam Ali', 'mariam@uni.edu'),
(103, 3, 'Dr. Eman Fathy', 'eman@uni.edu'),
(104, 4, 'Dr. Karim Youssef', 'karim@uni.edu'),
(105, 5, 'Dr. Salma Nader', 'salma@uni.edu')
ON CONFLICT (Prof_id) DO NOTHING;

UPDATE Department SET head_id = 101 WHERE Dep_id = 1;
UPDATE Department SET head_id = 102 WHERE Dep_id = 2;
UPDATE Department SET head_id = 103 WHERE Dep_id = 3;
UPDATE Department SET head_id = 104 WHERE Dep_id = 4;
UPDATE Department SET head_id = 105 WHERE Dep_id = 5;

-- =======================
-- students in each department
-- =======================

-- Computer Science Students 201-215
INSERT INTO Student (Std_id, Std_name, Level, Username, Password, Degree, Faculty)
VALUES
(201, 'Student CS1', '4th', 'cs1', '12345', 'BSc', 'Computer Science'),
(202, 'Student CS2', '3rd', 'cs2', '12345', 'BSc', 'Computer Science'),
(203, 'Student CS3', '2nd', 'cs3', '12345', 'BSc', 'Computer Science'),
(204, 'Student CS4', '1st', 'cs4', '12345', 'BSc', 'Computer Science'),
(205, 'Student CS5', '4th', 'cs5', '12345', 'BSc', 'Computer Science'),
(206, 'Student CS6', '3rd', 'cs6', '12345', 'BSc', 'Computer Science'),
(207, 'Student CS7', '2nd', 'cs7', '12345', 'BSc', 'Computer Science'),
(208, 'Student CS8', '1st', 'cs8', '12345', 'BSc', 'Computer Science'),
(209, 'Student CS9', '4th', 'cs9', '12345', 'BSc', 'Computer Science'),
(210, 'Student CS10', '3rd', 'cs10', '12345', 'BSc', 'Computer Science'),
(211, 'Student CS11', '2nd', 'cs11', '12345', 'BSc', 'Computer Science'),
(212, 'Student CS12', '1st', 'cs12', '12345', 'BSc', 'Computer Science'),
(213, 'Student CS13', '4th', 'cs13', '12345', 'BSc', 'Computer Science'),
(214, 'Student CS14', '3rd', 'cs14', '12345', 'BSc', 'Computer Science'),
(215, 'Student CS15', '2nd', 'cs15', '12345', 'BSc', 'Computer Science')
ON CONFLICT (Std_id) DO NOTHING;

-- Information Systems Students 216-230
INSERT INTO Student (Std_id, Std_name, Level, Username, Password, Degree, Faculty)
VALUES
(216, 'Student IS1', '4th', 'is1', '12345', 'BSc', 'Information Systems'),
(217, 'Student IS2', '3rd', 'is2', '12345', 'BSc', 'Information Systems'),
(218, 'Student IS3', '2nd', 'is3', '12345', 'BSc', 'Information Systems'),
(219, 'Student IS4', '1st', 'is4', '12345', 'BSc', 'Information Systems'),
(220, 'Student IS5', '4th', 'is5', '12345', 'BSc', 'Information Systems'),
(221, 'Student IS6', '3rd', 'is6', '12345', 'BSc', 'Information Systems'),
(222, 'Student IS7', '2nd', 'is7', '12345', 'BSc', 'Information Systems'),
(223, 'Student IS8', '1st', 'is8', '12345', 'BSc', 'Information Systems'),
(224, 'Student IS9', '4th', 'is9', '12345', 'BSc', 'Information Systems'),
(225, 'Student IS10', '3rd', 'is10', '12345', 'BSc', 'Information Systems'),
(226, 'Student IS11', '2nd', 'is11', '12345', 'BSc', 'Information Systems'),
(227, 'Student IS12', '1st', 'is12', '12345', 'BSc', 'Information Systems'),
(228, 'Student IS13', '4th', 'is13', '12345', 'BSc', 'Information Systems'),
(229, 'Student IS14', '3rd', 'is14', '12345', 'BSc', 'Information Systems'),
(230, 'Student IS15', '2nd', 'is15', '12345', 'BSc', 'Information Systems')
ON CONFLICT (Std_id) DO NOTHING;

-- Artificial Intelligence Students 231-245
INSERT INTO Student (Std_id, Std_name, Level, Username, Password, Degree, Faculty)
VALUES
(231, 'Student AI1', '4th', 'ai1', '12345', 'BSc', 'Artificial Intelligence'),
(232, 'Student AI2', '3rd', 'ai2', '12345', 'BSc', 'Artificial Intelligence'),
(233, 'Student AI3', '2nd', 'ai3', '12345', 'BSc', 'Artificial Intelligence'),
(234, 'Student AI4', '1st', 'ai4', '12345', 'BSc', 'Artificial Intelligence'),
(235, 'Student AI5', '4th', 'ai5', '12345', 'BSc', 'Artificial Intelligence'),
(236, 'Student AI6', '3rd', 'ai6', '12345', 'BSc', 'Artificial Intelligence'),
(237, 'Student AI7', '2nd', 'ai7', '12345', 'BSc', 'Artificial Intelligence'),
(238, 'Student AI8', '1st', 'ai8', '12345', 'BSc', 'Artificial Intelligence'),
(239, 'Student AI9', '4th', 'ai9', '12345', 'BSc', 'Artificial Intelligence'),
(240, 'Student AI10', '3rd', 'ai10', '12345', 'BSc', 'Artificial Intelligence'),
(241, 'Student AI11', '2nd', 'ai11', '12345', 'BSc', 'Artificial Intelligence'),
(242, 'Student AI12', '1st', 'ai12', '12345', 'BSc', 'Artificial Intelligence'),
(243, 'Student AI13', '4th', 'ai13', '12345', 'BSc', 'Artificial Intelligence'),
(244, 'Student AI14', '3rd', 'ai14', '12345', 'BSc', 'Artificial Intelligence'),
(245, 'Student AI15', '2nd', 'ai15', '12345', 'BSc', 'Artificial Intelligence')
ON CONFLICT (Std_id) DO NOTHING;

-- Data Science Students 246-260
INSERT INTO Student (Std_id, Std_name, Level, Username, Password, Degree, Faculty)
VALUES
(246, 'Student DS1', '4th', 'ds1', '12345', 'BSc', 'Data Science'),
(247, 'Student DS2', '3rd', 'ds2', '12345', 'BSc', 'Data Science'),
(248, 'Student DS3', '2nd', 'ds3', '12345', 'BSc', 'Data Science'),
(249, 'Student DS4', '1st', 'ds4', '12345', 'BSc', 'Data Science'),
(250, 'Student DS5', '4th', 'ds5', '12345', 'BSc', 'Data Science'),
(251, 'Student DS6', '3rd', 'ds6', '12345', 'BSc', 'Data Science'),
(252, 'Student DS7', '2nd', 'ds7', '12345', 'BSc', 'Data Science'),
(253, 'Student DS8', '1st', 'ds8', '12345', 'BSc', 'Data Science'),
(254, 'Student DS9', '4th', 'ds9', '12345', 'BSc', 'Data Science'),
(255, 'Student DS10', '3rd', 'ds10', '12345', 'BSc', 'Data Science'),
(256, 'Student DS11', '2nd', 'ds11', '12345', 'BSc', 'Data Science'),
(257, 'Student DS12', '1st', 'ds12', '12345', 'BSc', 'Data Science'),
(258, 'Student DS13', '4th', 'ds13', '12345', 'BSc', 'Data Science'),
(259, 'Student DS14', '3rd', 'ds14', '12345', 'BSc', 'Data Science'),
(260, 'Student DS15', '2nd', 'ds15', '12345', 'BSc', 'Data Science')
ON CONFLICT (Std_id) DO NOTHING;

-- Cyber Security Students 261-275
INSERT INTO Student (Std_id, Std_name, Level, Username, Password, Degree, Faculty)
VALUES
(261, 'Student CSec1', '4th', 'csec1', '12345', 'BSc', 'Cyber Security'),
(262, 'Student CSec2', '3rd', 'csec2', '12345', 'BSc', 'Cyber Security'),
(263, 'Student CSec3', '2nd', 'csec3', '12345', 'BSc', 'Cyber Security'),
(264, 'Student CSec4', '1st', 'csec4', '12345', 'BSc', 'Cyber Security'),
(265, 'Student CSec5', '4th', 'csec5', '12345', 'BSc', 'Cyber Security'),
(266, 'Student CSec6', '3rd', 'csec6', '12345', 'BSc', 'Cyber Security'),
(267, 'Student CSec7', '2nd', 'csec7', '12345', 'BSc', 'Cyber Security'),
(268, 'Student CSec8', '1st', 'csec8', '12345', 'BSc', 'Cyber Security'),
(269, 'Student CSec9', '4th', 'csec9', '12345', 'BSc', 'Cyber Security'),
(270, 'Student CSec10', '3rd', 'csec10', '12345', 'BSc', 'Cyber Security'),
(271, 'Student CSec11', '2nd', 'csec11', '12345', 'BSc', 'Cyber Security'),
(272, 'Student CSec12', '1st', 'csec12', '12345', 'BSc', 'Cyber Security'),
(273, 'Student CSec13', '4th', 'csec13', '12345', 'BSc', 'Cyber Security'),
(274, 'Student CSec14', '3rd', 'csec14', '12345', 'BSc', 'Cyber Security'),
(275, 'Student CSec15', '2nd', 'csec15', '12345', 'BSc', 'Cyber Security')
ON CONFLICT (Std_id) DO NOTHING;

-- =======================
-- Courses 
-- =======================
INSERT INTO Course (Course_id, Course_name, Dep_id) VALUES
-- Computer Science
(301, 'Database Systems', 1),
(302, 'Web Programming', 1),
(303, 'Operating Systems', 1),
(304, 'Software Engineering', 1),
(305, 'Computer Networks', 1),
-- Information Systems
(306, 'Systems Analysis', 2),
(307, 'E-Business Systems', 2),
(308, 'Management Info Systems', 2),
(309, 'Decision Support', 2),
(310, 'ERP Systems', 2),
-- Artificial Intelligence
(311, 'Machine Learning', 3),
(312, 'Deep Learning', 3),
(313, 'Natural Language Processing', 3),
(314, 'Computer Vision', 3),
(315, 'AI Ethics', 3),
-- Data Science
(316, 'Data Mining', 4),
(317, 'Big Data Analytics', 4),
(318, 'Predictive Analytics', 4),
(319, 'Data Visualization', 4),
(320, 'Statistical Methods', 4),
-- Cyber Security
(321, 'Network Security', 5),
(322, 'Ethical Hacking', 5),
(323, 'Cryptography', 5),
(324, 'Digital Forensics', 5),
(325, 'Cyber Laws', 5)
ON CONFLICT (Course_id) DO NOTHING;

-- =======================
-- courses for students
-- =======================
-- Computer Science Students
INSERT INTO Course_Student (Course_id, Std_id) VALUES
(301, 201),(302,201),(303,201),(304,201),(305,201),
(302,202),(303,202),(304,202),(305,202),
(301,203),(303,203),(304,203),(305,203),
(301,204),(302,204),(303,204),(304,204),
(301,205),(302,205),(303,205),
(301,206),(302,206),(304,206),(305,206),
(302,207),(303,207),(304,207),
(301,208),(302,208),(305,208),
(301,209),(303,209),(304,209),(305,209),
(302,210),(303,210),(304,210),
(301,211),(302,211),(305,211),
(301,212),(303,212),(304,212),
(302,213),(303,213),(305,213),
(301,214),(302,214),(304,214),
(301,215),(303,215),(305,215)
ON CONFLICT (Course_id, Std_id) DO NOTHING;

-- Information Systems Students
INSERT INTO Course_Student (Course_id, Std_id) VALUES
(306,216),(307,216),(308,216),(309,216),
(306,217),(308,217),(310,217),
(307,218),(308,218),(309,218),
(306,219),(307,219),(310,219),
(306,220),(307,220),(308,220),
(306,221),(309,221),(310,221),
(307,222),(308,222),(309,222),
(306,223),(307,223),(310,223),
(308,224),(309,224),(310,224),
(306,225),(307,225),(308,225),
(306,226),(308,226),(309,226),
(307,227),(308,227),(310,227),
(306,228),(307,228),(308,228),
(306,229),(309,229),(310,229),
(307,230),(308,230),(310,230)
ON CONFLICT (Course_id, Std_id) DO NOTHING;

-- Artificial Intelligence Students
INSERT INTO Course_Student (Course_id, Std_id) VALUES
(311,231),(312,231),(313,231),
(311,232),(314,232),(315,232),
(311,233),(312,233),(313,233),
(311,234),(312,234),(314,234),
(311,235),(313,235),(315,235),
(312,236),(313,236),(314,236),
(311,237),(312,237),(315,237),
(313,238),(314,238),(315,238),
(311,239),(312,239),(313,239),
(311,240),(314,240),(315,240),
(312,241),(313,241),(314,241),
(311,242),(312,242),(315,242),
(313,243),(314,243),(315,243),
(311,244),(312,244),(313,244),
(311,245),(314,245),(315,245)
ON CONFLICT (Course_id, Std_id) DO NOTHING;

-- Data Science Students
INSERT INTO Course_Student (Course_id, Std_id) VALUES
(316,246),(317,246),(318,246),
(316,247),(319,247),(320,247),
(316,248),(317,248),(318,248),
(316,249),(319,249),(320,249),
(316,250),(317,250),(318,250),
(316,251),(319,251),(320,251),
(316,252),(317,252),(318,252),
(316,253),(319,253),(320,253),
(316,254),(317,254),(318,254),
(316,255),(319,255),(320,255),
(316,256),(317,256),(318,256),
(316,257),(319,257),(320,257),
(316,258),(317,258),(318,258),
(316,259),(319,259),(320,259),
(316,260),(317,260),(318,260)
ON CONFLICT (Course_id, Std_id) DO NOTHING;

-- Cyber Security Students
INSERT INTO Course_Student (Course_id, Std_id) VALUES
(321,261),(322,261),(323,261),
(321,262),(324,262),(325,262),
(321,263),(322,263),(323,263),
(321,264),(324,264),(325,264),
(321,265),(322,265),(323,265),
(321,266),(324,266),(325,266),
(321,267),(322,267),(323,267),
(321,268),(324,268),(325,268),
(321,269),(322,269),(323,269),
(321,270),(324,270),(325,270),
(321,271),(322,271),(323,271),
(321,272),(324,272),(325,272),
(321,273),(322,273),(323,273),
(321,274),(324,274),(325,274),
(321,275),(322,275),(323,275)
ON CONFLICT (Course_id, Std_id) DO NOTHING;

-- =======================
-- exam for courses
-- =======================
INSERT INTO Exam (Exam_id, Course_id, Total_mark, Exam_date, Pass_score) VALUES
-- Computer Science
(401,301,100,'2025-01-10',60),
(402,302,100,'2025-01-12',60),
(403,303,100,'2025-01-15',60),
(404,304,100,'2025-01-18',60),
(405,305,100,'2025-01-20',60),
-- Information Systems
(406,306,100,'2025-01-22',60),
(407,307,100,'2025-01-25',60),
(408,308,100,'2025-01-28',60),
(409,309,100,'2025-01-30',60),
(410,310,100,'2025-02-02',60),
-- Artificial Intelligence
(411,311,100,'2025-02-05',60),
(412,312,100,'2025-02-08',60),
(413,313,100,'2025-02-10',60),
(414,314,100,'2025-02-12',60),
(415,315,100,'2025-02-15',60),
-- Data Science
(416,316,100,'2025-02-18',60),
(417,317,100,'2025-02-20',60),
(418,318,100,'2025-02-22',60),
(419,319,100,'2025-02-25',60),
(420,320,100,'2025-02-28',60),
-- Cyber Security
(421,321,100,'2025-03-02',60),
(422,322,100,'2025-03-05',60),
(423,323,100,'2025-03-08',60),
(424,324,100,'2025-03-10',60),
(425,325,100,'2025-03-12',60)
ON CONFLICT (Exam_id) DO NOTHING;

-- =======================
--  Questions (2 question for each course)
-- =======================
INSERT INTO Question (Ques_id, Correct_ans, Mark_ques, Content) VALUES
(501,'A',5,'Q1 Course 301'),
(502,'B',5,'Q2 Course 301'),
(503,'C',5,'Q1 Course 302'),
(504,'D',5,'Q2 Course 302'),
(505,'A',5,'Q1 Course 303'),
(506,'B',5,'Q2 Course 303'),
(507,'C',5,'Q1 Course 304'),
(508,'D',5,'Q2 Course 304'),
(509,'A',5,'Q1 Course 305'),
(510,'B',5,'Q2 Course 305')
ON CONFLICT (Ques_id) DO NOTHING;

-- =======================
-- exam-question
-- =======================
INSERT INTO Exam_Question (Exam_id, Ques_id) VALUES
(401,501),(401,502),
(402,503),(402,504),
(403,505),(403,506),
(404,507),(404,508),
(405,509),(405,510)
ON CONFLICT (Exam_id, Ques_id) DO NOTHING;

-- =======================
-- exam-student
-- =======================

INSERT INTO Exam_Student (Exam_id, Std_id)
SELECT e.Exam_id, cs.Std_id
FROM Course_Student cs
JOIN Exam e ON cs.Course_id = e.Course_id
ON CONFLICT (Exam_id, Std_id) DO NOTHING;


-- =======================
-- enter student answer for exam and each question
-- =======================
INSERT INTO Answer (Std_id, Exam_id, Ques_id, Mark_obtained, Is_correct, Select_ans)
SELECT 
    es.Std_id,
    es.Exam_id,
    eq.Ques_id,
    (1 + random()*4)::int AS Mark_obtained, 
    CASE WHEN random() < 0.5 THEN TRUE ELSE FALSE END AS Is_correct,  
    CASE WHEN random() < 0.5 THEN 'A'
         WHEN random() < 0.67 THEN 'B'
         WHEN random() < 0.83 THEN 'C'
         ELSE 'D' END AS Select_ans
FROM Exam_Student es
JOIN Exam_Question eq ON es.Exam_id = eq.Exam_id
ON CONFLICT (Std_id, Exam_id, Ques_id) DO NOTHING;
-- ===============================
-- Assign professors to courses
-- ===============================
INSERT INTO Course_Prof (Course_id, Prof_id) VALUES
(301,101),(302,101),(303,101),(304,101),(305,101),
(306,102),(307,102),(308,102),(309,102),(310,102),
(311,103),(312,103),(313,103),(314,103),(315,103),
(316,104),(317,104),(318,104),(319,104),(320,104),
(321,105),(322,105),(323,105),(324,105),(325,105)
ON CONFLICT (Course_id, Prof_id) DO NOTHING;

-- =======================
-- evaluation for professor and courses  (1-10)
-- =======================

INSERT INTO Evaluation (Prof_id, Course_id, Std_id, Professor_rating, Course_rating)
SELECT cp.Prof_id, cs.Course_id, cs.Std_id,
       (1 + random()*9)::int,  -- professor rating 1-10
       (1 + random()*9)::int   -- course rating 1-10
FROM Course_Student cs
JOIN Course_Prof cp ON cs.Course_id = cp.Course_id
WHERE cs.Std_id IS NOT NULL AND cp.Prof_id IS NOT NULL
ON CONFLICT (Std_id, Prof_id, Course_id) DO NOTHING;

-- ================================
--    queries
-- ================================
--1
SELECT 
    s.Std_id,
    s.Std_name,
    c.Course_id,
    c.Course_name,
    COALESCE(SUM(a.Mark_obtained), 0) AS Total_Mark
FROM Student s
JOIN Course_Student cs ON s.Std_id = cs.Std_id
JOIN Course c ON cs.Course_id = c.Course_id
LEFT JOIN Exam e ON c.Course_id = e.Course_id
LEFT JOIN Answer a ON a.Std_id = s.Std_id AND a.Exam_id = e.Exam_id
GROUP BY s.Std_id, s.Std_name, c.Course_id, c.Course_name
ORDER BY s.Std_id, c.Course_id;

--2
SELECT
    d.Dep_name AS Department,
    c.Course_name,
    p.Prof_name,
    ROUND(AVG(e.Professor_rating)::numeric,1) AS Avg_Professor_Rating,
    ROUND(AVG(e.Course_rating)::numeric,1) AS Avg_Course_Rating
FROM Department d
JOIN Course c ON c.Dep_id = d.Dep_id
JOIN Course_Prof cp ON cp.Course_id = c.Course_id
JOIN Professor p ON p.Prof_id = cp.Prof_id
JOIN Evaluation e ON e.Prof_id = p.Prof_id AND e.Course_id = c.Course_id
WHERE d.head_id = 102  -- Prof_id رئيس القسم المطلوب
GROUP BY d.Dep_name, c.Course_name, p.Prof_name
ORDER BY c.Course_name;

--3
SELECT *
FROM (
    SELECT 
        s.Std_id,
        s.Std_name,
        c.Course_id,
        c.Course_name,
        SUM(a.Mark_obtained) AS Total_obtained_mark,
        ex.Total_mark AS Exam_total_mark,
        ROUND((SUM(a.Mark_obtained)/ex.Total_mark)*100, 2) AS Percentage,
        ROW_NUMBER() OVER (PARTITION BY c.Course_id ORDER BY SUM(a.Mark_obtained) DESC) AS rn
    FROM Student s
    JOIN Exam_Student es ON s.Std_id = es.Std_id
    JOIN Exam ex ON es.Exam_id = ex.Exam_id
    JOIN Course c ON ex.Course_id = c.Course_id
    JOIN Answer a ON a.Std_id = s.Std_id AND a.Exam_id = ex.Exam_id
    GROUP BY s.Std_id, s.Std_name, c.Course_id, c.Course_name, ex.Total_mark
) sub
WHERE rn <= 10
ORDER BY sub.Course_id, sub.rn;

--4
WITH AvgRatings AS (
    SELECT 
        cp.Course_id,
        cp.Prof_id,
        ROUND(AVG(e.Professor_rating)::numeric,1) AS AvgRating
    FROM Course_Prof cp
    JOIN Evaluation e 
      ON cp.Prof_id = e.Prof_id AND cp.Course_id = e.Course_id
    GROUP BY cp.Course_id, cp.Prof_id
)

SELECT 
    a.Course_id,
    c.Course_name,
    a.Prof_id,
    p.Prof_name,
    a.AvgRating
FROM AvgRatings a
JOIN Course c ON a.Course_id = c.Course_id
JOIN Professor p ON a.Prof_id = p.Prof_id
WHERE (a.Course_id, a.AvgRating) IN (
    SELECT Course_id, MAX(AvgRating)
    FROM AvgRatings
    GROUP BY Course_id
)
ORDER BY a.Course_id;
